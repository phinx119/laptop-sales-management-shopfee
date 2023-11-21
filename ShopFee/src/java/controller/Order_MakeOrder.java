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
 * @purpose: Control make order screen.
 * @date: Oct 15, 2023
 * @author: PhiNX
 */
public class Order_MakeOrder extends HttpServlet {

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
            
            request.getRequestDispatcher("order_makeOrder.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String[] selectedProductIds = request.getParameterValues("cartId");
        String[] selectedQuantity = request.getParameterValues("quantity");
        ShoppingCartDAO cart = new ShoppingCartDAO();
        ArrayList<ShoppingCart> cart_list = new ArrayList<>();
        int count = 0;

        if (selectedProductIds != null && selectedProductIds.length > 0) {
            for (String cartId : selectedProductIds) {
                cart_list.add(cart.getCartbyID(Integer.parseInt(cartId)));
                cart_list.get(count).setQuantity(Integer.parseInt(selectedQuantity[count]));
                count++;
            }
            session.setAttribute("cart_list", cart_list);
            doGet(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/manage-cart");
    }

}
