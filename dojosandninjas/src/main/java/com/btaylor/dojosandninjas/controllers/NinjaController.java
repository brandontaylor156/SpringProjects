package com.btaylor.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.btaylor.dojosandninjas.models.Dojo;
import com.btaylor.dojosandninjas.models.Ninja;
import com.btaylor.dojosandninjas.services.DojoService;
import com.btaylor.dojosandninjas.services.NinjaService;

@Controller
public class NinjaController {
	
	@Autowired
	DojoService dojoService;
	
	@Autowired
	NinjaService ninjaService;
	
	@GetMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> allDojos = dojoService.allDojos();
		model.addAttribute("dojos", allDojos);
		return "/views/newNinja.jsp";
	}
	
	@PostMapping("/ninjas/new")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if (result.hasErrors())
			return "/views/newNinja.jsp";
		else {
			ninjaService.createNinja(ninja);
			return "redirect:/dashboard";
		}
	}
	
}

