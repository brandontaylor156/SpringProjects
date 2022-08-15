package com.btaylor.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.btaylor.events.models.Comment;
import com.btaylor.events.models.Event;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {
	List<Comment> findAll();
	List<Comment> findAllByEvent(Event event);
	Comment findByIdIs(Long id);
}