package com.example.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.studentroster.models.Student;
import com.example.studentroster.repositories.StudentRepository;

@Service
public class StudentService {
	private final StudentRepository studentRepository;
	
	public StudentService(StudentRepository studentRepository) {
		this.studentRepository = studentRepository;
	}
	
	public List<Student> allStudents(){
		return studentRepository.findAll();
	}
	
	public Student createStudent(Student s) {
		return studentRepository.save(s);
	}
	
	public Student findStudent(Long id) {
        Optional<Student> optionalStudent = studentRepository.findById(id);
        if(optionalStudent.isPresent()) {
            return optionalStudent.get();
        } else {
            return null;
        }
    }
	
	public void deleteStudent(Long id) {
		studentRepository.deleteById(id);
	}
 
}
