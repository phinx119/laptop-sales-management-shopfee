/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ShoppingCartDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.ShoppingCart;
import model.User;

/**
 *
 * @author xuanp
 */
public class Order_Successful extends HttpServlet {

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
            
            session.removeAttribute("order");
            
            request.getRequestDispatcher("order_orderSuccess.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
