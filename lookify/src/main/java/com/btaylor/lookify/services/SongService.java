package com.btaylor.lookify.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.btaylor.lookify.models.Song;
import com.btaylor.lookify.repositories.SongRepository;

@Service
public class SongService {
    
    private final SongRepository songRepository;
    
    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }
   
    public List<Song> allSongs() {
        return songRepository.findAll();
    }
    
    public List<Song> topTen(){ 
    	return songRepository.findTop10ByOrderByRatingDesc();
    }
    
    public List<Song> searchByArtist(String query){
    	return songRepository.findByArtistContaining(query);
    }
   
    public Song createSong(Song s) {
        return songRepository.save(s);
    }
   
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
 
    
    public Song updateSong(Song song) {
    	return songRepository.save(song);
    }
    
    public void deleteSong(Long id) {
    	songRepository.deleteById(id);
    }
}