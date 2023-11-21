/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 * @purpose: Control Register screen.
 * @date: Sep 18, 2023
 * @author: PhongLDM
 */
public class User_Registration extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("message", request.getParameter("message"));
        request.setAttribute("email", request.getParameter("email"));
        request.getRequestDispatcher("user_register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm-password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneNumber = "";
        String avatar = "default-avatar.jpg";

        User user = new User(username, password, email, name, phoneNumber, 4, avatar);

        UserDAO user_DAO = new UserDAO();

        if (containsSpecialCharacters(username)) {
            request.setAttribute("message1", "Username cannot contain special characters or spaces.");
            doGet(request, response);
            return;
        }
        if (password.length() < 8 || !hasUpperCase(password) || !hasNumber(password) || !hasSpecialCharacter(password) || password.contains(" ")) {
            request.setAttribute("message2", "Password must have at least 8 characters, 1 uppercase letter, 1 number, 1 special character and cannot contain spaces");
            doGet(request, response);
            return;
        }
        if (!password.equals(confirm_password) || user_DAO.checkUsername(username) || user_DAO.checkEmail(email)) {
            if (user_DAO.checkUsername(username)) {
                request.setAttribute("message1", "Username esxised. Please try again.");
            }
            if (!password.equals(confirm_password)) {
                request.setAttribute("message2", "Repeat password not match");
            }
            if (user_DAO.checkEmail(email)) {
                request.setAttribute("message3", "Email address existed. Please try again.");
            }
            doGet(request, response);
        } else {
            if (user_DAO.addUser(user)) {
                request.setAttribute("message4", "Registration success. Please log in.");
                session.removeAttribute("register");
                request.getRequestDispatcher("user_login.jsp").forward(request, response);
            } else {
                request.setAttribute("message5", "Registration failed. Please try again.");
                session.removeAttribute("register");
                doGet(request, response);
            }
        }
    }

    private boolean containsSpecialCharacters(String input) {
        return !input.matches("^[a-zA-Z0-9]+$");
    }

    private boolean hasUpperCase(String password) {
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                return true;
            }
        }
        return false;
    }

    private boolean hasNumber(String password) {
        for (char c : password.toCharArray()) {
            if (Character.isDigit(c)) {
                return true;
            }
        }
        return false;
    }
    
    private boolean hasSpecialCharacter(String password) {
        String specialCharacters = "!@#$%^&*()_+-=[]{}|;:'\",.<>?/";

        for (char c : password.toCharArray()) {
            if (specialCharacters.indexOf(c) != -1) {
                return true;
            }
        }
        return false;
    }
}
