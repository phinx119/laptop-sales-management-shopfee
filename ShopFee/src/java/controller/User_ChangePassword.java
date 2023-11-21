/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control Change Password screen.
 * @date: Sep 21, 2023
 * @author: PhiNX
 */
public class User_ChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));

            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();

            request.setAttribute("user_Data", user_Data);
            request.setAttribute("cart_size", cart_size);
            request.getRequestDispatcher("user_changePassword.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        UserDAO user_DAO = new UserDAO();
        User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));

        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        String confirmnewpassword = request.getParameter("confirmnewpassword");
        int user_ID = Integer.parseInt(request.getParameter("userid"));

        if (newpassword.length() < 8 || !hasUpperCase(newpassword) || !hasNumber(newpassword) || !hasSpecialCharacter(newpassword) || newpassword.contains(" ")) {
            request.setAttribute("message2", "Password must have at least 8 characters, 1 uppercase letter, 1 number, 1 special character and cannot contain spaces");
            doGet(request, response);
            return;
        }

        if (!oldpassword.equals(user_Data.getPassword()) || !newpassword.equals(confirmnewpassword)) {
            if (!oldpassword.equals(user_Data.getPassword())) {
                request.setAttribute("message3", "Old password not correct.");
                doGet(request, response);
            }
            if (!newpassword.equals(confirmnewpassword)) {
                request.setAttribute("message4", "Repeat password not match.");
                doGet(request, response);
            }
        } else {
            if (user_DAO.changePassword(newpassword, user_ID)) {
                request.setAttribute("message1", "Change password successfully!");
                doGet(request, response);
            } else {
                request.setAttribute("message2", "Change password failed. Please try again.");
                doGet(request, response);
            }
        }

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
