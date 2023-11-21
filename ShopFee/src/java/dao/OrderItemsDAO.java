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
import model.OrderItems;

/**
 * @purpose: Access and manipulate data in the OrderItems table.
 * @date: Oct 14, 2023
 * @author: PhiNX
 */
public class OrderItemsDAO extends DBContext {

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

    public OrderItemsDAO() {
        connect();
    }

    /*
     * purpose: Method to add a new Order data to the database.
     * date: Oct 15, 2023
     * author: PhiNX
     */
    public boolean addOrderItems(int order_Id, int laptop_Id, String model, String brand, String image, int quantity, double discount, double price) {
        try {
            String strSQL = "INSERT INTO Order_Items (Order_ID, Laptop_ID, Model, Brand, Laptop_Image1, Quantity, Discount, Price_Per_Item) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, order_Id);
            pstm.setInt(2, laptop_Id);
            pstm.setString(3, model);
            pstm.setString(4, brand);
            pstm.setString(5, image);
            pstm.setInt(6, quantity);
            pstm.setDouble(7, discount);
            pstm.setDouble(8, price);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addOrderItems:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to get Order for Admin
     * date: Oct 22, 2023
     * author: PhiNx
     */
    public List<OrderItems> getListOrderItems(int order_Id) {
        List<OrderItems> orderItem_List = new ArrayList<>();
        try {
            String strSQL = "SELECT Order_Item_ID, Order_ID, Model, Brand, Laptop_Image1, Quantity, Discount, Price_Per_Item FROM Order_Items WHERE Order_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, order_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                OrderItems orderItems = new OrderItems();
                orderItems.setOrderitemID(rs.getInt(1));
                orderItems.setOrderID(rs.getInt(2));
                orderItems.setModel(rs.getString(3));
                orderItems.setBrand(rs.getString(4));
                orderItems.setImage(rs.getString(5));
                orderItems.setQuantity(rs.getInt(6));
                orderItems.setDiscount(rs.getDouble(7));
                orderItems.setPrice(rs.getDouble(8));
                orderItem_List.add(orderItems);
            }
        } catch (SQLException e) {
            System.out.println("getListOrderItems: " + e.getMessage());
        }
        return orderItem_List;
    }

    public boolean restoreLaptop(int order_Id) {
        try {
            String strSQL = "SELECT Laptop_ID, Quantity FROM Order_Items WHERE Order_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, order_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                updateQuantity(rs.getInt(1), rs.getInt(2));                
            }
            return true;
        } catch (SQLException e) {
            System.out.println("getListOrderItems: " + e.getMessage());
        }
        return false;
    }
    
    public void updateQuantity(int laptop_Id, int quantity){
        try {
            String strSQL = "UPDATE Laptops SET Stock_Quantity = Stock_Quantity + ? WHERE Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, quantity);
            pstm.setInt(2, laptop_Id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateQuantity: " + e.getMessage());
        }
    }
}
