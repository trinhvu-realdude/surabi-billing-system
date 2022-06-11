package com.hcl.project.service;

import java.sql.*;
import com.hcl.project.dao.UserDAO;
import com.hcl.project.dbconnect.DBConnection;
import com.hcl.project.model.User;
import java.util.ArrayList;
import java.util.List;

public class UserService implements UserDAO {

    private Connection connection = DBConnection.getConnection();

    private static class UserDAOHelper {

        private static final UserService INSTANCE = new UserService();
    }

    private UserService() {

    }

    public static UserService getInstance() {
        return UserDAOHelper.INSTANCE;
    }

    @Override
    public void register(User user) {
        try {
            String sql = "INSERT INTO users (userName, password, roleId) VALUES (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getRoleId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Failed to register!");
        }
    }

    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                int roleId = rs.getInt("roleId");
                users.add(new User.UserBuilder(userName, password).setId(id).setRoleId(roleId).build());
            }
        } catch (SQLException e) {
            System.err.println("Data error!");
        }
        return users;
    }

    @Override
    public boolean isDuplicated(String username) {
        List<User> users = getAllUsers();

        for (User user : users) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }
}
