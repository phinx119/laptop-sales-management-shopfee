/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Review;

/**
 * @purpose: Access and manipulate data in the Review table.
 * @date: Sep 27, 2023
 * @author: PhiNX
 */
public class ReviewDAO extends DBContext {

    Connection cnn; //ket noi database
    Statement stm;  //Thuc hien cac cau lenh SQL
    ResultSet rs;   //Luu tru va xu li du lieu
    PreparedStatement pstm;//Thuc hien cac cau lenh SQL (Ban nang cap stm)

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public ReviewDAO() {
        connect();
    }

    /*
     * purpose: Save users feedback
     * date: Sep 30, 2023
     * author: AnNT
     */
    public boolean addReviews(int User_ID, int Product_ID, int Rating, String Comment, String Date_posted) {
        try {
            String strSQL = "INSERT INTO Reviews(User_ID, Product_ID, Rating, Comment, Date_posted)\n"
                    + "VALUES (?, ?, ?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setInt(2, Product_ID);
            pstm.setInt(3, Rating);
            pstm.setString(4, Comment);
            pstm.setString(5, Date_posted);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addProductinCart:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Get Review list + user avatar, user name
     * date: Oct 10, 2023
     * author: AnNT
     */
    public ArrayList<Review> getReviewList(int Product_ID) {
        ArrayList<Review> review_List = new ArrayList<>();
        try {
            String strSQL = "SELECT [Review_ID], Users.User_ID, [Rating], [Comment], [Date_Posted], Users.Avatar_Image, Users.Name\n"
                    + "FROM Reviews join Users \n"
                    + "On Reviews.User_ID = Users.User_ID\n"
                    + "Where Product_ID =?\n"
                    + "Order by [Date_Posted] desc;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, Product_ID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int review_ID = rs.getInt(1);
                int User_ID = rs.getInt(2);
                int Rating = rs.getInt(3);
                String commnent = rs.getString(4);
                Date date_Posted = rs.getDate(5);
                String User_avatar = rs.getString(6);
                String User_name = rs.getString(7);
                Review r = new Review(review_ID, Product_ID, User_ID, Rating, commnent, date_Posted, User_avatar, User_name);
                review_List.add(r);
            }
        } catch (SQLException e) {
            System.out.println("error getReviewList: " + e.getMessage());
        }
        return review_List;
    }

    /*
     * purpose: Get Review total of a product
     * date: Oct 15, 2023
     * author: AnNT
     */
    public int getReviewTotal(int Product_ID) {
        try {
            String strSQL = "Select count (Product_ID) from Reviews\n"
                    + "where Product_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, Product_ID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int reviewTotal = rs.getInt(1);
                return reviewTotal;
            }
        } catch (SQLException e) {
            System.out.println("error getReviewTotal: " + e.getMessage());
        }
        return 0;
    }

    /*
     * purpose: Get star rate total of a product (1-5)
     * date: Oct 22, 2023
     * author: AnNT
     */
    public int[] getStarTotal(int Product_ID) {
        int[] x = {-1, -1, -2, -1, -1};
        try {
            String strSQL = "SELECT\n"
                    + "    SUM(CASE WHEN Rating = 1 THEN 1 ELSE 0 END) AS rating_1_count,\n"
                    + "    SUM(CASE WHEN Rating = 2 THEN 1 ELSE 0 END) AS rating_2_count,\n"
                    + "    SUM(CASE WHEN Rating = 3 THEN 1 ELSE 0 END) AS rating_3_count,\n"
                    + "    SUM(CASE WHEN Rating = 4 THEN 1 ELSE 0 END) AS rating_4_count,\n"
                    + "    SUM(CASE WHEN Rating = 5 THEN 1 ELSE 0 END) AS rating_5_count\n"
                    + "FROM Reviews\n"
                    + "WHERE product_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, Product_ID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int a = rs.getInt(1);
                int b = rs.getInt(2);
                int c = rs.getInt(3);
                int d = rs.getInt(4);
                int e = rs.getInt(5);
                int[] r = {a, b, c, d, e};
                return r;
            }
        } catch (SQLException e) {
            System.out.println("error getStarTotal: " + e.getMessage());
        }
        return x;
    }

    /*
     * purpose: Edit comment (for user)
     * date: Nov 11, 2023
     * author: AnNT
     */
    public boolean updateReview(int Review_ID, String Comment) {
        try {
            String strSQL = "UPDATE Reviews SET Comment = ?\n"
                    + "WHERE Review_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Comment);
            pstm.setInt(2, Review_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateName:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to delete Review record in database by Review_ID.
     * date: Oct 10, 2023
     * author: AnNT
     */
    public boolean deleteReview(int Review_ID) {
        try {
            String strSQL = "DELETE FROM Reviews WHERE Review_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, Review_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("deleteReview:" + e.getMessage());
        }
        return false;
    }

//    /*
//     * purpose: Test ket noi database
//     * date: Oct 10, 2023
//     * author: AnNT
//     */
//    public static void main(String[] args) {
//        ReviewDAO review_DAO = new ReviewDAO();
//    }
}
