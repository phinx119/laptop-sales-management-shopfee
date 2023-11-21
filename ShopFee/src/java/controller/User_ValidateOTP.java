/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @purpose: Control Validate OTP screen.
 * @date: Sep 21, 2023
 * @author:
 */
public class User_ValidateOTP extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("user_validateOTP.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");
        UserDAO user_DAO = new UserDAO();
        int value = Integer.parseInt(request.getParameter("otp"));
        if (value == otp) {
            if (session.getAttribute("user_ID") != null) {
                if (user_DAO.updateEmail(email, (int) session.getAttribute("user_ID"))) {
                    //request.setAttribute("message1", "Update successfully!");
                    //request.getRequestDispatcher("profile").forward(request, response);
                    request.setAttribute("type", "success");
                    String message = "Update successfully!";
                    response.sendRedirect(request.getContextPath() + "/profile?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
                } else {
                    //request.setAttribute("message2", "Update failed. Please try again.");
                    //request.getRequestDispatcher("profile").forward(request, response);
                    request.setAttribute("type", "success");
                    String message = "Update failed. Please try again.";
                    response.sendRedirect(request.getContextPath() + "/profile?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
                }
            } else if (session.getAttribute("register") != null) {
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("type", "success");
                request.setAttribute("message", "Submit otp success!");
                request.getRequestDispatcher("user_register.jsp").forward(request, response);
            } else {
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("type", "success");
                request.setAttribute("message", "Submit otp success!");
                request.getRequestDispatcher("user_resetPassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("type", "danger");
            request.setAttribute("message", "Wrong otp.");
            request.getRequestDispatcher("user_validateOTP.jsp").forward(request, response);
        }
    }
}
