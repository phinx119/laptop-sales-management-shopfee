
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Laptop;

/**
 * @purpose: Access and manipulate data in the Laptop table.
 * @date: Sep 16, 2023
 * @author: HieuNT
 */
public class LaptopDAO extends Laptop {

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

    public LaptopDAO() {
        connect();
    }

    public LaptopDAO(int id) {
        super(id);
        connect();
    }

    public LaptopDAO(String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, double discount, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        super(brand, model, category, processor_Type, processor_Name, graphic_Card, RAM, storage, screen_Size, screen_Resolution, screen_Frequency, operating_System, price, discount, quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, description);
        connect();
    }

    public LaptopDAO(int id, String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, double discount, int quantity, String description) {
        super(id, brand, model, category, processor_Type, processor_Name, graphic_Card, RAM, storage, screen_Size, screen_Resolution, screen_Frequency, operating_System, price, discount, quantity, description);
        connect();
    }

    public LaptopDAO(int id, String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        super(id, brand, model, category, processor_Type, processor_Name, graphic_Card, RAM, storage, screen_Size, screen_Resolution, screen_Frequency, operating_System, price, quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, description);
        connect();
    }

    public LaptopDAO(String brand, String model, String category, String processor_Type, String processor_Name, String graphic_Card, int RAM, String storage, double screen_Size, String screen_Resolution, int screen_Frequency, String operating_System, double price, int quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, String description) {
        super(brand, model, category, processor_Type, processor_Name, graphic_Card, RAM, storage, screen_Size, screen_Resolution, screen_Frequency, operating_System, price, quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, description);
        connect();
    }

    /*
     * purpose: Define an ArrayList to store Laptop objects.
     * date: Sep 25, 2023
     * author: PhiNX
     */
    public ArrayList<Laptop> getLaptopList() {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and l.Category_ID = d.Category_ID and Status=1";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getLaptopList:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: Update laptop quantity after check out.
     * date: Oct 16, 2023
     * author: PhiNX
     */
    public boolean updateQuantity(int quantity, int laptop_Id) {
        try {
            String strSQL = "UPDATE Laptops SET Stock_Quantity = Stock_Quantity - ? WHERE Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, quantity);
            pstm.setInt(2, laptop_Id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateQuantity:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Define an ArrayList to store Unapprove Laptop objects.
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public ArrayList<Laptop> getUnapprovesList() {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "		Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "		Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and d.Category_ID = l.Category_ID and Status=0";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getLaptopList:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: Method to retrieve a Laptop object by ID from the database.
     * date: Sep 26, 2023
     * author: PhiNX
     */
    public Laptop getLaptopByID(int laptop_Id) {
        Laptop laptop_Detail = new Laptop();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and d.Category_ID = l.Category_ID and Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, laptop_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                laptop_Detail.setId(laptop_Id);
                laptop_Detail.setBrand(rs.getString(2));
                laptop_Detail.setModel(rs.getString(3));
                laptop_Detail.setCategory(rs.getString(4));
                laptop_Detail.setProcessor_Type(rs.getString(5));
                laptop_Detail.setProcessor_Name(rs.getString(6));
                laptop_Detail.setGraphic_Card(rs.getString(7));
                laptop_Detail.setRAM(rs.getInt(8));
                laptop_Detail.setStorage(rs.getString(9));
                laptop_Detail.setScreen_Size(rs.getDouble(10));
                laptop_Detail.setScreen_Resolution(rs.getString(11));
                laptop_Detail.setScreen_Frequency(rs.getInt(12));
                laptop_Detail.setOperating_System(rs.getString(13));
                laptop_Detail.setPrice(rs.getDouble(14));
                laptop_Detail.setDiscount(rs.getDouble(15));
                laptop_Detail.setQuantity(rs.getInt(16));
                laptop_Detail.setLaptop_Image1(rs.getString(17));
                laptop_Detail.setLaptop_Image2(rs.getString(18));
                laptop_Detail.setLaptop_Image3(rs.getString(19));
                laptop_Detail.setDescription(rs.getString(20));
            }
        } catch (SQLException e) {
            System.out.println("getLaptopByID:" + e.getMessage());
        }
        return laptop_Detail;
    }

    public ArrayList<Laptop> getLaptopsByCategory(String categoryId) {
        ArrayList<Laptop> laptops = new ArrayList<>();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and d.Category_ID = l.Category_ID and l.Category_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, categoryId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getLaptopsByCategory: " + e.getMessage());
        }
        return laptops;
    }

    public ArrayList<Laptop> getLaptopsByBrand(int brand_Id) {
        ArrayList<Laptop> laptops = new ArrayList<>();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and d.Category_ID = l.Category_ID and l.Brand_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, brand_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getLaptopsByBrand: " + e.getMessage());
        }
        return laptops;
    }

    /**
     * @return @purpose: Access and manipulate data in the Laptop table.
     * @date: Oct 3, 2023
     * @author: HieuNT
     */
    public boolean addLaptop_M() {
        try {
            String strSQL = "insert into Laptops (brand_id, model, category_id, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, "
                    + "Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, "
                    + "Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,0)";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, brand);
            pstm.setString(2, model);
            pstm.setString(3, category);
            pstm.setString(4, processor_Type);
            pstm.setString(5, processor_Name);
            pstm.setString(6, graphic_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, storage);
            pstm.setDouble(9, screen_Size);
            pstm.setString(10, screen_Resolution);
            pstm.setInt(11, screen_Frequency);
            pstm.setString(12, operating_System);
            pstm.setDouble(13, price);
            pstm.setInt(14, quantity);
            pstm.setString(15, Laptop_Image1);
            pstm.setString(16, Laptop_Image2);
            pstm.setString(17, Laptop_Image3);
            pstm.setString(18, description);
            pstm.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("addLapop_M" + e.getMessage());
        }
        return false;
    }

