/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
import model.Laptop;

/**
 * @purpose: Search product with Ajax
 * @date: Dec 15, 2023
 * @author: HieuNT
 */
public class Product_AjaxSearch extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        LaptopDAO ld = new LaptopDAO();
        String search = request.getParameter("search");
        ArrayList<Laptop> list = ld.searchByName(search);
        for (Laptop l : list) {
            String pattern = "#,##0.##";
            double originPrice = l.getPrice();
            DecimalFormat decimalFormat = new DecimalFormat(pattern);
            String origin_Price = decimalFormat.format(originPrice);
            if (l.getDiscount() == 0) {
                out.print("<div class=\"col-lg-4\">\n"
                        + "                                    <div class=\"product__item product__discount__item\">\n"
                        + "                                        <div class=\"product__item__pic product__discount__item__pic\">\n"
                        + "                                            <!-- Product Image -->\n"
                        + "                                            <a href=\"productdetail?product_ID=" + l.getId() + "\">\n"
                        + "                                                <img src=\"" + "img/laptop/" +l.getBrand()+ "/" +l.getLaptop_Image1() + "\" alt=\"alt\"/>\n"
                        + "                                            </a>\n"
                        + "                                            <!-- Product Discount -->\n"
                        + "                                            <!-- Add to cart -->\n"
                        + "                                            <ul class=\"product__item__pic__hover\">\n"
                        + "                                                <li><a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n"
                        + "                                            </ul>\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"product__item__text product__discount__item__text\">\n"
                        + "                                            <!-- Link to Product Detail -->\n"
                        + "                                            <h6><a href=\"productdetail?product_ID=" + l.getId() + "\">" + l.getModel() + "</a></h6>\n"
                        + "                                                <!-- View Price doesn't have Discount Event -->\n"
                        + "                                                <div class=\"product__item__price\">" + origin_Price + " VND <br><span></span></div>\n"
                        + "                                        </div>\n"
                        + "                                    </div>"
                        + "</div>");
            } else {
                double discountPrice = l.getPrice() - l.getPrice() * l.getDiscount();
                String discount_Price = decimalFormat.format(discountPrice);
                out.print("<div class=\"col-lg-4\">\n"
                        + "                                    <div class=\"product__item product__discount__item\">\n"
                        + "                                        <div class=\"product__item__pic product__discount__item__pic\">\n"
                        + "                                            <!-- Product Image -->\n"
                        + "                                            <a href=\"productdetail?product_ID=" + l.getId() + "\">\n"
                        + "                                                <img src=\"" + "img/laptop/" +l.getBrand()+ "/" +l.getLaptop_Image1() + "\" alt=\"alt\"/>\n"
                        + "                                            </a>\n"
                        + "                                            <!-- Product Discount -->\n"
                        + "                                            <div class=\"product__discount__percent\">-" + l.getDiscount() * 100 + "%</div>\n"
                        + "                                            <!-- Add to cart -->\n"
                        + "                                            <ul class=\"product__item__pic__hover\">\n"
                        + "                                                <li><a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n"
                        + "                                            </ul>\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"product__item__text product__discount__item__text\">\n"
                        + "                                            <!-- Link to Product Detail -->\n"
                        + "                                            <h6><a href=\"productdetail?product_ID=" + l.getId() + "\">" + l.getModel() + "</a></h6>\n"
                        + "                                                <!-- View Price have Discount Event -->\n"
                        + "                                                <div class=\"product__item__price\">" + discount_Price + " VND <br><span>" + origin_Price + " VND</span></div>\n"
                        + "                                        </div>\n"
                        + "                                    </div>"
                        + "</div>");
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
