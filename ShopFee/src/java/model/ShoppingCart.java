/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of ShoppingCart table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class ShoppingCart {

    protected int cart_ID;
    protected int user_ID;
    protected int product_ID;
    protected String brand;
    protected String image;
    protected String product_name;
    protected double price;    
    protected double discount;
    protected int quantity;
    protected int stock_quantity;

    public ShoppingCart() {
    }

    public ShoppingCart(int cart_ID, int user_ID, int product_ID, String brand, String image, String product_name, double price, double discount, int quantity, int stock_quantity) {
        this.cart_ID = cart_ID;
        this.user_ID = user_ID;
        this.product_ID = product_ID;
        this.brand = brand;
        this.image = image;
        this.product_name = product_name;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.stock_quantity = stock_quantity;
    }

    public int getCart_ID() {
        return cart_ID;
    }

    public void setCart_ID(int cart_ID) {
        this.cart_ID = cart_ID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStock_quantity() {
        return stock_quantity;
    }

    public void setStock_quantity(int stock_quantity) {
        this.stock_quantity = stock_quantity;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    
}
