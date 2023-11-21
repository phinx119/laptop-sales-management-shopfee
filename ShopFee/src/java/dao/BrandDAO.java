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

/**
 * @purpose: Access and manipulate data in the Brand table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class BrandDAO extends DBContext {

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

    public BrandDAO() {
        connect();
    }

    /*
     * purpose: Define an ArrayList to store Brand objects.
     * date: Sep 19, 2023
     * author: PhiNX
     */
    public ArrayList<Brand> getBrandList() {
        ArrayList<Brand> brand_List = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM Brands";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int brand_Id = rs.getInt(1);
                String brand_Name = rs.getString(2);
                String brand_Image = rs.getString(3);
                Brand b = new Brand(brand_Id, brand_Name, brand_Image);
                brand_List.add(b);
            }
        } catch (SQLException e) {
            System.out.println("error getBrandList: " + e.getMessage());
        }
        return brand_List;
    }

}
