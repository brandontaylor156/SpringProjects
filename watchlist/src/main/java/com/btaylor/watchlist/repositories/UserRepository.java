package com.btaylor.watchlist.repositories;

import org.springframework.data.repository.CrudRepository;

import com.btaylor.watchlist.models.User;


public interface UserRepository extends CrudRepository<User, Long> {
	User findByEmailIs(String email);
	User findByIdIs(Long id);
}