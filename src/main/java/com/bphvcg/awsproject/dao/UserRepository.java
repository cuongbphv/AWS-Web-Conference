package com.bphvcg.awsproject.dao;

import org.springframework.data.repository.CrudRepository;

import com.bphvcg.awsproject.model.User;


public interface UserRepository extends CrudRepository<User, Integer> {

    User findByUsername(String username);

}