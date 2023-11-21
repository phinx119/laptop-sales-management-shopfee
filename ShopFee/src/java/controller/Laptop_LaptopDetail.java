/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import dao.ReviewDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Laptop;
import model.Review;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control Product Detail page.
 * @date: Sep 26, 2023
 * @author: AnNT
 */
public class Laptop_LaptopDetail extends HttpServlet {

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

        if (request.getParameter("product_ID") != null) {
            int product_ID = Integer.parseInt(request.getParameter("product_ID"));

            //get laptop data
            LaptopDAO laptop_DAO = new LaptopDAO();
            Laptop laptop_Detail = laptop_DAO.getLaptopByID(product_ID);
            request.setAttribute("laptop_Detail", laptop_Detail);

            //get review of laptop
            ReviewDAO review_DAO = new ReviewDAO();
            ArrayList<Review> review_List = review_DAO.getReviewList(product_ID);
            int reviewTotal = review_DAO.getReviewTotal(Integer.parseInt(request.getParameter("product_ID")));
            int[] r = review_DAO.getStarTotal(product_ID);
            request.setAttribute("review_List", review_List);
            request.setAttribute("reviewTotal", reviewTotal);
            request.setAttribute("starTotal", r);
        }
        request.getRequestDispatcher("laptop_laptopDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        //alt flow: make order
        int selectedProductId = Integer.parseInt(request.getParameter("laptop_ID"));
        String selectedQuantity = request.getParameter("quantity");

        LaptopDAO laptop_DAO = new LaptopDAO();
        Laptop laptop = laptop_DAO.getLaptopByID(selectedProductId);

        ShoppingCart order_Detail = new ShoppingCart();
        order_Detail.setBrand(laptop.getBrand());
        order_Detail.setDiscount(laptop.getDiscount());
        order_Detail.setImage(laptop.getLaptop_Image1());
        order_Detail.setPrice(laptop.getPrice());
        order_Detail.setProduct_ID(selectedProductId);
        order_Detail.setProduct_name(laptop.getModel());

        ArrayList<ShoppingCart> order = new ArrayList<>();
        order.add(order_Detail);
        order.get(0).setQuantity(Integer.parseInt(selectedQuantity));

        session.setAttribute("cart_list", order);
        response.sendRedirect(request.getContextPath() + "/make-order");
    }
}
