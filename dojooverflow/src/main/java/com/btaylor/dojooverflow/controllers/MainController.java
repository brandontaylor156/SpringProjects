package com.btaylor.dojooverflow.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btaylor.dojooverflow.models.Answer;
import com.btaylor.dojooverflow.models.Question;
import com.btaylor.dojooverflow.models.Tag;
import com.btaylor.dojooverflow.services.AnswerService;
import com.btaylor.dojooverflow.services.QuestionService;
import com.btaylor.dojooverflow.services.TagService;

@Controller
public class MainController {
	@Autowired
	QuestionService questionService;
	
	@Autowired
	TagService tagService;
	
	@Autowired
	AnswerService answerService;
	
	@GetMapping("/")
	public String dashboard() {
		return "redirect:/questions";
	}
	
	@GetMapping("/questions")
	public String dashboard(Model model) {
		List<Question> questions = questionService.allQuestions();
		model.addAttribute("questions", questions);
		return "/views/dashboard.jsp";
	}
	
	@GetMapping("/questions/new")
	public String newQuestion(@ModelAttribute("Question") Question question) {
		return "/views/newQuestion.jsp";
	}
	
	@PostMapping("/questions/new")
	public String addQuestion(
			@Valid @ModelAttribute("Question") Question question, 
			BindingResult result,
			@RequestParam("list") String list,
			Model model) {
		
		// THIS IS FOR QUESTION ERRORS, TAG ERRORS SEPARATE BECAUSE OF REQUESTPARAM
		if (result.hasErrors())
			return "/views/newQuestion.jsp";
		else {
			// Takes string and converts it to list if valid (below for function)
			List<Tag> questionTags = checkTags(list);
			
			if(questionTags!=null) {
				question.setTags(questionTags);
				questionService.createQuestion(question);
			}
			else {
				model.addAttribute("errorMsg", "You can only enter up to three tags (lowercase and separated by comma)");
				return "/views/newQuestion.jsp";
			}
			
			return "redirect:/questions";
		}
	}
	
	@GetMapping("/questions/{id}")
	public String showQuestion(
			@PathVariable("id") Long id, 
			Model model, 
			@ModelAttribute("Answer") Answer answer) {
		Question question = questionService.findQuestionById(id);
		model.addAttribute("question", question);
		
		return "/views/showQuestion.jsp";
	}
	
	@PostMapping("/questions/{id}")
	public String answerQuestion(
			@Valid @ModelAttribute("Answer") Answer answer,
			BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors())
			return "/views/showQuestion.jsp";
		else {
			answerService.createAnswer(answer);
			return "redirect:/questions/" + id;
		}
	}
	
	private List<Tag> checkTags(String tagString){
		// Gets rid of front and back whitespace of string as a whole, separates by commas
		String[] splitTags = tagString.trim().split(",");
		
		// Empty list for tags
		List<Tag> tempTags = new ArrayList<>();
		
		// Return null if more than 3 tags
		if (splitTags.length>3) {
			return null;
		}
		
		
		for(String s: splitTags) {
			// convert every element to trimmed and lowercase 
			s = s.trim().toLowerCase();
			if(tagService.findTagBySubject(s)==null && s.length()>0) {
				tempTags.add(new Tag(s));
			}
			else {
				tempTags.add(tagService.findTagBySubject(s));
			}
		}
		return tempTags;
	}
	
}
