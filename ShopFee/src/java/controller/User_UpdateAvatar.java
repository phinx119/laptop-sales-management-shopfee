/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ShoppingCartDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import model.User;
import dao.UserDAO;
import java.io.File;
import java.util.ArrayList;
import model.ShoppingCart;

/**
 * @purpose: Control Upload image feature.
 * @date: Sep 23, 2023
 * @author: HuyLD
 */
@MultipartConfig
public class User_UpdateAvatar extends HttpServlet {

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
            request.getRequestDispatcher("user_userProfile.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

    private static final String uploadFolder = "img/user-avatar";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//        int user_ID = Integer.parseInt(request.getParameter("userid"));
//
//        Part part = request.getPart("avatar");
//        String avatar = part.getSubmittedFileName();
//
//        String path = request.getServletContext().getRealPath(File.separator
//                + "img" + File.separator + "user-avatar" + File.separator + avatar);
//
//        InputStream is = part.getInputStream();
//
//        UserDAO userdao = new UserDAO();
//        if (userdao.uploadAvatar(avatar, user_ID)) {
//            if (userdao.saveFile(is, path)) {
//                request.setAttribute("message1", "Update successfully!");
//                //doGet(request, response);
//                response.sendRedirect(request.getContextPath() + "/profile");
//            }
//        } else {
//            request.setAttribute("message2", "Update failed. Please try again.");
//            response.sendRedirect(request.getContextPath() + "/profile");
//            //doGet(request, response);
//        }
        int user_ID = Integer.parseInt(request.getParameter("userid"));
        //path to upload folder
        String path = request.getServletContext().getRealPath("") + uploadFolder;

        //check folder existed
        File uploadFolder = new File(path);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdir();
        }

        //get part from request
        Part part = request.getPart("avatar");
        String fileName = getFileName(part);

        //write file to upload folder
        String filePath = path + File.separator + fileName;
        UserDAO userdao = new UserDAO();
        userdao.uploadAvatar(fileName, user_ID);
        part.write(filePath);

        response.sendRedirect(request.getContextPath() + "/profile");

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
