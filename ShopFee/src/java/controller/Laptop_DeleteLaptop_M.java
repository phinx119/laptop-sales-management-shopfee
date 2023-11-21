/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @purpose: Control delete Laptop for Marketing role.
 * @date: Dec 20, 2023
 * @author: HieuNT
 */
public class Laptop_DeleteLaptop_M extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int Laptop_id = Integer.parseInt(request.getParameter("id"));

        LaptopDAO laptop_DAO = new LaptopDAO();
        
        laptop_DAO.delete_M(Laptop_id);
        response.sendRedirect("manage-laptop");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
