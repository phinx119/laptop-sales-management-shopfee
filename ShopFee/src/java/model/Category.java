/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of Category table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class Category {

    protected int id;
    protected String Category_Name;
    protected String Category_Image;

    public Category() {
    }

    public Category(int id, String Category_Name, String Category_Image) {
        this.id = id;
        this.Category_Name = Category_Name;
        this.Category_Image = Category_Image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory_Name() {
        return Category_Name;
    }

    public void setCategory_Name(String Category_Name) {
        this.Category_Name = Category_Name;
    }

    public String getCategory_Image() {
        return Category_Image;
    }

    public void setCategory_Image(String Category_Image) {
        this.Category_Image = Category_Image;
    }
}
