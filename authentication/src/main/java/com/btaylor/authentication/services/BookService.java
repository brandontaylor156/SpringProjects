package com.btaylor.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.authentication.models.Book;
import com.btaylor.authentication.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired 
	private BookRepository bookRepository;
	
	public List<Book> allBooks(){
		return bookRepository.findAll();
	}
	
	public Book createBook(Book b) {
		return bookRepository.save(b);
	}
	
	public Book findBookById(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if (optionalBook.isPresent())
			return optionalBook.get();
		else
			return null;
	}
	
	public Book updateBook(Book book) {
    	return bookRepository.save(book);
    }
	
	public void deleteBook(Long id) {
    	bookRepository.deleteById(id);
    }
}
