package com.btaylor.counter.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/your_server")
public class HomeController {
	
	@RequestMapping("/")
	public String index(HttpSession session) {
		session.setAttribute("name", "Brandon");
		return "index.jsp";
	}
	
	@RequestMapping("/counter")
	public String counter(HttpSession session) {
		String userName = (String) session.getAttribute("name");
		System.out.println("The name is "+userName);
		return "counter.jsp";
	}
}
