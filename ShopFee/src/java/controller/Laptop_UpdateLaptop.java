/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.DiscountDAO;
import dao.LaptopDAO;
import dao.ProcessorDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import model.Brand;
import model.Category;
import model.Discount;
import model.Laptop;
import model.Processor;
import model.ShoppingCart;
import model.User;

/**
 * @purpose: update product detail
 * @date: Sep 29, 2023
 * @author: HieuNT
 */
public class Laptop_UpdateLaptop extends HttpServlet {

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

            LaptopDAO laptop_DAO = new LaptopDAO();
            Laptop laptop_Data = laptop_DAO.getLaptopByID(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("ld", laptop_Data);

            //get category list
            CategoryDAO category_DAO = new CategoryDAO();
            ArrayList<Category> cData = category_DAO.getCategoryList();
            request.setAttribute("cData", cData);

            //get brand list
            BrandDAO brand_DAO = new BrandDAO();
            ArrayList<Brand> bData = brand_DAO.getBrandList();
            request.setAttribute("bData", bData);

            //get processor list
            ProcessorDAO processor_DAO = new ProcessorDAO();
            ArrayList<Processor> processData = processor_DAO.getProcessorList();
            request.setAttribute("processData", processData);

            switch (user_Data.getRole()) {
                case 1:
                case 2:
                    request.getRequestDispatcher("laptop_updateLaptop.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/profile");
                    break;
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

        if (request.getParameter("selectedBrand") == null) {
            int laptop_ID = parseParameter(request.getParameter("laptop_ID"));
            String model = request.getParameter("model");
            int brand = parseParameter(request.getParameter("brand"));
            int category = parseParameter(request.getParameter("category"));
            int processor_Type = parseParameter(request.getParameter("processor_Type"));
            String processor_Name = request.getParameter("processor_Name");
            String graphic_Card = request.getParameter("graphic_Card");
            int RAM = parseParameter(request.getParameter("RAM"));
            String storage = request.getParameter("storage");
            double screen_Size = parseDoubleParameter(request.getParameter("screen_Size"));
            String screen_Resolution = request.getParameter("screen_Resolution");
            int screen_Frequestuency = parseParameter(request.getParameter("screen_Frequency"));
            String operating_System = request.getParameter("operating_System");
            double price = parseDoubleParameter(request.getParameter("price"));
            int quantity = parseParameter(request.getParameter("quantity"));
            String description = request.getParameter("description");

            System.out.println("Model from request: " + model);
            System.out.println("brand from request: " + brand);
            System.out.println("category from request: " + category);
            System.out.println("processor_Type from request: " + processor_Type);
            System.out.println("processor_Name from request: " + processor_Name);
            System.out.println("graphic_Card from request: " + graphic_Card);
            System.out.println("RAM from request: " + RAM);
            System.out.println("storage from request: " + storage);
            System.out.println("screen_Size from request: " + screen_Size);
            System.out.println("screen_Resolution from request: " + screen_Resolution);
            System.out.println("screen_Frequestuency from request: " + screen_Frequestuency);
            System.out.println("operating_System from request: " + operating_System);
            System.out.println("price from request: " + price);
            System.out.println("quantity from request: " + quantity);
            System.out.println("description from request: " + description);

            LaptopDAO laptop_DAO = new LaptopDAO();
            boolean update = laptop_DAO.updateLaptop_M_noImg(model, brand, category, processor_Type, processor_Name,
                    graphic_Card, RAM, storage, screen_Size, screen_Resolution, screen_Frequestuency, operating_System,
                    price, quantity, description, laptop_ID);
            if (update) {
                request.getRequestDispatcher("manage-laptop").forward(request, response);
            } else {
                request.getRequestDispatcher("profile").forward(request, response);
            }
        } else {
            int laptop_ID = parseParameter(request.getParameter("laptop_ID"));
            String selectedBrand = request.getParameter("selectedBrand");

            System.out.println("lapid: " + laptop_ID);
            System.out.println("brand: " + selectedBrand);

            //path to upload folder
            String path = request.getServletContext().getRealPath("") + uploadFolder;
            System.out.println("path: " + path);
            String uploadDirectory = path + File.separator + selectedBrand;
            System.out.println("updi: " + uploadDirectory);
            //check folder existed
            File uploadFolder = new File(uploadDirectory);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdir();
            }

            List<String> fileNames = new ArrayList<>();
            for (Part part : request.getParts()) {
                if (part.getContentType() != null) {
                    String fileName = getFileName(part);
                    System.out.println("filename: " + fileName);
                    String filePath = uploadDirectory + File.separator + fileName;
                    System.out.println("filepath: " + filePath);
                    part.write(filePath);
                    fileNames.add(fileName);
                }
            }

            for (String f : fileNames) {
                System.out.println("filename: " + f);
            }

            LaptopDAO laptop_DAO = new LaptopDAO();
            boolean update = laptop_DAO.updateLaptop_M_Img(fileNames.get(0), fileNames.get(1), fileNames.get(2), laptop_ID);
            if (update) {
                request.getRequestDispatcher("manage-laptop").forward(request, response);
            } else {
                request.getRequestDispatcher("profile").forward(request, response);
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

    private int parseParameter(String parameter) {
        return (parameter != null && !parameter.isEmpty()) ? Integer.parseInt(parameter) : 0;
    }

    private double parseDoubleParameter(String parameter) {
        return (parameter != null && !parameter.isEmpty()) ? Double.parseDouble(parameter) : 0.0;
    }

}