    /*
     * @return @purpose: Access and manipulate data in the Laptop table.
     * @date: Oct 3, 2023
     * @author: HieuNT
     */
    public boolean addLaptop_A() {
        try {
            String strSQL = "insert into Laptops (brand_id,model,category_id,Processor_Type_ID,Processor_Type_Name,Graphics_Card,RAM,"
                    + "Storage,Screen_Size,Screen_Resolution,Screen_Frequency,Operating_System,Price,Stock_Quantity,"
                    + "Laptop_Image1,Laptop_Image2,Laptop_Image3,Description,Status) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, brand);
            pstm.setString(2, model);
            pstm.setString(3, category);
            pstm.setString(4, processor_Type);
            pstm.setString(5, processor_Name);
            pstm.setString(6, graphic_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, storage);
            pstm.setDouble(9, screen_Size);
            pstm.setString(10, screen_Resolution);
            pstm.setInt(11, screen_Frequency);
            pstm.setString(12, operating_System);
            pstm.setDouble(13, price);
            pstm.setInt(14, quantity);
            pstm.setString(15, Laptop_Image1);
            pstm.setString(16, Laptop_Image2);
            pstm.setString(17, Laptop_Image3);
            pstm.setString(18, description);
            pstm.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("addLapop_A" + e.getMessage());
        }
        return false;
    }
//
//    public void deleteLaptopsByID(String parameter) {
//        try {
//            String strSQL = "delete from Laptops where Laptop_ID = ?";
//            pstm = cnn.prepareStatement(strSQL);
//            pstm.setString(1, parameter);
//            rs = pstm.executeQuery();
//        } catch (SQLException e) {
//            System.out.println("deleteLaptopById :" + e.getMessage());
//        }
//    }
//

