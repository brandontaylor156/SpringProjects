package com.btaylor.dojooverflow.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.dojooverflow.models.Question;
import com.btaylor.dojooverflow.models.Tag;
import com.btaylor.dojooverflow.repositories.QuestionRepository;

@Service
public class QuestionService {
	@Autowired
	QuestionRepository questionRepository;
	
	public List<Question> allQuestions() {
		return questionRepository.findAll();
	} 
	
	public Question findQuestionById(Long id) {
		return questionRepository.findByIdIs(id);
	}
	
	public List<Question> allQuestionsByTag(Tag tag){
		return questionRepository.findAllByTags(tag);
	}
	
	public List<Question> allQuestionsByNotTag(Tag tag){
		return questionRepository.findByTagsNotContains(tag);
	}
	
	public Question createQuestion(Question q) {
		return questionRepository.save(q);
	}
	
	public Question updateQuestion(Question q) {
    	return questionRepository.save(q);
    }
	
	public void deleteQuestion(Long id) {
    	questionRepository.deleteById(id);
    }
}
