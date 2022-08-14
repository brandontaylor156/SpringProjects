package com.btaylor.dojooverflow.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.btaylor.dojooverflow.models.Answer;
import com.btaylor.dojooverflow.models.Question;

@Repository
public interface AnswerRepository extends CrudRepository<Answer, Long> {
	List<Answer> findAll();
	List<Answer> findAllByQuestion(Question question);
}

