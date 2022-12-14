package com.example.studentroster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.studentroster.models.Dorm;

public interface DormRepository extends CrudRepository<Dorm, Long> {
	List<Dorm> findAll();
}
