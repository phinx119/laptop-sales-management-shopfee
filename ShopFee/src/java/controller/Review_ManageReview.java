/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Review;

/**
 * @purpose: Control manage Review.
 * @date: Dec 20, 2023
 * @author: AnNT
 */
public class Review_ManageReview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ReviewDAO review_DAO = new ReviewDAO();
        int product_ID = Integer.parseInt(request.getParameter("product_ID"));
        ArrayList<Review> review_List = review_DAO.getReviewList(product_ID);

        for (Review r : review_List) {
            out.println("<div class=\"container\">\n"
                    + "                                                                  <div class=\"row\">\n"
                    + "                                                                      <div class=\"col-lg-1\">\n"
                    + "                                                                          <div class=\"avatar\">\n"
                    + "                                                                                <img  style=\"height: 60px; width: 60px; border: solid #96C2DB 1px; border-radius: 90px\" src=\"img/user-avatar/" + r.getUser_avatar() + "\"> \n"
                    + "                                                                          </div>\n"
                    + "                                                                      </div>\n"
                    + "                                                                      <div class=\"col-lg-11\">\n"
                    + "                                                                          <div class=\"comment_content\">\n"
                    + "                                                                              <div class=\"comment_meta\">\n"
                    + "                                                                                  <div class=\"comment_wrap_left\">					\n"
                    + "                                                                                      <h4 class=\"comment_author\"  style=\"display: inline\">" + r.getUser_name() + "</h4> \n"
                    + "                                                                                      <div class=\"comment_time\" style=\"display: inline\">" + r.getDate_Posted() + "</div>\n"
                    + "                                                                                  </div>\n"
                    + "                                                                                  <div class=\"comment_wrap_right\">					\n"
//                    + "                                                                                      <button class=\"comment_edit\"  style=\"display: inline; padding-left: 5px; color: #007bff; border: none;\" onclick=\"editComment(" + r.getReview_ID() + ")\">Edit</button>\n"
                    + "                                                                                      <button class=\"comment_delete\" id=\"comment_delete\" style=\"display: inline; padding-left: 5px; color: #af1310; border: none;\" onclick=\"deleteComment(" + r.getReview_ID() + ")\">Delete</button>\n"
                    + "                                                                                  </div>\n"
                    + "                                                                                  <div class=\"clearfix\"></div>\n"
                    + "                                                                              </div>\n"
                    + "                                                                              <div class=\"comment_text\">\n"
                    + "                                                                                  <p>" + r.getCommnent() + "</p>\n"
                    + "                                                                              </div>                                                                                \n"
                    + "                                                                          </div>\n"
//                    + "                                                                          <div class=\"comment_footer\">\n"
//                    + "                                                                              <a class=\"report\" href=\"#\" style=\"\">\n"
//                    + "                                                                                  <i class=\"fa fa-flag\" aria-hidden=\"true\"></i> Báo cáo\n"
//                    + "                                                                              </a>\n"
//                    + "                                                                          </div>\n"
                    + "                                                                      </div>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>                        ");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        ReviewDAO review_DAO = new ReviewDAO();

        if (null != request.getParameter("action")) {
            switch (request.getParameter("action")) {
                case "add":
                    int pid = Integer.parseInt(request.getParameter("product_ID"));
                    //add review
                    if (request.getParameter("rate") != null) {
                        String comment_date = request.getParameter("comment_date");
                        String comment = request.getParameter("comments");
                        int rate = Integer.parseInt(request.getParameter("rate"));
                        int uid = (int) session.getAttribute("user_ID");
                        if (comment != null && !"".equals(comment)) {
                            if (review_DAO.addReviews(uid, pid, rate, comment, comment_date)) {
                                request.setAttribute("message4", "Submit review success!");
                            }
                        }
                    }
                    break;
                case "edit":
                    String cmEdit = request.getParameter("cmEdit");
                    int rid = Integer.parseInt(request.getParameter("Review_ID"));
                    review_DAO.updateReview(rid, cmEdit);
                    processRequest(request, response);
                    break;
                case "delete":
                    if (request.getParameter("Review_ID") != null) {
                        review_DAO.deleteReview(Integer.parseInt(request.getParameter("Review_ID")));
                    }
                    break;
                default:
                    break;
            }
        }
        processRequest(request, response);
    }

}
