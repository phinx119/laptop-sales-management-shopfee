/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import dao.OrderDAO;
import dao.OrderItemsDAO;
import dao.ShoppingCartDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Order;
import model.ShoppingCart;

/**
 * @purpose: Control check out feature.
 * @date: Oct 15, 2023
 * @author: PhiNX
 */
public class Order_Checkout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        ArrayList<ShoppingCart> cart_list = (ArrayList<ShoppingCart>) session.getAttribute("cart_list");
        int user_id = (int) session.getAttribute("user_ID");

        LaptopDAO laptop_DAO = new LaptopDAO();
        ShoppingCartDAO cart_DAO = new ShoppingCartDAO();
        OrderDAO order_DAO = new OrderDAO();
        OrderItemsDAO orderitems_DAO = new OrderItemsDAO();

        if (session.getAttribute("order") == null) {

            String name = request.getParameter("name");
            String phonenumber = request.getParameter("phonenumber");
            String payment = request.getParameter("payment");
            Double shipFee = Double.parseDouble(request.getParameter("shipFee"));
            Double total = Double.parseDouble(request.getParameter("total"));
            String city = request.getParameter("city");
            String commas = ", ";
            String address = request.getParameter("address").concat(commas).concat(city);
            String note = request.getParameter("note");

            if ("VNPAY".equals(payment)) {
                Order order = new Order(name, phonenumber, payment, shipFee, total, address, note);
                session.setAttribute("order", order);
                int parsedInt = Integer.parseInt(String.valueOf((int) (shipFee + total)));
                request.setAttribute("total", parsedInt);
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            } else {
                if ("In store".equals(payment)) {
                    if (order_DAO.addOrder(user_id, name, phonenumber, payment, shipFee, total, "Successful delivery", address, note)) {
                        int id = order_DAO.getOrderId(user_id);
                        System.out.println("userid checkout: " + id);
                        for (ShoppingCart cartItem : cart_list) {
                            if (orderitems_DAO.addOrderItems(id, cartItem.getProduct_ID(), cartItem.getProduct_name(), cartItem.getBrand(), cartItem.getImage(), cartItem.getQuantity(), cartItem.getDiscount(), cartItem.getPrice())) {
                                if (cart_DAO.deleteProductinCart(user_id, cartItem.getProduct_ID())) {
                                    if (laptop_DAO.updateQuantity(cartItem.getQuantity(), cartItem.getProduct_ID())) {
                                        System.out.println("Delete product: " + cartItem.getProduct_name());
                                    }
                                }
                            }
                        }
                        request.setAttribute("orderId", id);
                        request.getRequestDispatcher("order-successful").forward(request, response);
                    }
                } else {
                    if (order_DAO.addOrder(user_id, name, phonenumber, payment, shipFee, total, "Pending", address, note)) {
                        int id = order_DAO.getOrderId(user_id);
                        System.out.println("userid checkout: " + id);
                        for (ShoppingCart cartItem : cart_list) {
                            if (orderitems_DAO.addOrderItems(id, cartItem.getProduct_ID(), cartItem.getProduct_name(), cartItem.getBrand(), cartItem.getImage(), cartItem.getQuantity(), cartItem.getDiscount(), cartItem.getPrice())) {
                                if (cart_DAO.deleteProductinCart(user_id, cartItem.getProduct_ID())) {
                                    if (laptop_DAO.updateQuantity(cartItem.getQuantity(), cartItem.getProduct_ID())) {
                                        System.out.println("Delete product: " + cartItem.getProduct_name());
                                    }
                                }
                            }
                        }
                        request.setAttribute("orderId", id);
                        request.getRequestDispatcher("order-successful").forward(request, response);
                    }
                }
            }
        } else {
            Order order = (Order) session.getAttribute("order");

            String name = order.getName();
            String phonenumber = order.getPhoneNumber();
            String payment = order.getPayment_Method();
            Double shipFee = order.getShipFee();
            Double total = order.getTotal();
            String address = order.getAddress();
            String note = order.getNote();

            if (order_DAO.addOrder(user_id, name, phonenumber, payment, shipFee, total, "Pending", address, note)) {
                int id = order_DAO.getOrderId(user_id);
                System.out.println("userid checkout: " + id);
                for (ShoppingCart cartItem : cart_list) {
                    if (orderitems_DAO.addOrderItems(id, cartItem.getProduct_ID(), cartItem.getProduct_name(), cartItem.getBrand(), cartItem.getImage(), cartItem.getQuantity(), cartItem.getDiscount(), cartItem.getPrice())) {
                        if (cart_DAO.deleteProductinCart(user_id, cartItem.getProduct_ID())) {
                            if (laptop_DAO.updateQuantity(cartItem.getQuantity(), cartItem.getProduct_ID())) {
                                System.out.println("Delete product: " + cartItem.getProduct_name());
                            }
                        }
                    }
                }
                request.setAttribute("orderId", id);
                session.removeAttribute("order");
                request.getRequestDispatcher("order-successful").forward(request, response);
            }
        }
    }
}
