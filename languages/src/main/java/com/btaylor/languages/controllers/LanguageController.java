package com.btaylor.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.btaylor.languages.models.Language;
import com.btaylor.languages.services.LanguageService;

@Controller
@RequestMapping("languages")
public class LanguageController {
	
	@Autowired
	LanguageService languageService;
	
	@GetMapping("")
	public String index(@ModelAttribute("language") Language language, Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "/languages/dashboard.jsp";
	}
	
	@PostMapping("add")
	public String create(
		@Valid @ModelAttribute("language") Language language,
		BindingResult result, Model model)
	{
		if (result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("languages", languages);
			return "/languages/dashboard.jsp";
		}
		languageService.createLanguage(language);
		return "redirect:";
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "/languages/edit.jsp";
	}
	
	@PutMapping("edit/{id}")
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors())
			return "/languages/edit.jsp";
		else {
			languageService.updateLanguage(language);
			return "redirect:/languages";
		}
		
	}
	
	@GetMapping("{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "/languages/show.jsp";
	}
	
	@DeleteMapping("{id}")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
}
