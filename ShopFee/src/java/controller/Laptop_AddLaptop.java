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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Processor;
import model.ShoppingCart;
import model.User;

/**
 * @purpose:Add product function for admin
 * @date: Dec 20, 2023
 * @author: HieuNT
 */
@MultipartConfig
public class Laptop_AddLaptop extends HttpServlet {

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

            //get category list
            CategoryDAO c = new CategoryDAO();
            ArrayList<Category> cData = c.getCategoryList();
            request.setAttribute("cData", cData);

            //get brand list
            BrandDAO b = new BrandDAO();
            ArrayList<Brand> bData = b.getBrandList();
            request.setAttribute("bData", bData);

            //get processor list 
            ProcessorDAO p = new ProcessorDAO();
            ArrayList<Processor> processData = p.getProcessorList();
            request.setAttribute("processData", processData);

            //check user role
            if (user_Data.getRole() == 1 || user_Data.getRole() == 2) {
                request.getRequestDispatcher("laptop_addLaptop.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/profile");
            }
        } else {
            response.sendRedirect("login");
        }
    }

    private static final String uploadFolder = "img/laptop";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //get input of new laptop
        String model = request.getParameter("model");
        String brand = request.getParameter("brand");
        String selectedBrand = request.getParameter("selectedBrand");
        String category = request.getParameter("category");
        String processor_Type = request.getParameter("processor_Type");
        String processor_Name = request.getParameter("processor_Name");
        String graphic_Card = request.getParameter("graphic_Card");
        int RAM = Integer.parseInt(request.getParameter("RAM"));
        String storage = request.getParameter("storage");
        double screen_Size = Double.parseDouble(request.getParameter("screen_Size"));
        String screen_Resolution = request.getParameter("screen_Resolution");
        int screen_Frequestuency = Integer.parseInt(request.getParameter("screen_Frequency"));
        String operating_System = request.getParameter("operating_System");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = 0;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");

        //path to upload folder
        String path = request.getServletContext().getRealPath("") + uploadFolder;
        String uploadDirectory = path + File.separator + selectedBrand;
        //check folder existed
        File uploadFolder = new File(uploadDirectory);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdir();
        }

//        //get part from request
//        Part part1 = request.getPart("Product_Image1");
//        Part part2 = request.getPart("Product_Image2");
//        Part part3 = request.getPart("Product_Image3");
//        String fileName1 = getFileName(part1);
//        String fileName2 = getFileName(part2);
//        String fileName3 = getFileName(part3);
//
//        //write file to upload folder
//        String filePath1 = path + File.separator + fileName1;
//        String filePath2 = path + File.separator + fileName2;
//        String filePath3 = path + File.separator + fileName3;
        List<String> fileNames = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getContentType() != null) {
                String fileName = getFileName(part);
                String filePath = uploadDirectory + File.separator + fileName;
                part.write(filePath);
                fileNames.add(fileName);
            }
        }

        LaptopDAO ld = new LaptopDAO(brand, model, category, processor_Type, processor_Name, graphic_Card, RAM, storage, screen_Size,
                screen_Resolution, screen_Frequestuency, operating_System, price, discount, quantity,
                fileNames.get(0), fileNames.get(1), fileNames.get(2), description);
        if (ld.addLaptop_M()) {
            response.sendRedirect(request.getContextPath() + "/manage-laptop");
        } else {
            
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
