/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of Processor table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class Processor {

    protected int id;
    protected String Processor_Name;

    public Processor() {
    }

    public Processor(int id, String Processor_Name) {
        this.id = id;
        this.Processor_Name = Processor_Name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProcessor_Name() {
        return Processor_Name;
    }

    public void setProcessor_Name(String Processor_Name) {
        this.Processor_Name = Processor_Name;
    }
}
