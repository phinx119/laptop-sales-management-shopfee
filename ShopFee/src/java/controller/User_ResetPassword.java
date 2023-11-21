/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @purpose: Control Reset Password screen.
 * @date: Sep 21, 2023
 * @author: HuyLD
 */
public class User_ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("user_resetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("re_password");

        UserDAO user_DAO = new UserDAO();

//        if (containsSpecialCharacters(newPassword)) {
//            request.setAttribute("message", "Password cannot contain special characters or spaces");
//            doGet(request, response);
//        }
        if (newPassword.length() < 8) {
            request.setAttribute("message", "Password must have at least 8 characters.");
            doGet(request, response);
            return;
        }
        if (newPassword.equals(confPassword)) {
            if (user_DAO.resetPassword(newPassword, (String) session.getAttribute("email"))) {
                request.setAttribute("message", "Reset success!");
                request.getRequestDispatcher("user_login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Reset fail.");
                request.getRequestDispatcher("user_login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Repeat password not match.");
            doGet(request, response);
        }
    }

    private boolean containsSpecialCharacters(String input) {
        return !input.matches("^[a-zA-Z0-9]+$");
    }
}
