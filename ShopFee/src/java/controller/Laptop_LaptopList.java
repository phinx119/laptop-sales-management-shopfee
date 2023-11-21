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
 * @purpose: Access and manipulate data in the Brand table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class Laptop_LaptopList extends HttpServlet {

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

        //get brand list
        BrandDAO brand_DAO = new BrandDAO();
        ArrayList<Brand> brand_List = brand_DAO.getBrandList();
        request.setAttribute("brand_List", brand_List);

        //get categoory list
        CategoryDAO category_DAO = new CategoryDAO();
        ArrayList<Category> category_List = category_DAO.getCategoryList();
        request.setAttribute("category_List", category_List);

        //get processor list
        ProcessorDAO processor_DAO = new ProcessorDAO();
        ArrayList<Processor> processor_List = processor_DAO.getProcessorList();
        request.setAttribute("processor_List", processor_List);

        //get laptop list
        LaptopDAO laptop_DAO = new LaptopDAO();
        ArrayList<Laptop> laptop_List;
        // Check if the "category" parameter is present in the request
        if (request.getParameter("category") != null) {
            // Retrieve laptops based on the selected category
            String selectedCategory = request.getParameter("category");
            laptop_List = laptop_DAO.getLaptopsByCategory(selectedCategory);
        } else if (request.getParameter("brand") != null) {
            int selectedBrand = Integer.parseInt(request.getParameter("brand"));
            laptop_List = laptop_DAO.getLaptopsByBrand(selectedBrand);
        } else {
            // If no category parameter is present, retrieve all laptops
            laptop_List = laptop_DAO.getLaptopList();
        }
        request.setAttribute("laptop_List", laptop_List);

        request.getRequestDispatcher("laptop_laptopList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
