package com.btaylor.counter.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/your_server")
public class HomeController {
	
	@RequestMapping("/")
	public String counter(Model model) {
		
		return "fruitStore.jsp";
	}
}
