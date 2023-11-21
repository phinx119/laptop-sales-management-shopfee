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
import model.Order;

/**
 * @purpose: Access and manipulate data in the Order table.
 * @date: Sep 27, 2023
 * @author: PhiNX
 */
public class OrderDAO extends DBContext {

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

    public OrderDAO() {
        connect();
    }

    /*
     * purpose: Method to add a new Order data to the database.
     * date: Oct 15, 2023
     * author: PhiNX
     */
    public boolean addOrder(int user_Id, String name, String phoneNumber, String payment, double shipFee, double total, String status, String address, String note) {
        try {
            String strSQL = "INSERT INTO Orders (User_ID, Name, Phone_Number, Payment_Method, Ship_Fee, Total_Price, Status, Address, Note) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_Id);
            pstm.setString(2, name);
            pstm.setString(3, phoneNumber);
            pstm.setString(4, payment);
            pstm.setDouble(5, shipFee);
            pstm.setDouble(6, total);
            pstm.setString(7, status);
            pstm.setString(8, address);
            pstm.setString(9, note);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addOrder:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to get orderId.
     * date: Oct 15, 2023
     * author: PhiNX
     */
    public int getOrderId(int user_Id) {
        int id = 0;
        try {
            String strSQL = "SELECT Order_ID FROM Orders WHERE User_ID = ? ORDER BY Order_Date DESC;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_Id);
            rs = pstm.executeQuery();
            rs.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("getOrderId:" + e.getMessage());
        }
        return id;
    }

    /*
     * purpose: Method to get Order List By UserID
     * date: Oct 20, 2023
     * author: PhongLDM
     */
    public List<Order> getOrderByUserID(int user_Id) {
        List<Order> order_List = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM Orders WHERE User_ID = ? ORDER BY Order_ID DESC";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_ID(rs.getInt(1));
                order.setUser_ID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setPhoneNumber(rs.getString(4));
                order.setOrder_Date(rs.getDate(5));
                order.setPayment_Method(rs.getString(6));
                order.setShipFee(rs.getDouble(7));
                order.setTotal(rs.getDouble(8));
                order.setStatus(rs.getString(9));
                order.setAddress(rs.getString(10));
                order.setNote(rs.getString(11));
                order_List.add(order);
            }
        } catch (SQLException e) {
            System.out.println("getOrderByUserID: " + e.getMessage());
        }
        return order_List;
    }

