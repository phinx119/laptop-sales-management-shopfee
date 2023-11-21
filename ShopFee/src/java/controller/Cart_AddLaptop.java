/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ShoppingCartDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @purpose: Control add Laptop to Shopping Cart.
 * @date: Oct 16, 2023
 * @author: PhiNX
 */
public class Cart_AddLaptop extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String status = "error";

        if (session.getAttribute("user_ID") != null) {
            int user_Id = (int) session.getAttribute("user_ID");
            int laptop_Id = Integer.parseInt(request.getParameter("laptop_Id"));

            ShoppingCartDAO cart_DAO = new ShoppingCartDAO();

            if (!cart_DAO.checkProduct(user_Id, laptop_Id)) {
                if (cart_DAO.addProduct(user_Id, laptop_Id, 1)) {
                    int cart_size = cart_DAO.getCartList(user_Id).size();
                    String jsonResponse = "{\"status\": \"success\", \"cart_size\": " + cart_size + "}";
                    response.getWriter().write(jsonResponse);
                } else {
                    response.getWriter().write("{\"status\": \"error\"}");
                }
            } else {
                response.getWriter().write("{\"status\": \"already_added\"}");
            }
        } else {
            response.getWriter().write("{\"status\": \"not_logged_in\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
