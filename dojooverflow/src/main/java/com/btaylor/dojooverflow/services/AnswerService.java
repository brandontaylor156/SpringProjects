package com.btaylor.dojooverflow.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.dojooverflow.models.Answer;
import com.btaylor.dojooverflow.repositories.AnswerRepository;

@Service
public class AnswerService {
    @Autowired
    AnswerRepository answerRepository;
   
    public List<Answer> allAnswers() {
        return answerRepository.findAll();
    }
    
    public Answer createAnswer(Answer a) {
        return answerRepository.save(a);
    }
   
    public Answer findAnswer(Long id) {
        Optional<Answer> optionalAnswer = answerRepository.findById(id);
        if(optionalAnswer.isPresent()) {
            return optionalAnswer.get();
        } else {
            return null;
        }
    }
    
 
   
}