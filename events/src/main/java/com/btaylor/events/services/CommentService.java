package com.btaylor.events.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.events.models.Comment;
import com.btaylor.events.repositories.CommentRepository;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;
   
    public List<Comment> allComments() {
        return commentRepository.findAll();
    }
    
    public Comment createComment(Comment c) {
        return commentRepository.save(c);
    }
   
    public Comment findComment(Long id) {
        return commentRepository.findByIdIs(id);
    }
}