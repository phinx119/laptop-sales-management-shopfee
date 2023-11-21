/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 * @purpose: Control Login screen.
 * @date: Sep 18, 2023
 * @author: HieuNT
 */
public class User_Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.removeAttribute("otp");
        session.removeAttribute("email");
        session.removeAttribute("register");
        request.getRequestDispatcher("user_login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        //Nhan thong tin tu client
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //Xu li thong tin
        UserDAO user_DAO = new UserDAO();
        //Tra ket qua cho client
        if (user_DAO.checkLogin(username, password)) {
            User user_Data = user_DAO.getUserData(username, password);

            if (user_Data.getStatus() == 1) {
                // User is allowed to log in
                int user_ID = user_Data.getUser_Id();
                session.setAttribute("user_ID", user_ID);
                
                //Check role
                if (user_Data.getRole() != 4) {
                    response.sendRedirect(request.getContextPath() + "/profile");
                } else {
                    // Redirect to the home page
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } else {
                // User is blocked, display a message
                request.setAttribute("message", "Login fail. Your account is blocked.");
                request.setAttribute("type", "danger");
                doGet(request, response);
            }
        } else {
            // Login fail --> Di chuyen ve login
            request.setAttribute("message", "Login fail. Try again.");
            request.setAttribute("type", "danger");
            doGet(request, response);
        }

    }

}
