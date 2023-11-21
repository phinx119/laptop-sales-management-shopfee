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
import java.io.IOException;
import model.User;

/**
 * @purpose: Block user controller.
 * @date: Oct 29, 2023
 * @author: PhongLDM
 */
public class User_BlockUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accountIdParam = request.getParameter("userId");
        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            int user_ID = Integer.parseInt(accountIdParam);
            UserDAO user_DAO = new UserDAO();
            User user = user_DAO.getUserDatabyID(user_ID);

            if (user != null && user.getRole() != 1) {
                if (user.getStatus() == 1) {
                    // Block the account
                    user.setStatus(0);
                    user_DAO.updateAccountStatus(user_ID);
                    request.setAttribute("type", "success");
                    request.setAttribute("message", "Account blocked successfully.");

                } else if (user.getStatus() == 0) {
                    // Unblock the account
                    user.setStatus(1);
                    user_DAO.updateAccountStatus(user_ID);
                    request.setAttribute("type", "success");
                    request.setAttribute("message", "Account unblocked successfully.");
                }
            } else {
                request.setAttribute("type", "danger");
                request.setAttribute("message", "You cannot block an admin.");
            }
        }
        request.getRequestDispatcher("user-list").forward(request, response);
    }
}
