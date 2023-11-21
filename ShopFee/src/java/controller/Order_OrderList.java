/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: View all order of user
 * @date: Oct 20, 2023
 * @author: PhongLDM
 */
public class Order_OrderList extends HttpServlet {

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
            int cart_size = cart_list.size();
            request.setAttribute("cart_size", cart_size);

            //get order list
            OrderDAO orderDAO = new OrderDAO();
            switch (user_Data.getRole()) {
                case 2:
                case 4:
                    {
                        List<Order> orders = orderDAO.getOrderByUserID((int) session.getAttribute("user_ID"));
                        request.setAttribute("orders", orders);
                        request.getRequestDispatcher("order_viewOrder.jsp").forward(request, response);
                        break;
                    }
                case 1:
                case 3:
                    {
                        List<Double> order_TotalAmount = orderDAO.getOrderTotalAmount();
                        List<Integer> order_Month = orderDAO.getOrderMonth();
                        int total = orderDAO.getTotalOrder();
                        double amount = orderDAO.getTotalAmount();
                        List<Order> orders = orderDAO.getListOrder();
                        
                        request.setAttribute("order_TotalAmount", order_TotalAmount);
                        request.setAttribute("order_Month", order_Month);
                        request.setAttribute("total", total);
                        request.setAttribute("amount", amount);
                        request.setAttribute("orders", orders);
                        request.getRequestDispatcher("order_viewOrder.jsp").forward(request, response);
                        break;
                    }
                default:
                    response.sendRedirect(request.getContextPath() + "/profile");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
