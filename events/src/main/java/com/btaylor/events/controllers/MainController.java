package com.btaylor.events.controllers;

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

import com.btaylor.events.models.Comment;
import com.btaylor.events.models.Event;
import com.btaylor.events.models.User;
import com.btaylor.events.services.CommentService;
import com.btaylor.events.services.EventService;
import com.btaylor.events.services.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	CommentService commentService;
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, @ModelAttribute("event") Event event) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		User user = userService.findUserById((Long)session.getAttribute("id"));
		
		model.addAttribute("stateEvents", eventService.allEventsContainingState(user.getState()));
		model.addAttribute("otherEvents", eventService.allEventsNotContainingState(user.getState()));
		model.addAttribute("user", user);
		
		return "/views/dashboard.jsp";
	}
	
	@PostMapping("/events/new")
	public String addEvent(
			@Valid @ModelAttribute("event") Event event, 
			BindingResult result, HttpSession session, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		if (result.hasErrors()) {
			User user = userService.findUserById((Long)session.getAttribute("id"));
			
			model.addAttribute("stateEvents", eventService.allEventsContainingState(user.getState()));
			model.addAttribute("otherEvents", eventService.allEventsNotContainingState(user.getState()));
			model.addAttribute("user", user);
			return "/views/dashboard.jsp";
		}
		else {
			eventService.createEvent(event);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/events/{id}")
	public String showComment(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("comment") Comment comment) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Event event = eventService.findEventById(id);
		model.addAttribute("event", event);
		model.addAttribute("id", (Long)session.getAttribute("id"));
		return "/views/showEvent.jsp";
	}
	
	@PostMapping("/events/{id}/comments")
	public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, 
			HttpSession session, Model model, @PathVariable("id") Long id) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Event event = eventService.findEventById(id);
		
		if (result.hasErrors()) {
			model.addAttribute("event", event);
			model.addAttribute("id", (Long)session.getAttribute("id"));
			return "/views/showEvent.jsp";
		}
		else {
			Comment newComment = new Comment(comment.getText(), comment.getEvent(), comment.getCommenter());
			commentService.createComment(newComment);
			return "redirect:/events/" + id;
		}
		
	}
	
	@GetMapping("/events/{id}/edit")
	public String editEvent(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Event event = eventService.findEventById(id);
		model.addAttribute("event", event);
		model.addAttribute("id", (Long)session.getAttribute("id"));
		return "/views/editEvent.jsp";
	}
	
	@PutMapping("/events/{id}/edit")
	public String updateEvent(@Valid @ModelAttribute("event") Event event, 
			BindingResult result, HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		Event thisEvent = eventService.findEventById(id);
		
		if (result.hasErrors()) {
			model.addAttribute("currentEvent", thisEvent);
			model.addAttribute("id", (Long)session.getAttribute("id"));
			return "/views/editEvent.jsp";
		}
		else {
			event.setUsers(thisEvent.getUsers());
			eventService.updateEvent(event);
			return "redirect:/dashboard";
		}
		
	}
	
	@PutMapping("/events/{id}/join")
	public String joinEvent(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		User thisUser = userService.findUserById((Long)session.getAttribute("id"));
		Event thisEvent = eventService.findEventById(id);
		thisEvent.getUsers().add(thisUser);
		eventService.updateEvent(thisEvent);
		
		return "redirect:/dashboard";
	}
	
	@PutMapping("/events/{id}/cancel")
	public String leaveEvent(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
	
		User thisUser = userService.findUserById((Long)session.getAttribute("id"));
		Event thisEvent = eventService.findEventById(id);
		
		List<User> users = thisEvent.getUsers();
		for(int i = 0; i < users.size(); i++) {
			if (users.get(i).equals(thisUser))
				users.remove(i);
		}
		thisEvent.setUsers(users);
		
		eventService.updateEvent(thisEvent);
		
		return "redirect:/dashboard";
	}
	

	@DeleteMapping("/events/{id}/delete")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("id")==null)
			return "redirect:/";
		
		eventService.deleteEvent(id);
		return "redirect:/dashboard";
	}
	
}
