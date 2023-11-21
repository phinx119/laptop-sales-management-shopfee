/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderItemsDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Order;
import model.OrderItems;
import model.User;

/**
 * @purpose: Control send email to customer when order delivery success.
 * @date: Dec 29, 2023
 * @author: PhiNX
 */
public class Order_SendEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //cancel order
        if (request.getParameter("orderId") != null) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrderDAO order_DAO = new OrderDAO();
            OrderItemsDAO orderItem_DAO = new OrderItemsDAO();
            Order order = order_DAO.getOrder(orderId);
            if ("Pending".equals(order.getStatus())) {
                if (order_DAO.updateStatus("Cancel", orderId)) {
                    if (orderItem_DAO.restoreLaptop(orderId)) {
                        System.out.println("Cancel order success");
                        request.getRequestDispatcher("order-detail").forward(request, response);
                    }
                }
            } else {
                request.getRequestDispatcher("order-detail").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phonenumber");
        String status = request.getParameter("status");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDAO order_DAO = new OrderDAO();
        Order order = order_DAO.getOrder(orderId);

        OrderItemsDAO orderItems_DAO = new OrderItemsDAO();
        List<OrderItems> orderItems_List = orderItems_DAO.getListOrderItems(orderId);

        if (order_DAO.updateOrder(name, phoneNumber, status, payment, address, note, orderId)) {
            if ("Successful delivery".equals(status)) {
                HttpSession session1 = request.getSession();

                if (session1.getAttribute("user_ID") != null) {
                    UserDAO user_DAO = new UserDAO();
                    User user_Data = user_DAO.getUserDatabyID(order.getUser_ID());

                    String to = user_Data.getEmail();
                    // Get the session object
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");
                    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("swp391g2shopfee@gmail.com", "ryqg ctoy epud mpwb");// Put your email
                            // id and
                            // password here
                        }
                    });
                    // compose message
                    try {
                        DecimalFormat df = new DecimalFormat("#,##0.##");

                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress(to));// change accordingly
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Purchase Invoice #" + order.getOrder_ID());

                        // Create an HTML-formatted message content
                        String htmlMessage = "<html><body>"
                                + "<h1>Purchase Invoice #" + order.getOrder_ID() + "</h1>"
                                + "<table border='1'>"
                                + "<tr><th>Product</th><th>Quantity</th><th>Price</th></tr>";

                        for (OrderItems orderItem : orderItems_List) {
                            htmlMessage += "<tr><td>" + orderItem.getModel() + "</td>"
                                    + "<td>" + orderItem.getQuantity() + "</td>"
                                    + "<td>" + df.format((orderItem.getPrice() * (1 - orderItem.getDiscount())) * orderItem.getQuantity()) + " VND</td></tr>";
                        }

                        htmlMessage += "</table>"
                                + "<p><strong>Full name     :</strong> " + order.getName() + "</p>"
                                + "<p><strong>Phone Number  :</strong> " + order.getPhoneNumber() + "</p>"
                                + "<p><strong>Address       :</strong> " + order.getAddress() + "</p>"
                                + "<p><strong>Order Date    :</strong> " + order.getOrder_Date() + "</p>"
                                + "<p><strong>Received Date :</strong> " + LocalDate.now() + "</p>"
                                + "<p><strong>Payment Method:</strong> " + order.getPayment_Method() + "</p>"
                                + "<p><strong>Subtotal      :</strong> " + df.format(order.getTotal()) + " VND</p>"
                                + "<p><strong>Ship Fee      :</strong> " + df.format(order.getShipFee()) + "VND</p>"
                                + "<p><strong>Total         :</strong> " + df.format(order.getTotal() + order.getShipFee()) + "VND</p>"
                                + "</body></html>";

                        // Set the message content as HTML with UTF-8 encoding
                        message.setContent(htmlMessage, "text/html; charset=utf-8");
                        // send message
                        Transport.send(message);
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                }
            } else {
                System.out.println("update order success");
            }
        }
    }
}
