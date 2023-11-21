/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Home_PC
 */
public class Discount {
    protected int cateID;
    protected String cateName;
    protected double discount;

    public Discount() {
    }

    public Discount(int cateID, double discount) {
        this.cateID = cateID;
        this.discount = discount;
    }

    public Discount(int cateID, String cateName, double discount) {
        this.cateID = cateID;
        this.cateName = cateName;
        this.discount = discount;
    }
    

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }
    
    public String getCateName(){
        return cateName;
    }
    
    public void setCateName(String cateName){
        this.cateName = cateName;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
    
}
