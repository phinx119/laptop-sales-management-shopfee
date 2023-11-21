/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Brand;
import model.Discount;

/**
 *
 * @author Home_PC
 */
public class DiscountDAO extends DBContext {

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

    public DiscountDAO() {
        connect();
    }

    public ArrayList<Discount> getDiscount() {
        ArrayList<Discount> dl = new ArrayList<>();
        try {
            String strSQL = "select d.Category_ID,c.Category_Name,d.Discount\n"
                    + "FROM Discount d, Category c\n"
                    + "where d.Category_ID = c.Category_ID";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int cateID = rs.getInt(1);
                String cateName = rs.getString(2);
                double discount = rs.getDouble(3);
                Discount d = new Discount(cateID,cateName ,discount);
                dl.add(d);
            }
        } catch (SQLException e) {
            System.out.println("error getDiscount: " + e.getMessage());
        }
        return dl;
    }

    public void updateDiscount(int cateID, double discount) {
        try {
            String strSQL = "UPDATE Discount set discount=? where Category_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(2, cateID);
            pstm.setDouble(1, discount);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error updateDiscount: " + e.getMessage());
        }
    }
}
