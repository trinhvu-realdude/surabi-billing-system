/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hcl.project.service;

import com.hcl.project.dao.ItemDAO;
import java.sql.*;
import com.hcl.project.dbconnect.DBConnection;
import com.hcl.project.model.Item;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class ItemService implements ItemDAO {

    private Connection connection = DBConnection.getConnection();

    private static class ItemDAOHelper {

        private static final ItemService INSTANCE = new ItemService();
    }

    private ItemService() {

    }

    public static ItemService getInstance() {
        return ItemDAOHelper.INSTANCE;
    }

    @Override
    public List<Item> getAllItems() {
        List<Item> items = new ArrayList<>();

        try {
            String sql = "SELECT * FROM items";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");

                items.add(new Item.ItemBuilder().setId(id).setName(name).setPrice(price).build());
            }
        } catch (SQLException e) {
            System.err.println("Data error!");
        }

        return items;
    }

}
