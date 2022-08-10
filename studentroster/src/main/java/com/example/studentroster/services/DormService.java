package com.example.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.studentroster.models.Dorm;
import com.example.studentroster.repositories.DormRepository;

@Service
public class DormService {
	private final DormRepository dormRepository;
	
	public DormService(DormRepository dormRepository) {
		this.dormRepository = dormRepository;
	}
	
	public List<Dorm> allDorms(){
		return dormRepository.findAll();
	}
	
	public Dorm createDorm(Dorm d) {
		return dormRepository.save(d);
	}
	
	public Dorm findDorm(Long id) {
		Optional<Dorm> optionalDorm = dormRepository.findById(id);
		if(optionalDorm.isPresent()) {
            return optionalDorm.get();
        } else {
            return null;
        }
	}
}
