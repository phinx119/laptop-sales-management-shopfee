/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderItemsDAO;
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
import model.OrderItems;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: View order detail of user
 * @date: Oct 20, 2023
 * @author: PhongLDM
 */
public class Order_ViewDetail extends HttpServlet {

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

            //get order data
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrderDAO order_DAO = new OrderDAO();
            Order order = order_DAO.getOrder(orderId);

            OrderItemsDAO orderItemDAO = new OrderItemsDAO();
            List<OrderItems> orderItem = orderItemDAO.getListOrderItems(orderId);

            request.setAttribute("order", order);
            request.setAttribute("orderItem_List", orderItem);

            //get cart detail
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();
            request.setAttribute("cart_size", cart_size);

            request.getRequestDispatcher("order_orderDetail.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
