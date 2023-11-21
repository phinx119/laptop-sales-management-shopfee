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
import jakarta.servlet.annotation.WebServlet;
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
 * @purpose: Control User List page.
 * @date: Sep 26, 2023
 * @author: PhongLDM
 */
@WebServlet(name = "User_UserList", urlPatterns = {"/user-list"})
public class User_UserList extends HttpServlet {

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

            //get user list
            ArrayList<User> user_List = user_DAO.getUserList();
            request.setAttribute("user_List", user_List);

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("user_userList.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));

            RoleDAO roleDao = new RoleDAO();
            List<Role> role_List = roleDao.getRoleList();
            int roleId = Integer.parseInt(request.getParameter("role"));
            if (roleId == 0) {
//            UserDAO user_DAO = new UserDAO();
                ArrayList<User> user_List = user_DAO.getUserList();
                request.setAttribute("user_List", user_List);
                request.setAttribute("user_Data", user_Data);
                request.setAttribute("role_List", role_List);
                request.setAttribute("selectedId", roleId);
                request.getRequestDispatcher("user_userList.jsp").forward(request, response);
            } else {
                ArrayList<User> user_List = new UserDAO().getUserByRole(roleId);
                request.setAttribute("selectedId", roleId);
                request.setAttribute("user_List", user_List);
                request.setAttribute("user_Data", user_Data);
                request.setAttribute("role_List", role_List);
                request.getRequestDispatcher("user_userList.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
