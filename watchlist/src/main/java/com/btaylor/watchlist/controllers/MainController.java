package com.btaylor.watchlist.controllers;

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

import com.btaylor.watchlist.models.Movie;
import com.btaylor.watchlist.models.User;
import com.btaylor.watchlist.services.MovieService;
import com.btaylor.watchlist.services.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	
	@Autowired
	MovieService movieService;
	
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		User user = userService.findUserById((Long)session.getAttribute("id"));
	
		model.addAttribute("globalWatchlist", movieService.allMoviesByYear());
		model.addAttribute("yourWatchlist", movieService.allMoviesContainingUser(user));
		model.addAttribute("user", user);
		
		return "/views/dashboard.jsp";
	}
	
	@GetMapping("/movies/new")
	public String newMovie(
			@ModelAttribute("movie") Movie movie, HttpSession session, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		model.addAttribute("id", (Long)session.getAttribute("id"));
		return "/views/newMovie.jsp";
	}
	
	@PostMapping("/movies/new")
	public String addMovie(
			@Valid @ModelAttribute("movie") Movie movie, 
			BindingResult result, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		if (result.hasErrors())
			return "/views/newMovie.jsp";
		else {
			movieService.createMovie(movie);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/movies/{id}")
	public String showMovie(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Movie movie = movieService.findMovieById(id);
		model.addAttribute("movie", movie);
		model.addAttribute("id", (Long)session.getAttribute("id"));
		return "/views/showMovie.jsp";
	}
	
	
	
	@GetMapping("/movies/{id}/edit")
	public String editMovie(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Movie movie = movieService.findMovieById(id);
		model.addAttribute("movie", movie);
		model.addAttribute("id", (Long)session.getAttribute("id"));
		return "/views/editMovie.jsp";
	}
	
	@PutMapping("/movies/{id}/edit")
	public String updateMovie(@Valid @ModelAttribute("movie") Movie movie, 
			BindingResult result, HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Movie thisMovie = movieService.findMovieById(id);
		
		if (result.hasErrors()) {
			model.addAttribute("thisMovie", thisMovie);
			model.addAttribute("id", (Long)session.getAttribute("id"));
			return "/views/editMovie.jsp";
		}
		else {
			movie.setUsers(thisMovie.getUsers());
			movieService.updateMovie(movie);
			return "redirect:/dashboard";
		}
	}
	
	@PutMapping("/movies/{id}/join")
	public String joinMovie(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		User thisUser = userService.findUserById((Long)session.getAttribute("id"));
		Movie thisMovie = movieService.findMovieById(id);
		thisMovie.getUsers().add(thisUser);
		movieService.updateMovie(thisMovie);
		
		return "redirect:/dashboard";
	}
	
	@PutMapping("/movies/{id}/cancel")
	public String leaveMovie(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
	
		User thisUser = userService.findUserById((Long)session.getAttribute("id"));
		Movie thisMovie = movieService.findMovieById(id);
		
		List<User> users = thisMovie.getUsers();
		for(int i = 0; i < users.size(); i++) {
			if (users.get(i).equals(thisUser))
				users.remove(i);
		}
		thisMovie.setUsers(users);
		
		movieService.updateMovie(thisMovie);
		
		return "redirect:/dashboard";
	}
	
	@DeleteMapping("/movies/{id}/delete")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		movieService.deleteMovie(id);
		return "redirect:/dashboard";
	}

}