/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

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
import model.Laptop;
import model.ShoppingCart;
import model.User;

/**
 * @purpose:Admin approval change of product
 * @date: Dec 20, 2023
 * @author: HieuNT
 */
public class Laptop_UnpprovedList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_ID") != null) {

            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);
            
            LaptopDAO laptop_DAO = new LaptopDAO();
            Laptop ld = laptop_DAO.getLaptopByID(Integer.parseInt(request.getParameter("id")));
            
            request.setAttribute("ld", ld);
            
            request.getRequestDispatcher("laptop_approveDetail.jsp").forward(request, response);
            } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user_ID") != null) {

            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);

            int id = Integer.parseInt(request.getParameter("id"));
            LaptopDAO ld = new LaptopDAO();
            ld.admin_approval(id);

            ArrayList<Laptop> laptop_List = ld.getLaptopList();
            ArrayList<Laptop> unapproved_List = ld.getUnapprovesList();
            ArrayList<Laptop> deleted_List = ld.getDeletedList();

            request.setAttribute("laptop_List", laptop_List);
            request.setAttribute("unapproved_List", unapproved_List);
            request.setAttribute("deleted_List", deleted_List);

            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();

            request.setAttribute("user_Data", user_Data);
            request.setAttribute("cart_size", cart_size);
            request.getRequestDispatcher("manage-laptop").forward(request, response);

        } else {
            response.sendRedirect("login");
        }
    }
}
