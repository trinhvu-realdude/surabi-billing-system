/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hcl.project.model;

/**
 *
 * @author PC
 */
public class Item {

    private int id;
    private String name;
    private double price;

    public Item(ItemBuilder itemBuilder) {
        this.id = itemBuilder.id;
        this.name = itemBuilder.name;
        this.price = itemBuilder.price;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public static class ItemBuilder {

        private int id;
        private String name;
        private double price;

        public ItemBuilder() {

        }

        public ItemBuilder setId(int id) {
            this.id = id;
            return this;
        }

        public ItemBuilder setName(String name) {
            this.name = name;
            return this;
        }

        public ItemBuilder setPrice(double price) {
            this.price = price;
            return this;
        }

        public Item build() {
            return new Item(this);
        }
    }
}
