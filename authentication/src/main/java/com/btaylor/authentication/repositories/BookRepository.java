package com.btaylor.authentication.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.btaylor.authentication.models.Book;

public interface BookRepository extends CrudRepository<Book, Long>{
	List<Book> findAll();
}
