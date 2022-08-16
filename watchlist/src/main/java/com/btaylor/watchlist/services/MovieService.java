package com.btaylor.watchlist.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.watchlist.models.Movie;
import com.btaylor.watchlist.models.User;
import com.btaylor.watchlist.repositories.MovieRepository;

@Service
public class MovieService {
	
	@Autowired
	MovieRepository movieRepository;
	
	public List<Movie> allMovies() {
		return movieRepository.findAll();
	} 
	
	public Movie findMovieById(Long id) {
		return movieRepository.findByIdIs(id);
	}
	
	public List<Movie> allMoviesContainingUser(User user){
		return movieRepository.findAllByCreatorOrderByYearAsc(user);
	}
	
	public Movie createMovie(Movie m) {
		return movieRepository.save(m);
	}
	
	public Movie updateMovie(Movie m) {
    	return movieRepository.save(m);
    }
	
	public void deleteMovie(Long id) {
    	movieRepository.deleteById(id);
    }
	
	public List<Movie> allMoviesByYear(){
		return movieRepository.findAllByOrderByYearAsc();
	}
}

