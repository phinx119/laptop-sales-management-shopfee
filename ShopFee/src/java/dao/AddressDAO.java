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

/**
 * @purpose: Access and manipulate data to get address of user.
 * @date: Oct 12, 2023
 * @author: PhongLDM
 */
public class AddressDAO extends DBContext {

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

    public AddressDAO() {
        connect();
    }

    /*
     * purpose: Lay address
     * date: Oct 12, 2023
     * author: PhongLDM
     */
    public boolean getAddress(int User_ID, String phoneNumber, String City, String Ward, String District, String Note) {
        try {
            String strSQL = "insert into Address(User_ID, Phone_Number, City, District, Ward, Note)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setString(2, phoneNumber);
            pstm.setString(3, City);
            pstm.setString(4, Ward);
            pstm.setString(5, District);
            pstm.setString(6, Note);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("getAddress:" + e.getMessage());
        }
        return false;
    }
}