    /*
     * purpose: Method to get Order List for Admin
     * date: Oct 22, 2023
     * author: PhiNx
     */
    public List<Order> getListOrder() {
        List<Order> order_List = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM Orders ORDER BY Order_ID DESC";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_ID(rs.getInt(1));
                order.setUser_ID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setPhoneNumber(rs.getString(4));
                order.setOrder_Date(rs.getDate(5));
                order.setPayment_Method(rs.getString(6));
                order.setShipFee(rs.getDouble(7));
                order.setTotal(rs.getDouble(8));
                order.setStatus(rs.getString(9));
                order.setAddress(rs.getString(10));
                order.setNote(rs.getString(11));
                order_List.add(order);
            }
        } catch (SQLException e) {
            System.out.println("getListOrder: " + e.getMessage());
        }
        return order_List;
    }

    /*
     * purpose: Method to get Order by ID
     * date: Oct 22, 2023
     * author: PhiNx
     */
    public Order getOrder(int orderId) {
        Order order = new Order();
        try {
            String strSQL = "SELECT * FROM Orders WHERE Order_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, orderId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                order.setOrder_ID(rs.getInt(1));
                order.setUser_ID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setPhoneNumber(rs.getString(4));
                order.setOrder_Date(rs.getDate(5));
                order.setPayment_Method(rs.getString(6));
                order.setShipFee(rs.getDouble(7));
                order.setTotal(rs.getDouble(8));
                order.setStatus(rs.getString(9));
                order.setAddress(rs.getString(10));
                order.setNote(rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println("getOrder: " + e.getMessage());
        }
        return order;
    }

    /*
     * purpose: Update order status
     * date: Oct 30, 2023
     * author: PhiNx
     */
    public boolean updateStatus(String status, int orderID) {
        try {
            String strSQL = "UPDATE Orders SET Status = ? WHERE Order_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, status);
            pstm.setInt(2, orderID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateStatus: " + e.getMessage());
            return false;
        }
    }

    /*
     * purpose: Update order detail
     * date: Oct 30, 2023
     * author: PhiNx
     */
    public boolean updateOrder(String name, String phoneNumber, String status, String paymentMethod, String address, String note, int orderID) {
        try {
            String strSQL = "UPDATE Orders SET Name = ?, Phone_Number = ?, Status = ?, Payment_Method = ?, Address = ?, Note = ? WHERE Order_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, name);
            pstm.setString(2, phoneNumber);
            pstm.setString(3, status);
            pstm.setString(4, paymentMethod);
            pstm.setString(5, address);
            pstm.setString(6, note);
            pstm.setInt(7, orderID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateOrder: " + e.getMessage());
            return false;
        }
    }

    /*
     * purpose: Method to get Order Total Amount
     * date: Nov 12, 2023
     * author: PhiNx
     */
    public List<Double> getOrderTotalAmount() {
        List<Double> order_TotalAmount = new ArrayList<>();
        try {
            String strSQL = "SELECT\n"
                    + "    SUM(((i.Price_Per_Item * (1 - i.Discount)) * i.Quantity + o.Ship_Fee)) AS TotalAmount\n"
                    + "FROM Orders o\n"
                    + "JOIN Order_Items i ON o.Order_ID = i.Order_ID\n"
                    + "WHERE o.Status = 'Successful delivery'\n"
                    + "GROUP BY MONTH(o.Order_Date);";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                double totalAmount = rs.getDouble("TotalAmount");
                order_TotalAmount.add(totalAmount);
            }
        } catch (SQLException e) {
            System.out.println("getOrderTotalAmount: " + e.getMessage());
        }
        return order_TotalAmount;
    }

    /*
     * purpose: Method to get Order Month
     * date: Nov 12, 2023
     * author: PhiNx
     */
    public List<Integer> getOrderMonth() {
        List<Integer> order_Month = new ArrayList<>();
        try {
            String strSQL = "SELECT\n"
                    + "MONTH(o.Order_Date) AS Month\n"
                    + "FROM Orders o\n"
                    + "JOIN Order_Items i ON o.Order_ID = i.Order_ID\n"
                    + "GROUP BY MONTH(o.Order_Date);";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int month = rs.getInt("Month");
                order_Month.add(month);
            }
        } catch (SQLException e) {
            System.out.println("getOrderMonth: " + e.getMessage());
        }
        return order_Month;
    }

    /*
     * purpose: Method to get total order
     * date: Nov 12, 2023
     * author: PhiNx
     */
    public int getTotalOrder() {
        int total = 0;
        try {
            String strSQL = "SELECT COUNT(*) AS totalOrders FROM Orders WHERE Status = 'Successful delivery'";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("totalOrders");
            }
        } catch (SQLException e) {
            System.out.println("getTotalOrder: " + e.getMessage());
        }
        return total;
    }

    /*
     * purpose: Method to get total amount
     * date: Nov 12, 2023
     * author: PhiNx
     */
    public double getTotalAmount() {
        double total = 0;
        try {
            String strSQL = "SELECT\n"
                    + "SUM(((i.Price_Per_Item * (1 - i.Discount)) * i.Quantity + o.Ship_Fee)) AS TotalAmount\n"
                    + "FROM Order_Items i\n"
                    + "JOIN Orders o ON o.Order_ID = i.Order_ID\n"
                    + "WHERE o.Status = 'Successful delivery';\n";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("TotalAmount");
            }
        } catch (SQLException e) {
            System.out.println("getTotalAmount: " + e.getMessage());
        }
        return total;
    }
}
