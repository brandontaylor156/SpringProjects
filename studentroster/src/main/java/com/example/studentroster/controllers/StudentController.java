package com.example.studentroster.controllers;

import java.util.List;

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

import com.example.studentroster.models.Dorm;
import com.example.studentroster.models.Student;
import com.example.studentroster.services.DormService;
import com.example.studentroster.services.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	DormService dormService;
	
	@Autowired
	StudentService studentService;
	
	@GetMapping("/students/new")
	public String newStudent(@ModelAttribute("student") Student student, Model model) {
		List<Dorm> allDorms = dormService.allDorms();
		model.addAttribute("dorms", allDorms);
		return "/views/newStudent.jsp";
	}
	
	@PostMapping("/students/new")
	public String createStudent(@Valid @ModelAttribute("student") Student student, BindingResult result) {
		if (result.hasErrors())
			return "/views/newStudent.jsp";
		else {
			studentService.createStudent(student);
			Long id = student.getDorm().getId();
			return "redirect:/dorms/"+id;
		}
	}
	
	@GetMapping("/students/delete/{id}")
	public String deleteStudent(@PathVariable("id") Long id) {
		studentService.deleteStudent(id);
		return "redirect:/dorms";
	}
	
}