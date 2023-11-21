/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoleDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.ShoppingCart;
import model.User;

/**
 * @purpose:Edit user controller.
 * @date: Oct 31, 2023
 * @author: PhongLDM
 */
//@WebServlet(name="User_UpdateUser", urlPatterns={"/update-user"})
public class User_UpdateUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            //get user data
            int user_ID = Integer.parseInt(request.getParameter("userId"));
            UserDAO user_DAO = new UserDAO();
            User user_Detail = user_DAO.getUserDatabyID(user_ID);
            request.setAttribute("user_Detail", user_Detail);

            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);

            //get role list
            RoleDAO roleDao = new RoleDAO();
            List<Role> role_List = roleDao.getRoleList();
            role_List.remove(0);
            request.setAttribute("role_List", role_List);

            //get cart data
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();
            request.setAttribute("cart_size", cart_size);

            //check user role
            if (user_Data.getRole() == 1) {
                request.getRequestDispatcher("user_updateUser.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String user_ID = request.getParameter("userId");
        int role = Integer.parseInt(request.getParameter("role"));

        UserDAO user_DAO = new UserDAO();
        if (user_DAO.editRole(role, Integer.parseInt(user_ID))) {
            response.sendRedirect(request.getContextPath() + "/user-list");
        } else {
            doGet(request, response);
        }
    }
}
