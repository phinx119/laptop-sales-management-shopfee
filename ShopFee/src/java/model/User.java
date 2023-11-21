/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @purpose: Represent data of User table.
 * @date: Sep 16, 2023
 * @author: HieuNT
 */
public class User {

    protected int user_Id;
    protected String username;
    protected String password;
    protected String email;
    protected String name;
    protected String phone_Number;
    protected int role;
    protected String avatar;
    protected int status;

    public User() {
    }

    public User(int user_Id, String username, String password, String email, String name, String phone_Number, int role, String avatar) {
        this.user_Id = user_Id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phone_Number = phone_Number;
        this.role = role;
        this.avatar = avatar;
    }

    public User(String username, String password, String email, String name, String phone_Number, int role, String avatar) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phone_Number = phone_Number;
        this.role = role;
        this.avatar = avatar;
    }

    public User(int user_Id, String username, String email, String name, String phone_Number, int role, int status) {
        this.user_Id = user_Id;
        this.username = username;
        this.email = email;
        this.name = name;
        this.phone_Number = phone_Number;
        this.role = role;
        this.status = status;
    }

    
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int user_Id, String name, int role) {
        this.user_Id = user_Id;
        this.name = name;
        this.role = role;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_Number() {
        return phone_Number;
    }

    public void setPhone_Number(String phone_Number) {
        this.phone_Number = phone_Number;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
