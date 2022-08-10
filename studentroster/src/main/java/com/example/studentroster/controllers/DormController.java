package com.example.studentroster.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.studentroster.models.Dorm;
import com.example.studentroster.services.DormService;
import com.example.studentroster.services.StudentService;

@Controller
public class DormController {
	@Autowired DormService dormService;
	@Autowired StudentService studentService;
	
	@GetMapping("/dorms")
	public String allDorms(Model model) {
		List<Dorm> dorms = dormService.allDorms();
		model.addAttribute("dorms", dorms);
		return "/views/dorms.jsp";
	}
	
	@GetMapping("/dorms/new")
	public String newDorm(@ModelAttribute("dorm") Dorm dorm) {
		return "/views/newDorm.jsp";
	}
	
	@PostMapping("/dorms/new")
	public String addDorm(@Valid @ModelAttribute("dorm") Dorm dorm, BindingResult result) {
		if (result.hasErrors())
			return "/views/newDorm.jsp";
		else {
			dormService.createDorm(dorm);
			return "redirect:/dorms";
		}
	}
	
	@GetMapping("/dorms/{id}")
	public String viewDorm(@PathVariable("id") Long id, Model model) {
		Dorm dorm = dormService.findDorm(id);
		model.addAttribute(dorm);
		return "/views/dormShow.jsp";
	}
	
}
