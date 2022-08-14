package com.btaylor.dojooverflow.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.dojooverflow.models.Question;
import com.btaylor.dojooverflow.models.Tag;
import com.btaylor.dojooverflow.repositories.TagRepository;

@Service
public class TagService {
	@Autowired
	TagRepository tagRepository;
	
	public List<Tag> allTags() {
		return tagRepository.findAll();
	} 
	
	public Tag findTagById(Long id) {
		return tagRepository.findByIdIs(id);
	}
	
	public Tag findTagBySubject(String subject) {
		return tagRepository.findBySubjectIs(subject);
	}
	
	
	public List<Tag> allTagsByQuestion(Question question){
		return tagRepository.findAllByQuestions(question);
	}
	
	public List<Tag> allTagsByNotQuestion(Question question){
		return tagRepository.findByQuestionsNotContains(question);
	}
	
	public Tag createTag(Tag t) {
		return tagRepository.save(t);
	}
	
	public Tag updateTag(Tag t) {
    	return tagRepository.save(t);
    }
	
	public void deleteTag(Long id) {
    	tagRepository.deleteById(id);
    }
}
