/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BannerDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Banner;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control manage Banner.
 * @date: Oct 16, 2023
 * @author: PhiNX
 */
public class Banner_ManageBanner extends HttpServlet {

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

            //get banner data
            BannerDAO banner_DAO = new BannerDAO();
//            Banner banner_Data = banner_DAO.getBanerbyID(request.getParameter("id"));
//            request.setAttribute("banner_Data", banner_Data);

            // Set this variable based on the current page
            String currentPage = "profile";
            request.setAttribute("currentPage", currentPage);

            //update banner
            if ("update".equals(request.getParameter("action"))) {
                request.setAttribute("banner", banner_DAO.getBanerbyID(request.getParameter("id")));
                request.getRequestDispatcher("update-banner").forward(request, response);
            }

            //delete banner
            if ("delete".equals(request.getParameter("action"))) {
                banner_DAO.deleteBannerByID(request.getParameter("id"));
                ArrayList<Banner> banner_List = banner_DAO.getBannerList();
                request.setAttribute("banner_List", banner_List);
                //check user role
                if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                    request.getRequestDispatcher("banner_manageBanner.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/profile");
                }
            }

            //render banner list
            ArrayList<Banner> banner_List = banner_DAO.getBannerList();
            request.setAttribute("banner_List", banner_List);

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("banner_manageBanner.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
