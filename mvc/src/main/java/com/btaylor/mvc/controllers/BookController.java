package com.btaylor.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btaylor.mvc.models.Book;
import com.btaylor.mvc.services.BookService;

@Controller
@RequestMapping("books")
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@GetMapping("{bookId}")
	public String index(@PathVariable("bookId") Long bookId, Model model) {
		
		Book book = bookService.findBook(bookId);
		model.addAttribute("book", book);
		
		return "show.jsp";
	}
	
	@GetMapping("")
	public String index(Model model) {
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "index.jsp";
	}
	
	@GetMapping("add")
	public String form() {
		return "add.jsp";
	}
	
	@PostMapping("add")
	public String create(
		@RequestParam("title") String title,
		@RequestParam("description") String description, 
		@RequestParam("language") String language,
		@RequestParam("pages") Integer pages
			)
	{
		Book book = new Book(title, description, language, pages);
		bookService.createBook(book);
		return "redirect:";
	}
	
}
