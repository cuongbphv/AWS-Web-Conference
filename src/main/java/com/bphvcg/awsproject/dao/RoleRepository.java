package com.bphvcg.awsproject.dao;

import org.springframework.data.repository.CrudRepository;

import com.bphvcg.awsproject.model.Role;


public interface RoleRepository extends CrudRepository<Role, Integer> {

    Role findByName(String name);

}