package com.btaylor.authentication.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
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

import com.btaylor.authentication.models.Book;
import com.btaylor.authentication.models.User;
import com.btaylor.authentication.services.BookService;
import com.btaylor.authentication.services.UserService;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/books")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("username")==null)
			return "redirect:/";
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		model.addAttribute("userId", session.getAttribute("id"));
		return "/views/books.jsp";
	}
	
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book, HttpSession session, Model model) {
		if (session.getAttribute("username")==null)
			return "redirect:/";
		User user = userService.findUser((Long)session.getAttribute("id"));
		model.addAttribute("user", user);
		return "/views/newBook.jsp";
	}
	
	@GetMapping("/books/{id}")
	public String showBook(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("username")==null)
			return "redirect:/";
		Book book = bookService.findBookById(id);
		model.addAttribute("book", book);
		model.addAttribute("userId", session.getAttribute("id"));
		return "/views/showBook.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String editBook(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("username")==null)
			return "redirect:/";
		Book book = bookService.findBookById(id);
		model.addAttribute("book", book);
		model.addAttribute("userId", session.getAttribute("id"));
		return "/views/editBook.jsp";
	}
	
	@PostMapping("/books/new")
	public String addBook(@Valid @ModelAttribute("book") Book book, 
			BindingResult result) {
		if (result.hasErrors())
			return "/views/newBook.jsp";
		else {
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	
	@PutMapping("/books/{id}/edit")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors())
			return "editBook.jsp";
		else {
			bookService.updateBook(book);
			return "redirect:/books/" + book.getId();
		}
		
	}
	
	@DeleteMapping("/books/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
	
}
