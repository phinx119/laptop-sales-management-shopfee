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
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import model.ShoppingCart;

/**
 * @purpose: Control delete item from Shopping Cart.
 * @date: Oct 16, 2023
 * @author: PhiNX
 */
public class Cart_DeleteItem extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        int user_ID = (int) session.getAttribute("user_ID");
        int laptop_Id = Integer.parseInt(request.getParameter("laptop_Id"));
        ShoppingCartDAO shopingcart_DAO = new ShoppingCartDAO();
        if (shopingcart_DAO.deleteProductinCart(user_ID, laptop_Id)) {
            ArrayList<ShoppingCart> cart_List = shopingcart_DAO.getCartList(user_ID);
            for (ShoppingCart c : cart_List) {
                if (c.getQuantity() != 0) {
                    String pattern = "#,##0.##";
                    double originPrice = c.getPrice();
                    DecimalFormat decimalFormat = new DecimalFormat(pattern);
                    String origin_Price = decimalFormat.format(originPrice);
                    if (c.getDiscount() != 0) {
                        double discountPrice = c.getPrice() - c.getPrice() * c.getDiscount();
                        String discount_Price = decimalFormat.format(discountPrice);
                        out.print("<tr>\n"
                                + "<td>\n"
                                + "    <input type=\"checkbox\" name=\"cartId\" value=\"" + c.getCart_ID() + "\">\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item\" style=\"width: 700px\">\n"
                                + "    <img style=\"height: 150px\" src=\"img/laptop/" + c.getBrand() + "/" + c.getImage() + "\" alt=\"\">\n"
                                + "    <h6>" + c.getProduct_name() + "</h6>\n"
                                + "</td>\n"
                                + "<td colspan=\"2\" class=\"shoping__cart__price product__discount__item__text\">\n"
                                + "    <!--View Price have Discount Event and not -->\n"
                                + "    <div class=\"product__item__price\">" + discount_Price + " VND <br><span>" + origin_Price + " VND</span></div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__quantity\">\n"
                                + "    <div class=\"quantity\">\n"
                                + "        <div class=\"pro-qty\">\n"
                                + "            <input type=\"number\" name=\"quantity\" value=\"1\" min=\"1\" max=\"" + c.getQuantity() + "\">                                                                            \n"
                                + "        </div><br>\n"
                                + "        <span>Stock: " + c.getQuantity() + "</span>\n"
                                + "    </div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item__close\">\n"
                                + "<span>\n"
                                + "    <a href=\"javascript:void(0);\" style=\"color: #96C2DB\" onclick=\"deleteItem(" + c.getProduct_ID() + ")\">\n"
                                + "         <i class=\"icon_close\"></i>\n"
                                + "    </a>\n"
                                + "</span>\n"
                                + "</td>\n"
                                + "</tr>");
                    } else {
                        out.print("<tr>\n"
                                + "<td>\n"
                                + "    <input type=\"checkbox\" name=\"cartId\" value=\"" + c.getCart_ID() + "\">\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item\" style=\"width: 700px\">\n"
                                + "    <img style=\"height: 150px\" src=\"img/laptop/" + c.getBrand() + "/" + c.getImage() + "\" alt=\"\">\n"
                                + "    <h6>" + c.getProduct_name() + "</h6>\n"
                                + "</td>\n"
                                + "<td colspan=\"2\" class=\"shoping__cart__price\">\n"
                                + "    <!--View Price does not have Discount Event -->\n"
                                + "    <div class=\"product__item__price\">" + origin_Price + " VND <br><span></span></div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__quantity\">\n"
                                + "    <div class=\"quantity\">\n"
                                + "        <div class=\"pro-qty\">\n"
                                + "            <input type=\"number\" name=\"quantity\" value=\"1\" min=\"1\" max=\"" + c.getQuantity() + "\">                                                                            \n"
                                + "        </div><br>\n"
                                + "        <span>Stock: " + c.getQuantity() + "</span>\n"
                                + "    </div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item__close\">\n"
                                + "<span>\n"
                                + "    <a href=\"javascript:void(0);\" style=\"color: #96C2DB\" onclick=\"deleteItem(" + c.getProduct_ID() + ")\">\n"
                                + "         <i class=\"icon_close\"></i>\n"
                                + "    </a>\n"
                                + "</span>\n"
                                + "</td>\n"
                                + "</tr>");
                    }
                } else {
                    String pattern = "#,##0.##";
                    double originPrice = c.getPrice();
                    DecimalFormat decimalFormat = new DecimalFormat(pattern);
                    String origin_Price = decimalFormat.format(originPrice);
                    if (c.getDiscount() != 0) {
                        double discountPrice = c.getPrice() - c.getPrice() * c.getDiscount();
                        String discount_Price = decimalFormat.format(discountPrice);
                        out.print("<tr>\n"
                                + "<td></td>\n"
                                + "<td class=\"shoping__cart__item\" style=\"width: 700px\">\n"
                                + "    <img style=\"height: 150px\" src=\"img/laptop/" + c.getBrand() + "/" + c.getImage() + "\" alt=\"\">\n"
                                + "    <h6>" + c.getProduct_name() + "</h6>\n"
                                + "</td>\n"
                                + "<td colspan=\"2\" class=\"shoping__cart__price product__discount__item__text\">\n"
                                + "    <!--View Price have Discount Event and not -->\n"
                                + "    <div class=\"product__item__price\">" + discount_Price + " VND <br><span>" + origin_Price + " VND</span></div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__quantity\">\n"
                                + "    <div class=\"quantity\">\n"
                                + "        <span>Stock: " + c.getQuantity() + "</span>\n"
                                + "    </div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item__close\">\n"
                                + "<span>\n"
                                + "    <a href=\"javascript:void(0);\" style=\"color: #96C2DB\" onclick=\"deleteItem(" + c.getProduct_ID() + ")\">\n"
                                + "         <i class=\"icon_close\"></i>\n"
                                + "    </a>\n"
                                + "</span>\n"
                                + "</td>\n"
                                + "</tr>");
                    } else {
                        out.print("<tr>\n"
                                + "<td></td>\n"
                                + "<td class=\"shoping__cart__item\" style=\"width: 700px\">\n"
                                + "    <img style=\"height: 150px\" src=\"img/laptop/" + c.getBrand() + "/" + c.getImage() + "\" alt=\"\">\n"
                                + "    <h6>" + c.getProduct_name() + "</h6>\n"
                                + "</td>\n"
                                + "<td colspan=\"2\" class=\"shoping__cart__price\">\n"
                                + "    <!--View Price does not have Discount Event -->\n"
                                + "    <div class=\"product__item__price\">" + origin_Price + " VND <br><span></span></div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__quantity\">\n"
                                + "    <div class=\"quantity\">\n"
                                + "        <span>Stock: " + c.getQuantity() + "</span>\n"
                                + "    </div>\n"
                                + "</td>\n"
                                + "<td class=\"shoping__cart__item__close\">\n"
                                + "<span>\n"
                                + "    <a href=\"javascript:void(0);\" style=\"color: #96C2DB\" onclick=\"deleteItem(" + c.getProduct_ID() + ")\">\n"
                                + "         <i class=\"icon_close\"></i>\n"
                                + "    </a>\n"
                                + "</span>\n"
                                + "</td>\n"
                                + "</tr>");
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
