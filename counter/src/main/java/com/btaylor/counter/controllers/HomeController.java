package com.btaylor.counter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/your_server")
public class HomeController {
	
	@RequestMapping("")
	public String index(HttpSession session) {
		if (session.getAttribute("count") == null)
			session.setAttribute("count", 0);
		else {
			Integer newCount = (Integer) session.getAttribute("count");
			newCount++;
			session.setAttribute("count", newCount);
		}
		return "index.jsp";
	} 
	
	@RequestMapping("counter")
	public String counter(HttpSession session, Model model) {
		if (session.getAttribute("count") == null)
			session.setAttribute("count", 0);
		
		Integer count = (Integer) session.getAttribute("count");
		model.addAttribute("count", count);
		return "counter.jsp";
	}
	
}
