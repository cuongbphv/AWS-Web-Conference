package com.bphvcg.awsproject.service;

import com.bphvcg.awsproject.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
