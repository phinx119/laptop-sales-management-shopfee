/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of Address table.
 * @date: Oct 12, 2023
 * @author: PhongLDM
 */
public class Address {

    protected int User_ID;
    protected String phoneNumber;
    protected String City;
    protected String Ward;
    protected String District;
    protected String Note;

    public Address() {
    }

    public Address(int User_ID, String phoneNumber, String City, String Ward, String District, String Note) {
        this.User_ID = User_ID;
        this.phoneNumber = phoneNumber;
        this.City = City;
        this.Ward = Ward;
        this.District = District;
        this.Note = Note;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int UserID) {
        this.User_ID = UserID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getWard() {
        return Ward;
    }

    public void setWard(String Ward) {
        this.Ward = Ward;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

}
