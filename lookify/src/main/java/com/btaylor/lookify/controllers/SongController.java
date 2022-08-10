package com.btaylor.lookify.controllers;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btaylor.lookify.models.Song;
import com.btaylor.lookify.services.SongService;

@Controller
public class SongController {
	
	@Autowired
	SongService songService;
	
	@GetMapping("/")
	public String index() {
		return "/views/index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String index(@ModelAttribute("song") Song song, Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "/views/dashboard.jsp";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(value="search") String search, Model model) {
		List<Song> foundSongs = songService.searchByArtist(search);
		model.addAttribute("foundSongs", foundSongs);
		model.addAttribute("query", search);
		return "/views/results.jsp";
	}
	
	@GetMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song song) {
		return "/views/add.jsp";
	}
	
	@PostMapping("/songs/new")
	public String create(
		@Valid @ModelAttribute("song") Song song,
		BindingResult result)
	{
		if (result.hasErrors()) {
			return "/views/add.jsp";
		}
		songService.createSong(song);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "/views/edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors())
			return "/views/edit.jsp";
		else {
			songService.updateSong(song);
			return "redirect:/songs";
		}
		
	}
	
	@GetMapping("/songs/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "/views/show.jsp";
	}
	
	@DeleteMapping("/songs/{id}")
	public String delete(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> topTen = songService.topTen();
		model.addAttribute("topTen", topTen);
		return "/views/top10.jsp";
	}
	
}
