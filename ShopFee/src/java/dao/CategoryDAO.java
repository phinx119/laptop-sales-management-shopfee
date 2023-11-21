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
import model.Category;

/**
 * @purpose: Access and manipulate data in the Category table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class CategoryDAO extends DBContext {

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

    public CategoryDAO() {
        connect();
    }

    /*
     * purpose: Define an ArrayList to store Category objects.
     * date: Sep 24, 2023
     * author: PhiNX
     */
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> category_List = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM Category";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int category_Id = rs.getInt(1);
                String category_Name = rs.getString(2);
                String category_Image = rs.getString(3);
                category_List.add(new Category(category_Id, category_Name, category_Image));
            }
        } catch (SQLException e) {
            System.out.println("error getCategoryList: " + e.getMessage());
        }
        return category_List;
    }
}
