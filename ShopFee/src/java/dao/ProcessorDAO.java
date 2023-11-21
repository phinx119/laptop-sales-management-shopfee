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
import model.Processor;

/**
 * @purpose: Access and manipulate data in the Processor table.
 * @date: Sep 16, 2023
 * @author: PhiNX
 */
public class ProcessorDAO extends DBContext {

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

    public ProcessorDAO() {
        connect();
    }

    /*
     * purpose: Define an ArrayList to store Processor objects.
     * date: Sep 24, 2023
     * author: PhiNX
     */
    public ArrayList<Processor> getProcessorList() {
        ArrayList<Processor> processor_List = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM Processor_Types";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int processor_Id = rs.getInt(1);
                String processor_Name = rs.getString(2);
                processor_List.add(new Processor(processor_Id, processor_Name));
            }
        } catch (SQLException e) {
            System.out.println("error getProcessorList: " + e.getMessage());
        }
        return processor_List;
    }
}
