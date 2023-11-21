/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 * @purpose: Represent data of Order table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class Order {

    protected int order_ID;
    protected int user_ID;
    protected String name;
    protected String phoneNumber;
    protected Date order_Date;
    protected String payment_Method;
    protected double shipFee;
    protected double total;
    protected String status;
    protected String address;
    protected String note;

    public Order() {
    }

    public Order(int order_ID, int user_ID, String name, String phoneNumber, Date order_Date, String payment_Method, double shipFee, double total, String status, String address, String note, String model) {
        this.order_ID = order_ID;
        this.user_ID = user_ID;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.order_Date = order_Date;
        this.payment_Method = payment_Method;
        this.shipFee = shipFee;
        this.total = total;
        this.status = status;
        this.address = address;
        this.note = note;
    }

    public Order(String name, String phonenumber, String payment, Double shipFee, Double total, String address, String note) {
        this.name = name;
        this.phoneNumber = phonenumber;
        this.payment_Method = payment;
        this.shipFee = shipFee;
        this.total = total;
        this.address = address;
        this.note = note;
    }

    public int getOrder_ID() {
        return order_ID;
    }

    public void setOrder_ID(int order_ID) {
        this.order_ID = order_ID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getOrder_Date() {
        return order_Date;
    }

    public void setOrder_Date(Date order_Date) {
        this.order_Date = order_Date;
    }

    public String getPayment_Method() {
        return payment_Method;
    }

    public void setPayment_Method(String payment_Method) {
        this.payment_Method = payment_Method;
    }

    public double getShipFee() {
        return shipFee;
    }

    public void setShipFee(double shipFee) {
        this.shipFee = shipFee;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }    
}
