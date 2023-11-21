/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of Order Items table.
 * @date: Oct 16, 2023
 * @author: PhiNX
 */
public class OrderItems {

    protected int orderitemID;
    protected int orderID;
    protected String model;
    protected String brand;
    protected String image;
    protected int quantity;
    protected double discount;
    protected double price;

    public OrderItems() {
    }

    public OrderItems(int orderitemID, int orderID, String model, String brand, String image, int quantity, double discount, double price) {
        this.orderitemID = orderitemID;
        this.orderID = orderID;
        this.model = model;
        this.brand = brand;
        this.image = image;
        this.quantity = quantity;
        this.discount = discount;
        this.price = price;
    }

    public int getOrderitemID() {
        return orderitemID;
    }

    public void setOrderitemID(int orderitemID) {
        this.orderitemID = orderitemID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
