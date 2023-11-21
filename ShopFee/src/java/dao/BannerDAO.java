/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import model.Banner;

/**
 *
 * @author ASUS
 */
public class BannerDAO extends DBContext {

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

    public BannerDAO() {
        connect();
    }

    public ArrayList<Banner> getBannerList() {
        ArrayList<Banner> Banner_List = new ArrayList<>();
        try {
            String strSQL = "select * from Banner";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Banner banner = new Banner();
                banner.setBanner_Id(rs.getInt(1));
                banner.setBanner_Name(rs.getString(2));
                banner.setBanner_Image(rs.getString(3));
                banner.setBanner_Link(rs.getString(4));
                Banner_List.add(banner);
            }
        } catch (SQLException e) {
            System.out.println("getBannerList:" + e.getMessage());
        }
        return Banner_List;
    }

    public Banner getBanerbyID(String Banner_Id) {
        Banner banner_Data = new Banner();
        try {
            String strSQL = "select * from Banner where Banner_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Banner_Id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                banner_Data.setBanner_Id(rs.getInt(1));
                banner_Data.setBanner_Name(rs.getString(2));
                banner_Data.setBanner_Image(rs.getString(3));
                banner_Data.setBanner_Link(rs.getString(4));
                return banner_Data;
            }
        } catch (SQLException e) {
            System.out.println("getBanerbyID:" + e.getMessage());
        }
        return null;
    }

    public String getBannerImageById(int Banner_Id) {
        String banner_Image = null; // Initialize to null

        try {
            String strSQL = "SELECT Banner_Image FROM Banner WHERE Banner_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, Banner_Id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                // Retrieve the Banner_Image value from the result set
                banner_Image = rs.getString("Banner_Image");
            }
        } catch (SQLException e) {
            System.out.println("getBannerImageById:" + e.getMessage());
        }

        return banner_Image; // Return the retrieved Banner_Image or null if not found
    }

    public boolean UpdateBanner(String Banner_Name, String Banner_Image, String Banner_Link, int Banner_Id) {
        try {
            String strSQL = "UPDATE Banner SET Banner_Name = ?, Banner_Image = ?, Banner_Link = ? WHERE Banner_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Banner_Name);
            pstm.setString(2, Banner_Image);
            pstm.setString(3, Banner_Link);
            pstm.setInt(4, Banner_Id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateBanner:" + e.getMessage());
        }
        return false;
    }

    public boolean saveFile(InputStream is, String path) {
        try ( FileOutputStream fos = new FileOutputStream(path)) {
            byte[] buffer = new byte[4096]; // Use a buffer to read/write in chunks
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            return true;
        } catch (IOException e) {
            System.err.println("saveFile: " + e.getMessage());
        } finally {
            try {
                is.close(); // Close the InputStream, whether an error occurred or not
            } catch (IOException e) {
                System.err.println("Error closing InputStream: " + e.getMessage());
            }
        }
        return false;
    }

    public void deleteBannerByID(String Banner_Id) {
        try {
            String strSQL = "delete from Banner where Banner_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Banner_Id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.out.println("deleteBannerByID :" + e.getMessage());
        }
    }

    public boolean UpdateBannerNameLink(String banner_Name, String banner_Link, int banner_Id) {
        try {
            String strSQL = "UPDATE Banner SET Banner_Name = ?, Banner_Link = ? WHERE Banner_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, banner_Name);
            pstm.setString(2, banner_Link);
            pstm.setInt(3, banner_Id);
            System.out.println("name: " + banner_Name);
            System.out.println("link: " + banner_Link);
            System.out.println("id: " + banner_Id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateBannerNameNLink:" + e.getMessage());
        }
        return false;
    }

    public boolean AddBanner(Banner banner) {
        try {
            String strSQL = "INSERT INTO Banner(Banner_Name, Banner_Image, Banner_Link)\n"
                    + "VALUES (?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, banner.getBanner_Name());
            pstm.setString(2, banner.getBanner_Image());
            pstm.setString(3, banner.getBanner_Link());
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("AddBanner:" + e.getMessage());
        }
        return false;
    }
}