    /**
     * Access and manipulate data in the Laptop table. Oct 3, 2023 HieuNT
     */
    public void UpdateLaptop_M(int id) {
        try {
            String strSQL = "update Laptops set Brand_ID=?,Model=?,Category_ID=?,Processor_Type_ID=?,Processor_Type_Name=?,"
                    + " Graphics_Card=?,RAM=?,Storage=?,Screen_Size=?,Screen_Resolution=?,Screen_Frequency=?,Operating_System=?,"
                    + "Price=?,Stock_Quantity=?,Laptop_Image1=?,Laptop_Image2=?,Laptop_Image3=?,"
                    + "Description=?,Status=0 Where Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, brand);
            pstm.setString(2, model);
            pstm.setString(3, category);
            pstm.setString(4, processor_Type);
            pstm.setString(5, processor_Name);
            pstm.setString(6, graphic_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, storage);
            pstm.setDouble(9, screen_Size);
            pstm.setString(10, screen_Resolution);
            pstm.setInt(11, screen_Frequency);
            pstm.setString(12, operating_System);
            pstm.setDouble(13, price);
            pstm.setInt(14, quantity);
            pstm.setString(15, Laptop_Image1);
            pstm.setString(16, Laptop_Image2);
            pstm.setString(17, Laptop_Image3);
            pstm.setString(18, description);
            pstm.setInt(19, id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_M" + e.getMessage());
        }

    }

    public boolean UpdateLaptop_M_noImg() {
        try {
            String strSQL = "update Laptops set Brand_ID=?,Model=?,Category_ID=?,Processor_Type_ID=?,Processor_Type_Name=?,"
                    + " Graphics_Card=?,RAM=?,Storage=?,Screen_Size=?,Screen_Resolution=?,Screen_Frequency=?,Operating_System=?,"
                    + "Price=?,Stock_Quantity=?,"
                    + "Description=?,Status=0 Where Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, brand);
            pstm.setString(2, model);
            pstm.setString(3, category);
            pstm.setString(4, processor_Type);
            pstm.setString(5, processor_Name);
            pstm.setString(6, graphic_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, storage);
            pstm.setDouble(9, screen_Size);
            pstm.setString(10, screen_Resolution);
            pstm.setInt(11, screen_Frequency);
            pstm.setString(12, operating_System);
            pstm.setDouble(13, price);
            pstm.setInt(14, quantity);
            pstm.setString(15, description);
            pstm.setDouble(16, discount);
            pstm.setInt(17, id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_M_noImg" + e.getMessage());
        }

        return false;
    }

    /**
     * @return @purpose: Access and manipulate data in the Laptop table.
     * @date: Oct 3, 2023
     * @author: HieuNT
     */
    public boolean UpdateLaptop_A() {
        try {
            String strSQL = "update Laptops set Brand_ID=?,Model=?,Category_ID=?,Processor_Type_ID=?,Processor_Type_Name=?,"
                    + " Graphics_Card=?,RAM=?,Storage=?,Screen_Size=?,Screen_Resolution=?,Screen_Frequency=?,Operating_System=?,"
                    + "Price=?,Stock_Quantity=?,Laptop_Image1=?,Laptop_Image2=?,Laptop_Image3=?,"
                    + "Description=?,Status=1 Where Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, brand);
            pstm.setString(2, model);
            pstm.setString(3, category);
            pstm.setString(4, processor_Type);
            pstm.setString(5, processor_Name);
            pstm.setString(6, graphic_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, storage);
            pstm.setDouble(9, screen_Size);
            pstm.setString(10, screen_Resolution);
            pstm.setInt(11, screen_Frequency);
            pstm.setString(12, operating_System);
            pstm.setDouble(13, price);
            pstm.setInt(14, quantity);
            pstm.setString(15, Laptop_Image1);
            pstm.setString(16, Laptop_Image2);
            pstm.setString(17, Laptop_Image3);
            pstm.setString(18, description);
            pstm.setInt(19, id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_A" + e.getMessage());
        }
        return false;
    }

    /**
     * @return @purpose: For Admin to approve the change made by employee
     * @date: Oct 3, 2023
     * @author: HieuNT
     */
    public void admin_approval(int id) {
        try {
            String strSQL = "update laptops set Status=1 where Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("admin_approval" + e.getMessage());
        }
    }

//    public boolean UpdateLaptop() {
//        try {
//            String strSQL = "update Laptops set Brand_ID=?,Model=?,Category_ID=?,Processor_Type_ID=?,Processor_Type_Name=?,"
//                    + " Graphics_Card=?,RAM=?,Storage=?,Screen_Size=?,Screen_Resolution=?,Screen_Frequency=?,Operating_System=?,"
//                    + "Price=?,Stock_Quantity=?,Laptop_Image1=?,Laptop_Image2=?,Laptop_Image3=?,"
//                    + "Description=? Where Laptop_ID=?";
//            pstm = cnn.prepareStatement(strSQL);
//            pstm.setInt(1, brand_ID);
//            pstm.setString(2, model);
//            pstm.setInt(3, cate_ID);
//            pstm.setInt(4, processor_ID);
//            pstm.setString(5, processor_Name);
//            pstm.setString(6, graphic_Card);
//            pstm.setInt(7, RAM);
//            pstm.setString(8, storage);
//            pstm.setString(9, screen_Size);
//            pstm.setString(10, screen_Resolution);
//            pstm.setInt(11, screen_Frequency);
//            pstm.setString(12, operating_System);
//            pstm.setString(13, price);
//            pstm.setInt(14, quantity);
//            pstm.setString(15, Laptop_Image1);
//            pstm.setString(16, Laptop_Image2);
//            pstm.setString(17, Laptop_Image3);
//            pstm.setString(18, description);
//            pstm.setInt(19, id);
//            pstm.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            System.out.println("UpdateLaptop" + e.getMessage());
//        }
//        return false;
//    }
    /*
     * purpose: Method to retrieve a Laptop information when searching.
     * date: Sep 29, 2023
     * author: PhongLDM
     */
    public ArrayList<Laptop> searchByName(String searchParam) {
        ArrayList<Laptop> laptop_List = new ArrayList<>();

        String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and l.Category_ID = d.Category_ID "
                + "AND Model like ?";

        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, "%" + searchParam + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("searchByName:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: Method to filter a Laptop information when searching.
     * date: Sep 29, 2023
     * author: HieuNT
     */
    public ArrayList<Laptop> getFilter(String brand_id, String category_id, String processor, double lower, double upper) {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                + "                 Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                + "                 Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                + "                 FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                + "                 WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and l.Category_ID = d.Category_ID\n"
                + "                 and l.Brand_ID LIKE ? and l.Category_ID LIKE ? and l.Processor_Type_ID LIKE ? and Price - Price * d.Discount between ? and ? ORDER BY Laptop_ID ASC";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, "%" + brand_id + "%");
            pstm.setString(2, "%" + category_id + "%");
            pstm.setString(3, "%" + processor + "%");
            pstm.setDouble(4, lower);
            pstm.setDouble(5, upper);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getFilter:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: Method to sort a Laptop information when searching.
     * date: Sep 29, 2023
     * author: HieuNT
     */
    public ArrayList<Laptop> getSortandFilter(String brand_id, String category_id, String processor, double lower, double upper, String sort) {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                + "                 Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                + "                 Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                + "                 FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                + "                 WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and l.Category_ID = d.Category_ID\n"
                + "                 and l.Brand_ID LIKE ? and l.Category_ID LIKE ? and l.Processor_Type_ID LIKE ? and Price - Price * d.Discount between ? and ?\n"
                + "                 ORDER BY " + sort + " DESC";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, "%" + brand_id + "%");
            pstm.setString(2, "%" + category_id + "%");
            pstm.setString(3, "%" + processor + "%");
            pstm.setDouble(4, lower);
            pstm.setDouble(5, upper);
            //pstm.setString(6,sort);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getSortandFilter:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: Method to get total product.
     * date: Sep 29, 2023
     * author: HieuNT
     */
    public int getTotalProduct() {
        String strSQL = "SELECT COUNT(*) FROM LAPTOPS";
        int totalproduct = 0;
        try {
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            rs.next();

            totalproduct = rs.getInt(1);

        } catch (SQLException e) {
            System.out.println("getTotalProduct:" + e.getMessage());
        }
        return totalproduct;
    }

    /*
     * purpose: Method to get a list paging product.
     * date: Sep 29, 2023
     * author: HieuNT
     */
    public ArrayList<Laptop> getPageList(int index) {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        String strSQL = "select * from Laptops\n"
                + "Order by Laptop_ID\n"
                + "OFFSET ? rows\n"
                + "Fetch next 9 rows only";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, (index - 1) * 9);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getPageList:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: For Marketing to delete the product from product list page
     * date: Oct 3, 2023
     * author: HieuNT
     */
    public void delete_M(int laptop_Id) {
        try {
            String strSQL = "update laptops set Status=3 where Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, laptop_Id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("delete_M" + e.getMessage());
        }
    }

    /*
     * purpose: Define an ArrayList to store Unapprove Laptop objects.
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public ArrayList<Laptop> getDeletedList() {
        ArrayList<Laptop> laptop_List = new ArrayList<>();
        try {
            String strSQL = "SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,\n"
                    + "Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,\n"
                    + "Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description\n"
                    + "FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d\n"
                    + "WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and d.Category_ID = l.Category_ID and Status = 3";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop();
                laptop.setId(rs.getInt(1));
                laptop.setBrand(rs.getString(2));
                laptop.setModel(rs.getString(3));
                laptop.setCategory(rs.getString(4));
                laptop.setProcessor_Type(rs.getString(5));
                laptop.setProcessor_Name(rs.getString(6));
                laptop.setGraphic_Card(rs.getString(7));
                laptop.setRAM(rs.getInt(8));
                laptop.setStorage(rs.getString(9));
                laptop.setScreen_Size(rs.getDouble(10));
                laptop.setScreen_Resolution(rs.getString(11));
                laptop.setScreen_Frequency(rs.getInt(12));
                laptop.setOperating_System(rs.getString(13));
                laptop.setPrice(rs.getDouble(14));
                laptop.setDiscount(rs.getDouble(15));
                laptop.setQuantity(rs.getInt(16));
                laptop.setLaptop_Image1(rs.getString(17));
                laptop.setLaptop_Image2(rs.getString(18));
                laptop.setLaptop_Image3(rs.getString(19));
                laptop.setDescription(rs.getString(20));

                laptop_List.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println("getDeletedList:" + e.getMessage());
        }
        return laptop_List;
    }

    /*
     * purpose: A function for admin to permanent delete a product
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public void PermaDelete(int laptop_Id) {
        try {
            String strSQL = "DELETE FROM Laptops WHERE Laptop_ID=?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, laptop_Id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("PermaDelete" + e.getMessage());
        }
    }

    /*
     * purpose: A function for admin to restore a product from deleted list
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public boolean Restore(int laptop_Id) {
        try {
            String strSQL = "update laptops set Status=1 where Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, laptop_Id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Restore" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: A function for marketing to update a product 
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public boolean updateLaptop_M(String Model, int Brand_ID, int Category_ID, int Processor_Type_ID, String Processor_Type_Name,
            String Graphics_Card, int RAM, String Storage, double Screen_Size, String Screen_Resolution, int Screen_Frequency,
            String Operating_System, double Price, int Stock_Quantity, String Laptop_Image1, String Laptop_Image2, String Laptop_Image3,
            String Description, int Laptop_ID) {
        try {
            String strSQL = "update Laptops set Model = ?, Brand_ID = ?, Category_ID = ?, Processor_Type_ID = ?, Processor_Type_Name = ?, "
                    + "Graphics_Card = ?, RAM = ?, Storage = ?, Screen_Size = ?, Screen_Resolution = ?, Screen_Frequency = ?, Operating_System = ?,"
                    + "Price = ?, Stock_Quantity = ?, Laptop_Image1 = ?, Laptop_Image2 = ?, Laptop_Image3 = ?, "
                    + "Description = ?, Status = 0 Where Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Model);
            pstm.setInt(2, Brand_ID);
            pstm.setInt(3, Category_ID);
            pstm.setInt(4, Processor_Type_ID);
            pstm.setString(5, Processor_Type_Name);
            pstm.setString(6, Graphics_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, Storage);
            pstm.setDouble(9, Screen_Size);
            pstm.setString(10, Screen_Resolution);
            pstm.setInt(11, Screen_Frequency);
            pstm.setString(12, Operating_System);
            pstm.setDouble(13, Price);
            pstm.setInt(14, Stock_Quantity);
            pstm.setString(15, Laptop_Image1);
            pstm.setString(16, Laptop_Image2);
            pstm.setString(17, Laptop_Image3);
            pstm.setString(18, Description);
            pstm.setInt(19, Laptop_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_M" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: A function for marketing to update a product without image
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public boolean updateLaptop_M_noImg(String Model, int Brand_ID, int Category_ID, int Processor_Type_ID, String Processor_Type_Name,
            String Graphics_Card, int RAM, String Storage, double Screen_Size, String Screen_Resolution, int Screen_Frequency,
            String Operating_System, double Price, int Stock_Quantity,
            String Description, int Laptop_ID) {
        try {
            String strSQL = "update Laptops set Model = ?, Brand_ID = ?, Category_ID = ?, Processor_Type_ID = ?, Processor_Type_Name = ?, "
                    + "Graphics_Card = ?, RAM = ?, Storage = ?, Screen_Size = ?, Screen_Resolution = ?, Screen_Frequency = ?, Operating_System = ?,"
                    + "Price = ?, Stock_Quantity = ?,"
                    + "Description = ?, Status = 1 Where Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Model);
            pstm.setInt(2, Brand_ID);
            pstm.setInt(3, Category_ID);
            pstm.setInt(4, Processor_Type_ID);
            pstm.setString(5, Processor_Type_Name);
            pstm.setString(6, Graphics_Card);
            pstm.setInt(7, RAM);
            pstm.setString(8, Storage);
            pstm.setDouble(9, Screen_Size);
            pstm.setString(10, Screen_Resolution);
            pstm.setInt(11, Screen_Frequency);
            pstm.setString(12, Operating_System);
            pstm.setDouble(13, Price);
            pstm.setInt(14, Stock_Quantity);
            pstm.setString(15, Description);
            pstm.setInt(16, Laptop_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_M_noImg" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: A function for marketing to update a product 
     * date: Sep 25, 2023
     * author: HieuNT
     */
    public boolean updateLaptop_M_Img(String Laptop_Image1, String Laptop_Image2, String Laptop_Image3, int Laptop_ID) {
        try {
            String strSQL = "update Laptops set Laptop_Image1 = ?, Laptop_Image2 = ?, Laptop_Image3 = ?, "
                    + "Status = 0 Where Laptop_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Laptop_Image1);
            pstm.setString(2, Laptop_Image2);
            pstm.setString(3, Laptop_Image3);
            pstm.setInt(4, Laptop_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateLaptop_M_Img" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to get number of laptop base on category
     * date: Nov 12, 2023
     * author: PhiNx
     */
    public List<Integer> getCategoryCount() {
        List<Integer> category_Count = new ArrayList<>();
        try {
            String strSQL = "SELECT\n"
                    + " COUNT(l.Laptop_ID) * 100.0 / SUM(COUNT(l.Laptop_ID)) OVER () AS LaptopPercentage\n"
                    + "FROM Category c\n"
                    + "LEFT JOIN Laptops l ON c.Category_ID = l.Category_ID\n"
                    + "GROUP BY c.Category_ID, c.Category_Name;";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("LaptopPercentage");
                category_Count.add(count);
            }
        } catch (SQLException e) {
            System.out.println("getCategoryCount: " + e.getMessage());
        }
        return category_Count;
    }
}
