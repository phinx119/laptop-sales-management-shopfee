/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.BannerDAO;
import dao.BrandDAO;
import dao.CategoryDAO;
import dao.LaptopDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Banner;
import model.Brand;
import model.Category;
import model.Laptop;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control Home screen.
 * @date: Sep 21, 2023
 * @author: PhiNX
 */
public class User_Homepage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            UserDAO user_DAO = new UserDAO();
            User user_Data = user_DAO.getUserDatabyID((int) session.getAttribute("user_ID"));
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            ArrayList<ShoppingCart> cart_list = cartDAO.getCartList((int) session.getAttribute("user_ID"));
            int cart_size = cart_list.size();

            request.setAttribute("user_Data", user_Data);
            request.setAttribute("cart_size", cart_size);
        }
        
        BrandDAO brand_DAO = new BrandDAO();
        ArrayList<Brand> brand_List = brand_DAO.getBrandList();
        request.setAttribute("brand_List", brand_List);
        brand_List.get(0).getId();
        
        CategoryDAO category_DAO = new CategoryDAO();
        ArrayList<Category> category_List = category_DAO.getCategoryList();
        request.setAttribute("category_List", category_List);
        
        LaptopDAO laptop_DAO = new LaptopDAO();
        ArrayList<Laptop> laptop_List = laptop_DAO.getLaptopList();
        request.setAttribute("laptop_List", laptop_List);
        
        BannerDAO banner_DAO = new BannerDAO();
        ArrayList<Banner> banner_List = banner_DAO.getBannerList();
        request.setAttribute("banner_List", banner_List);
        
        session.removeAttribute("otp");
        session.removeAttribute("email");
        session.removeAttribute("register");
        
        request.getRequestDispatcher("home-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    }
    
}
