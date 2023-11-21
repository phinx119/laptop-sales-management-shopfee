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
import model.ShoppingCart;
import model.User;

/**
 * @purpose: Control update Banner.
 * @date: Oct 16, 2023
 * @author: HuyLD
 */
@MultipartConfig
public class Banner_UpdateBanner extends HttpServlet {

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
            request.setAttribute("banner", banner_DAO.getBanerbyID(request.getParameter("id")));

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("banner_updateBanner.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        }
    }

    private static final String uploadFolder = "img/banner";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BannerDAO banner_DAO = new BannerDAO();

        int Banner_Id = Integer.parseInt(request.getParameter("banner_Id"));
        String banner_Name = request.getParameter("banner_Name");
        String currentBannerImage = banner_DAO.getBannerImageById(Banner_Id);
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
        if (fileName != null && !fileName.isEmpty()) {
            // Write the file to the upload folder
            String filePath = path + File.separator + fileName;
            part.write(filePath);
            if (banner_DAO.UpdateBanner(banner_Name, fileName, banner_Link, Banner_Id)) {
                response.sendRedirect(request.getContextPath() + "/update-banner?id=" + Banner_Id);
            } else {
                request.setAttribute("message", "Update banner fail!");
                response.sendRedirect(request.getContextPath() + "/update-banner?id=" + Banner_Id);
            }
        } else {
            // If no new Banner_Image is uploaded, update only the Banner_Name
            if (banner_DAO.UpdateBannerNameLink(banner_Name, banner_Link, Banner_Id)) {
                response.sendRedirect(request.getContextPath() + "/update-banner?id=" + Banner_Id);
            } else {
                request.setAttribute("message", "Update banner fail!");
                response.sendRedirect(request.getContextPath() + "/update-banner?id=" + Banner_Id);
            }
        }
    }

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
