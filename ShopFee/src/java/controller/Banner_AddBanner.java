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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import model.Banner;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control create new Banner.
 * @date: Oct 16, 2023
 * @author: HuyLD
 */
@MultipartConfig
public class Banner_AddBanner extends HttpServlet {

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

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("banner_addBanner.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    private static final String uploadFolder = "img/banner";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BannerDAO banner_DAO = new BannerDAO();

        //get input data
        String banner_Name = request.getParameter("banner_Name");
        String banner_Link = request.getParameter("banner_Link");

        String path = request.getServletContext().getRealPath("") + uploadFolder;

        //check folder existed
        File uploadFolder = new File(path);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdir();
        }

        //get part from request
        Part part = request.getPart("Banner_Image");
        String fileName = getFileName(part);

        //write file to upload folder
        String filePath = path + File.separator + fileName;

        //add new banner
        Banner banner = new Banner();
        banner.setBanner_Name(banner_Name);
        banner.setBanner_Image(fileName);
        banner.setBanner_Link(banner_Link);

        banner_DAO.AddBanner(banner);

        part.write(filePath);

        response.sendRedirect(request.getContextPath() + "/manage-banner");
    }

    //get file name
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}
