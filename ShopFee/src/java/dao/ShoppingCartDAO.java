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
import model.ShoppingCart;

/**
 * @purpose: Access and manipulate data in the ShoppingCart table.
 * @date: Sep 27, 2023
 * @author: PhiNX
 */
public class ShoppingCartDAO extends DBContext {

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

    public ShoppingCartDAO() {
        connect();
    }

    /*
     * purpose: Xoa product khoi Cart bang Product ID
     * date: Sep 30, 2023
     * author: AnNT
     */
    public boolean deleteProductinCart(int User_ID, int Product_ID) {
        try {
            String strSQL = "DELETE FROM Shopping_Cart WHERE User_ID = ? and Product_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setInt(2, Product_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("deleteProductinCart :" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Check product exsit
     * date: Oct 07, 2023
     * author: PhiNX
     */
    public boolean checkProduct(int User_ID, int Product_ID) {
        try {
            String strSQL = "SELECT * FROM Shopping_Cart WHERE User_ID = ? and Product_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setInt(2, Product_ID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkProduct: " + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Them product vao Cart
     * date: Sep 30, 2023
     * author: AnNT
     */
    public boolean addProduct(int User_ID, int Product_ID, int Quantity) {
        try {
            String strSQL = "INSERT INTO Shopping_Cart(User_ID, Product_ID, Quantity)\n"
                    + "VALUES (?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setInt(2, Product_ID);
            pstm.setInt(3, Quantity);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addProductinCart:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Edit quantity of product in Cart
     * date: Sep 30, 2023
     * author: AnNT
     */
    public boolean updateQuantity(int User_ID, int Product_ID, int Quantity) {
        try {
            String strSQL = "UPDATE Shopping_Cart SET Quantity = ? WHERE User_ID = ?\n"
                    + "AND Product_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, User_ID);
            pstm.setInt(2, Product_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateName:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Define an ArrayList to store ShoppingCart objects.
     * date: Oct 07, 2023
     * author: PhiNX
     */
    public ArrayList<ShoppingCart> getCartList(int user_Id) {
        ArrayList<ShoppingCart> cart_List = new ArrayList<>();
        try {
            String strSQL = "SELECT Cart_ID, User_ID, c.Product_ID, l.Laptop_Image1, l.Model, l.Price, d.Discount, l.Stock_Quantity, l.Stock_Quantity, Brand_Name "
                    + "FROM Shopping_Cart c, Laptops l, Discount d, Brands b "
                    + "WHERE c.Product_ID = l.Laptop_ID and d.Category_ID = l.Category_ID and l.Brand_ID = b.Brand_ID and User_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int cart_ID = rs.getInt(1);
                int user_ID = rs.getInt(2);
                int product_ID = rs.getInt(3);
                String image = rs.getString(4);
                String product_name = rs.getString(5);
                double price = rs.getDouble(6);
                double discount = rs.getDouble(7);
                int quantity = rs.getInt(8);
                int stock_quantity = rs.getInt(9);
                String brand = rs.getString(10);
                cart_List.add(new ShoppingCart(cart_ID, user_ID, product_ID, brand, image, product_name, price, discount, quantity, stock_quantity));
            }
        } catch (SQLException e) {
            System.out.println("getCartList:" + e.getMessage());
        }
        return cart_List;
    }

    /*
     * purpose: Get ShoppingCart objects by Cart_Id.
     * date: Oct 14, 2023
     * author: PhiNX
     */
    public ShoppingCart getCartbyID(int cart_Id) {
        try {
            String strSQL = "SELECT Cart_ID, User_ID, c.Product_ID, l.Laptop_Image1, l.Model, l.Price, d.Discount, l.Stock_Quantity, l.Stock_Quantity, Brand_Name "
                    + "FROM Shopping_Cart c, Laptops l, Discount d, Brands b "
                    + "WHERE c.Product_ID = l.Laptop_ID and d.Category_ID = l.Category_ID and l.Brand_ID = b.Brand_ID and Cart_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, cart_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int cart_ID = rs.getInt(1);
                int user_ID = rs.getInt(2);
                int product_ID = rs.getInt(3);
                String image = rs.getString(4);
                String product_name = rs.getString(5);
                double price = rs.getDouble(6);
                double discount = rs.getDouble(7);
                int quantity = rs.getInt(8);
                int stock_quantity = rs.getInt(9);
                String brand = rs.getString(10);
                ShoppingCart cart = new ShoppingCart(cart_ID, user_ID, product_ID, brand, image, product_name, price, discount, quantity, stock_quantity);
                return cart;
            }
        } catch (SQLException e) {
            System.out.println("getCartbyID:" + e.getMessage());
        }
        return null;
    }

}
