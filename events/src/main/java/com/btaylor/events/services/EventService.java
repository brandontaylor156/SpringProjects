package com.btaylor.events.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.events.models.Event;
import com.btaylor.events.repositories.EventRepository;

@Service
public class EventService {
	
	@Autowired
	EventRepository eventRepository;
	
	public List<Event> allEvents() {
		return eventRepository.findAll();
	} 
	
	public Event findEventById(Long id) {
		return eventRepository.findByIdIs(id);
	}
	
	public List<Event> allEventsContainingState(String state){
		return eventRepository.findAllByState(state);
	}
	
	public List<Event> allEventsNotContainingState(String state){
		return eventRepository.findByStateNotContains(state);
	}
	
	public Event createEvent(Event e) {
		return eventRepository.save(e);
	}
	
	public Event updateEvent(Event e) {
    	return eventRepository.save(e);
    }
	
	public void deleteEvent(Long id) {
    	eventRepository.deleteById(id);
    }
}

