package com.btaylor.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.btaylor.authentication.models.LoginUser;
import com.btaylor.authentication.models.User;
import com.btaylor.authentication.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("username")==null)
			return "redirect:/";
		model.addAttribute("username", session.getAttribute("username"));
		return "/views/home.jsp";
	}
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/views/login.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {

		if(result.hasErrors() || userService.register(newUser, result)==null) {
			model.addAttribute("newLogin", new LoginUser());
			return "/views/login.jsp";
		}
		else {
			session.setAttribute("id", newUser.getId());
			session.setAttribute("username", newUser.getUsername());
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/views/login.jsp";
		}
		else {
			User loggedUser = userService.login(newLogin, result);
			session.setAttribute("id", loggedUser.getId());
			session.setAttribute("username", loggedUser.getUsername());
			return "redirect:/home";
		}
	}
}
