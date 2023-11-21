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
 * @purpose: Control Change Shopping Cart screen.
 * @date: Oct 05, 2023
 * @author: PhongLDM
 */
public class Cart_ManageCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            //get user data
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);

            //get cart data
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            request.setAttribute("cart_list", cart_list);
            int cart_size = cart_list.size();
            request.setAttribute("cart_size", cart_size);

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 3 || user_Data.getRole() == 4) {
                request.getRequestDispatcher("cart_viewCart.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("profile").forward(request, response);
            }
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        //add product to cart
        if (session.getAttribute("user_ID") != null) {
            int user_Id = (int) session.getAttribute("user_ID");
            int laptop_Id = Integer.parseInt(request.getParameter("laptop_Id"));
            int quantity = Integer.parseInt(request.getParameter("quantity2"));

            ShoppingCartDAO cart_DAO = new ShoppingCartDAO();

            //check existed product in cart
            if (!cart_DAO.checkProduct(user_Id, laptop_Id)) {
                if (cart_DAO.addProduct(user_Id, laptop_Id, quantity)) {
                    response.sendRedirect(request.getContextPath() + "/laptop-detail?product_ID=" + laptop_Id);
                } else {
                    response.sendRedirect(request.getContextPath() + "/laptop-detail?product_ID=" + laptop_Id);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/laptop-detail?product_ID=" + laptop_Id);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
