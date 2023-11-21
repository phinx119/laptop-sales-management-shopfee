/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.LaptopDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Laptop;
import model.User;

/**
 * @purpose: Control perma delete product.
 * @date: Dec 20, 2023
 * @author: HieuNT
 */
public class Product_PermaDelete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);
            LaptopDAO ld = new LaptopDAO();
                ld.PermaDelete(Integer.parseInt(request.getParameter("id")));
                ArrayList<Laptop> UnapproveList = ld.getUnapprovesList();
                ArrayList<Laptop> DeletedList = ld.getDeletedList();
                request.setAttribute("UnapproveList", UnapproveList);
                request.setAttribute("DeletedList", DeletedList);
                request.getRequestDispatcher("laptop_adminApproval.jsp").forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);
            
            LaptopDAO ld = new LaptopDAO();
                ld.PermaDelete(Integer.parseInt(request.getParameter("id")));


                request.getRequestDispatcher("manage-laptop").forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
    
}
