/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of Brand table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class Brand {

    protected int id;
    protected String Brand_Name;
    protected String Brand_image;

    public Brand() {
    }

    public Brand(int id, String Brand_Name, String Brand_image) {
        this.id = id;
        this.Brand_Name = Brand_Name;
        this.Brand_image = Brand_image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand_Name() {
        return Brand_Name;
    }

    public void setBrand_Name(String Brand_Name) {
        this.Brand_Name = Brand_Name;
    }

    public String getBrand_image() {
        return Brand_image;
    }

    public void setBrand_image(String Brand_image) {
        this.Brand_image = Brand_image;
    }

}
