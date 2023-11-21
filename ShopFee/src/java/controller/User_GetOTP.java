/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @purpose: Control Get OTP screen.
 * @date: Sep 21, 2023
 * @author: HuyLD
 */
public class User_GetOTP extends HttpServlet {

    Random rand = new Random();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (request.getParameter("register") != null) {
            session.setAttribute("register", request.getParameter("register"));
        }

        request.getRequestDispatcher("user_getOTP.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession mySession = request.getSession();
        String email = request.getParameter("email");
        System.out.println("email: " + email);
        System.out.println("register: " + mySession.getAttribute("register"));
        System.out.println("changeemail: " + request.getParameter("changeemail"));

        UserDAO user_DAO = new UserDAO();
        if (user_DAO.isValidEmail(email)) {
            if (mySession.getAttribute("register") == null & request.getParameter("changeemail") == null) {
                System.out.println("1");
                if (user_DAO.checkEmail(email)) {
                    int otpvalue = 0;
                    if (email != null || !email.equals("")) {
                        // sending otp

                        otpvalue = rand.nextInt(1255650);

                        String to = email;// change accordingly
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
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(email));// change accordingly
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            message.setSubject("Hello");
                            message.setText("Your OTP is: " + otpvalue);
                            // send message
                            Transport.send(message);
                            System.out.println("OTP sent successfully");
                        } catch (MessagingException e) {
                            throw new RuntimeException(e);
                        }
                        request.setAttribute("message", "OTP is sent to your email address.");
                        request.setAttribute("type", "success");
                        mySession.setAttribute("otp", otpvalue);
                        mySession.setAttribute("email", email);

                        request.getRequestDispatcher("user_validateOTP.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Email address not exist.");
                    request.getRequestDispatcher("user_getOTP.jsp").forward(request, response);
                }
            } else if (mySession.getAttribute("register") != null || request.getParameter("changeemail") != null) {
                System.out.println("2");
                if (user_DAO.checkEmail(email)) {
                    request.setAttribute("message", "Email already used.");
                    request.getRequestDispatcher("user_getOTP.jsp").forward(request, response);
                } else {
                    int otpvalue = 0;
                    if (email != null || !email.equals("")) {
                        // sending otp
                        Random rand = new Random();
                        otpvalue = rand.nextInt(1255650);

                        String to = email;// change accordingly
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
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(email));// change accordingly
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            message.setSubject("Hello");
                            message.setText("Your OTP is: " + otpvalue);
                            // send message
                            Transport.send(message);
                            System.out.println("OTP sent successfully");
                        } catch (MessagingException e) {
                            throw new RuntimeException(e);
                        }
                        request.setAttribute("message", "OTP is sent to your email address.");
                        
                        mySession.setAttribute("otp", otpvalue);
                        mySession.setAttribute("email", email);

                        request.getRequestDispatcher("user_validateOTP.jsp").forward(request, response);
                    }
                }
            }
        } else {
            request.setAttribute("message", "Invalied Email.");
            request.getRequestDispatcher("user_getOTP.jsp").forward(request, response);
        }
    }
}
