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
import java.util.List;
import model.Role;

/**
 * @purpose: Access and manipulate data in the Role table.
 * @date: Oct 26, 2023
 * @author: PhiNX
 */
public class RoleDAO extends DBContext {
    
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

    public RoleDAO() {
        connect();
    }
    
    public List<Role> getRoleList(){
        List<Role> roleList = new ArrayList<>();
        try{
            String sql = "SELECT * FROM Roles";
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while(rs.next()){
                Role role = new Role();
                role.setRoleId(rs.getInt(1));
                role.setRoleName(rs.getString(2));
                
                roleList.add(role);
            }
        } catch (SQLException e) {
            System.out.println("getRoleList:" + e.getMessage());
        }
        return roleList;
    }
}
