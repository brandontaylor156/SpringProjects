package com.btaylor.events.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.btaylor.events.models.LoginUser;
import com.btaylor.events.models.User;
import com.btaylor.events.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// Default route
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/views/login.jsp";
	}
	/**********************************************************************/
	// Routes in case user tries mapping to login/register
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/views/login.jsp";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/views/login.jsp";
	}
	/*********************************************************************/
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {

		User potentialUser =  userService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "/views/login.jsp";
		}
		else {
			session.setAttribute("id", newUser.getId());
			session.setAttribute("name", newUser.getFirstName());
			return "redirect:/dashboard";
		}
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {
		
		User potentialUser = userService.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/views/login.jsp";
		}
		else {
			User loggedUser = userService.login(newLogin, result);
			session.setAttribute("id", loggedUser.getId());
			session.setAttribute("name", loggedUser.getFirstName());
			return "redirect:/dashboard";
		}
	}
}

