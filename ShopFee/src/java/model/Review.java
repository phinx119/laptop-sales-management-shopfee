/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 * @purpose: Represent data of Review table.
 * @date: Sep 16, 2023
 * @author: AnNT
 */
public class Review {

    protected int review_ID;
    protected int Product_ID;
    protected int User_ID;
    protected int Rating;
    protected String commnent;
    protected Date date_Posted;
    protected String User_avatar;
    protected String User_name;

    public Review() {
    }

    public Review(int review_ID, int Product_ID, int User_ID, int Rating, String commnent, Date date_Posted, String User_avatar, String User_name) {
        this.review_ID = review_ID;
        this.Product_ID = Product_ID;
        this.User_ID = User_ID;
        this.Rating = Rating;
        this.commnent = commnent;
        this.date_Posted = date_Posted;
        this.User_avatar = User_avatar;
        this.User_name = User_name;
    }

    public int getReview_ID() {
        return review_ID;
    }

    public String getUser_avatar() {
        return User_avatar;
    }

    public void setUser_avatar(String User_avatar) {
        this.User_avatar = User_avatar;
    }

    public String getUser_name() {
        return User_name;
    }

    public void setUser_name(String User_name) {
        this.User_name = User_name;
    }

    public void setReview_ID(int review_ID) {
        this.review_ID = review_ID;
    }

    public int getProduct_ID() {
        return Product_ID;
    }

    public void setProduct_ID(int Product_ID) {
        this.Product_ID = Product_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public String getCommnent() {
        return commnent;
    }

    public void setCommnent(String commnent) {
        this.commnent = commnent;
    }

    public Date getDate_Posted() {
        return date_Posted;
    }

    public void setDate_Posted(Date date_Posted) {
        this.date_Posted = date_Posted;
    }
}
