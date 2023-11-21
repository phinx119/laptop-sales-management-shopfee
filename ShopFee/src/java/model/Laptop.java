/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DBContext;

/**
 * @purpose: Represent data of Laptop table.
 * @date: Sep 16, 2023
 * @author: HieuNT
 */
public class Laptop extends DBContext{

    protected int id;
    protected String brand;
    protected String model;
    protected String category;
    protected String processor_Type;
    protected String processor_Name;
    protected String graphic_Card;
    protected int RAM;
    protected String storage;
    protected double screen_Size;
    protected String screen_Resolution;
    protected int screen_Frequency;
    protected String operating_System;
    protected double price;
    protected double discount;
    protected int quantity;
    protected String Laptop_Image1;
    protected String Laptop_Image2;
    protected String Laptop_Image3;
    protected String description;

    public Laptop() {
    }

    public Laptop(int id) {
        this.id = id;
    }

    public Laptop(int id, String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, double discount, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.category = category;
        this.processor_Type = processor_Type;
        this.processor_Name = processor_Name;
        this.graphic_Card = graphic_Card;
        this.RAM = RAM;
        this.storage = storage;
        this.screen_Size = screen_Size;
        this.screen_Resolution = screen_Resolution;
        this.screen_Frequency = screen_Frequency;
        this.operating_System = operating_System;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.Laptop_Image1 = Laptop_Image1;
        this.Laptop_Image2 = Laptop_Image2;
        this.Laptop_Image3 = Laptop_Image3;
        this.description = description;
    }

    public Laptop(String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, double discount, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        this.brand = brand;
        this.model = model;
        this.category = category;
        this.processor_Type = processor_Type;
        this.processor_Name = processor_Name;
        this.graphic_Card = graphic_Card;
        this.RAM = RAM;
        this.storage = storage;
        this.screen_Size = screen_Size;
        this.screen_Resolution = screen_Resolution;
        this.screen_Frequency = screen_Frequency;
        this.operating_System = operating_System;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.Laptop_Image1 = Laptop_Image1;
        this.Laptop_Image2 = Laptop_Image2;
        this.Laptop_Image3 = Laptop_Image3;
        this.description = description;
    }

    public Laptop(int id, String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, double discount, int quantity, String description) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.category = category;
        this.processor_Type = processor_Type;
        this.processor_Name = processor_Name;
        this.graphic_Card = graphic_Card;
        this.RAM = RAM;
        this.storage = storage;
        this.screen_Size = screen_Size;
        this.screen_Resolution = screen_Resolution;
        this.screen_Frequency = screen_Frequency;
        this.operating_System = operating_System;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.description = description;
    }

    public Laptop(int id, String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.category = category;
        this.processor_Type = processor_Type;
        this.processor_Name = processor_Name;
        this.graphic_Card = graphic_Card;
        this.RAM = RAM;
        this.storage = storage;
        this.screen_Size = screen_Size;
        this.screen_Resolution = screen_Resolution;
        this.screen_Frequency = screen_Frequency;
        this.operating_System = operating_System;
        this.price = price;
        this.quantity = quantity;
        this.Laptop_Image1 = Laptop_Image1;
        this.Laptop_Image2 = Laptop_Image2;
        this.Laptop_Image3 = Laptop_Image3;
        this.description = description;
    }

    public Laptop(String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        this.brand = brand;
        this.model = model;
        this.category = category;
        this.processor_Type = processor_Type;
        this.processor_Name = processor_Name;
        this.graphic_Card = graphic_Card;
        this.RAM = RAM;
        this.storage = storage;
        this.screen_Size = screen_Size;
        this.screen_Resolution = screen_Resolution;
        this.screen_Frequency = screen_Frequency;
        this.operating_System = operating_System;
        this.price = price;
        this.quantity = quantity;
        this.Laptop_Image1 = Laptop_Image1;
        this.Laptop_Image2 = Laptop_Image2;
        this.Laptop_Image3 = Laptop_Image3;
        this.description = description;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProcessor_Type() {
        return processor_Type;
    }

    public void setProcessor_Type(String processor_Type) {
        this.processor_Type = processor_Type;
    }

    public String getProcessor_Name() {
        return processor_Name;
    }

    public void setProcessor_Name(String processor_Name) {
        this.processor_Name = processor_Name;
    }

    public String getGraphic_Card() {
        return graphic_Card;
    }

    public void setGraphic_Card(String graphic_Card) {
        this.graphic_Card = graphic_Card;
    }

    public int getRAM() {
        return RAM;
    }

    public void setRAM(int RAM) {
        this.RAM = RAM;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public double getScreen_Size() {
        return screen_Size;
    }

    public void setScreen_Size(double screen_Size) {
        this.screen_Size = screen_Size;
    }

    public String getScreen_Resolution() {
        return screen_Resolution;
    }

    public void setScreen_Resolution(String screen_Resolution) {
        this.screen_Resolution = screen_Resolution;
    }

    public int getScreen_Frequency() {
        return screen_Frequency;
    }

    public void setScreen_Frequency(int screen_Frequency) {
        this.screen_Frequency = screen_Frequency;
    }

    public String getOperating_System() {
        return operating_System;
    }

    public void setOperating_System(String operating_System) {
        this.operating_System = operating_System;
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

    public String getLaptop_Image1() {
        return Laptop_Image1;
    }

    public void setLaptop_Image1(String Laptop_Image1) {
        this.Laptop_Image1 = Laptop_Image1;
    }

    public String getLaptop_Image2() {
        return Laptop_Image2;
    }

    public void setLaptop_Image2(String Laptop_Image2) {
        this.Laptop_Image2 = Laptop_Image2;
    }

    public String getLaptop_Image3() {
        return Laptop_Image3;
    }

    public void setLaptop_Image3(String Laptop_Image3) {
        this.Laptop_Image3 = Laptop_Image3;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
