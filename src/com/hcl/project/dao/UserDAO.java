package com.hcl.project.dao;

import com.hcl.project.model.User;
import java.util.List;

public interface UserDAO {
    void register(User user);
    
    User login(String username, String password);
    
    List<User> getAllUsers();
    
    boolean isDuplicated(String username);
}
