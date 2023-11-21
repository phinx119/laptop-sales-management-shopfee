/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.LaptopDAO;
import dao.ProcessorDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Laptop;
import model.Processor;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Search laptop function.
 * @date: Sep 29, 2023
 * @author: PhongLDM
 */
public class Laptop_SearchLaptop extends HttpServlet {

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
        }

        LaptopDAO laptop_DAO = new LaptopDAO();
        String searchParam = request.getParameter("search");
        ArrayList<Laptop> laptop_SList = laptop_DAO.searchByName(searchParam);

        if (laptop_SList.isEmpty()) {
            request.setAttribute("message", "No results found for the search: " + searchParam);
        } else {
            request.setAttribute("laptop_List", laptop_SList);
        }

        BrandDAO brand_DAO = new BrandDAO();
        ArrayList<Brand> brand_List = brand_DAO.getBrandList();
        request.setAttribute("brand_List", brand_List);

        CategoryDAO category_DAO = new CategoryDAO();
        ArrayList<Category> category_List = category_DAO.getCategoryList();
        request.setAttribute("category_List", category_List);

        ProcessorDAO processor_DAO = new ProcessorDAO();
        ArrayList<Processor> processor_List = processor_DAO.getProcessorList();
        request.setAttribute("processor_List", processor_List);

        request.setAttribute("searchParam", searchParam);
        request.getRequestDispatcher("laptop_laptopList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest resquest, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(resquest, response);
    }

}
