package com.btaylor.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.btaylor.authentication.models.LoginUser;
import com.btaylor.authentication.models.User;
import com.btaylor.authentication.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> optionalUser = userRepository.findByEmail(newUser.getEmail());
		
		if(optionalUser.isPresent()) 
			result.rejectValue("email", "Exists", "The Email Already Belongs to an Account");
		if(!(newUser.getPassword().equals(newUser.getConfirm()))) 
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
			
		if (result.hasErrors())
			return null;
		
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		userRepository.save(newUser);
        return newUser;
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		
		Optional<User> optionalUser = userRepository.findByEmail(newLoginObject.getEmail());
		
		if(!(optionalUser.isPresent())) {
			result.rejectValue("email", "Not Present", "The Email NOT Present");
			return null;
		}
			
		User user = optionalUser.get();
			
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
			return null;
		}
		return user;
		
	}	
	
	public User findUser(Long id) {
        Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }
}
