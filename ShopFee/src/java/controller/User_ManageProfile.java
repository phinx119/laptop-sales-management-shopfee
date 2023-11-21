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
 * @purpose: Control User Profile screen.
 * @date: Sep 21, 2023
 * @author: PhiNX
 */
public class User_ManageProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));

            request.setAttribute("message7", request.getParameter("message7"));
            request.setAttribute("message8", request.getParameter("message8"));
            
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();

            request.setAttribute("user_Data", user_Data);
            request.setAttribute("cart_size", cart_size);
            request.getRequestDispatcher("user_userProfile.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String newemail = request.getParameter("newemail");
        String oldemail = request.getParameter("oldemail");
        String phone_Number = request.getParameter("phonenumber");
        int user_ID = Integer.parseInt(request.getParameter("userid"));

        UserDAO user_DAO = new UserDAO();

        //update name
        if (request.getParameter("button").equals("name")) {
            if (user_DAO.updateName(name, user_ID)) {
                request.setAttribute("message1", "Update successfully!");
                doGet(request, response);
            } else {
                request.setAttribute("message2", "Update failed. Please try again.");
                doGet(request, response);
            }
        }

        //update email
        if (request.getParameter("button").equals("email")) {
            //check email changing or not
            if (!newemail.equals(oldemail)) {
                //check email existed or not
                if (!user_DAO.checkEmail(newemail)) {
                    request.setAttribute("email", newemail);
                    request.getRequestDispatcher("user_getOTP.jsp").forward(request, response);
                } else {
                    request.setAttribute("message4", "Email existed. Please try again.");
                    doGet(request, response);
                }
            } else {
                request.setAttribute("message4", "Same to old email. Please try again.");
                doGet(request, response);
            }
        }

        //update phonumber
        if (request.getParameter("button").equals("phonenumber")) {
            if (user_DAO.updatePhoneNumber(phone_Number, user_ID)) {
                request.setAttribute("message5", "Update successfully!");
                doGet(request, response);
            } else {
                request.setAttribute("message6", "Update failed. Please try again.");
                doGet(request, response);
            }
        }

        //delete acount
        if (request.getParameter("button").equals("delete")) {
            if (user_DAO.deleteUser(user_ID)) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("message", "Delete failed. Please try again.");
                doGet(request, response);
            }
        }
    }
}
