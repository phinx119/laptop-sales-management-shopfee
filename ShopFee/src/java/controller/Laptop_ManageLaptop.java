/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.DiscountDAO;
import dao.LaptopDAO;
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
import model.Discount;
import model.Laptop;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Manage laptop function for marketing
 * @date: Dec 20, 2023
 * @author: HieuNT
 */
public class Laptop_ManageLaptop extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            //get product data
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);

            //get laptop list
            LaptopDAO laptop_DAO = new LaptopDAO();
            DiscountDAO discount_DAO = new DiscountDAO();
            ArrayList<Laptop> laptop_List = laptop_DAO.getLaptopList();
            ArrayList<Laptop> unapproved_List = laptop_DAO.getUnapprovesList();
            ArrayList<Laptop> deleted_List = laptop_DAO.getDeletedList();
            ArrayList<Discount> dl = discount_DAO.getDiscount();
            List<Integer> category_Count = laptop_DAO.getCategoryCount();
            
            request.setAttribute("dl", dl);
            request.setAttribute("laptop_List", laptop_List);
            request.setAttribute("unapproved_List", unapproved_List);
            request.setAttribute("deleted_List", deleted_List);
            request.setAttribute("category_Count", category_Count);

            //get cart data
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();
            request.setAttribute("cart_size", cart_size);

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("laptop_manageLaptop.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
