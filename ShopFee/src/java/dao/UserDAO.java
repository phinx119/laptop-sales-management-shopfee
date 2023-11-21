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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 * @purpose: Access and manipulate data in the User table.
 * @date: Sep 16, 2023
 * @author: HieuNT
 */
public class UserDAO extends DBContext {

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

    public UserDAO() {
        connect();
    }

    /*
     * purpose: Method to check if a username and password exist or not.
     * date: Sep 16, 2023
     * author: HieuNT
     */
    public boolean checkLogin(String username, String password) {
        try {
            String strSQL = "SELECT * FROM Users WHERE username = ? AND Password = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, username);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkLogin:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to retrieve a User object by Username and Password from the database.
     * date: Sep 16, 2023
     * author: HieuNT
     */
    public User getUserData(String username, String password) {
        User user_Data = new User();
        try {
            String strSQL = "select * from Users where Username = ? and Password = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, username);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                user_Data.setUser_Id(rs.getInt(1));
                user_Data.setUsername(rs.getString(2));
                user_Data.setPassword(rs.getString(3));
                user_Data.setEmail(rs.getString(4));
                user_Data.setName(rs.getString(5));
                user_Data.setPhone_Number(rs.getString(6));
                user_Data.setRole(rs.getInt(7));
                user_Data.setAvatar(rs.getString(8));
                user_Data.setStatus(rs.getInt(9));
                return user_Data;
            }
        } catch (SQLException e) {
            System.out.println("getUserData:" + e.getMessage());
        }
        return null;
    }

    /*
     * purpose: Method to retrieve a User object by ID from the database.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public User getUserDatabyID(int user_ID) {
        User user_Data = new User();
        try {
            String strSQL = "select * from Users where User_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_ID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                user_Data.setUser_Id(rs.getInt(1));
                user_Data.setUsername(rs.getString(2));
                user_Data.setPassword(rs.getString(3));
                user_Data.setEmail(rs.getString(4));
                user_Data.setName(rs.getString(5));
                user_Data.setPhone_Number(rs.getString(6));
                user_Data.setRole(rs.getInt(7));
                user_Data.setAvatar(rs.getString(8));
                user_Data.setStatus(rs.getInt(9));
                return user_Data;
            }
        } catch (SQLException e) {
            System.out.println("getUserDatabyID:" + e.getMessage());
        }
        return null;
    }

    /*
     * purpose: Method to check if a Username exist or not.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean checkUsername(String username) {
        try {
            String strSQL = "select * from Users where Username = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, username);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkUsername:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to check if a Email exist or not.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean checkEmail(String email) {
        try {
            String strSQL = "select * from Users where Email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkEmail" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to add a new User data to the database.
     * date: Sep 18, 2023
     * author: PhongLDM
     */
    public boolean addUser(User user) {
        try {
            String strSQL = "INSERT INTO Users(Username, Password, Email, Name, Phone_Number, Role_ID, Avatar_Image)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getUsername());
            pstm.setString(2, user.getPassword());
            pstm.setString(3, user.getEmail());
            pstm.setString(4, user.getName());
            pstm.setString(5, user.getPhone_Number());
            pstm.setInt(6, user.getRole());
            pstm.setString(7, user.getAvatar());
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addUser:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Name in the database.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean updateName(String name, int user_ID) {
        try {
            String strSQL = "UPDATE Users SET Name = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, name);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateName:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Email in the database.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean updateEmail(String email, int user_ID) {
        try {
            String strSQL = "UPDATE Users SET Email = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateEmail:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Phone number in the database.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean updatePhoneNumber(String phone_Number, int user_ID) {
        try {
            String strSQL = "UPDATE Users SET Phone_Number = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, phone_Number);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updatePhoneNumber:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Password in the database by ID.
     * date: Sep 21, 2023
     * author: PhiNX
     */
    public boolean changePassword(String password, int user_ID) {
        try {
            String strSQL = "UPDATE Users SET Password = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, password);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("changePassword:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Password in the database by Email.
     * date: Sep 19, 2023
     * author: HuyLD
     */
    public boolean resetPassword(String password, String email) {
        try {
            String strSQL = "UPDATE Users SET Password = ? WHERE Email = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, password);
            pstm.setString(2, email);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("resetPassword:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to delete User record in database by ID.
     * date: Sep 22, 2023
     * author: PhiNX
     */
    public boolean deleteUser(int user_id) {
        try {
            String strSQL = "DELETE FROM Users WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("deleteUser:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to update User Image in the database by ID.
     * date: Sep 21, 2023
     * author: HuyLD
     */
    public boolean uploadAvatar(String Avatar_Image, int user_ID) {
        try {
            String strSQL = "UPDATE Users SET Avatar_Image = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, Avatar_Image);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("uploadAvatar:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Method to save file image after choosing avatar.
     * date: Sep 21, 2023
     * author: HuyLD
     */
    public boolean saveFile(InputStream is, String path) {
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            try ( FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(b);
                fos.flush();
            }
            return true;
        } catch (IOException e) {
            System.out.println("saveFile:" + e.getMessage());
        }
        return false;
    }

    /*
     * purpose: Define an ArrayList to store User objects.
     * date: Sep 26, 2023
     * author: PhongLDM
     */
    public ArrayList<User> getUserList() {
        ArrayList<User> user_List = new ArrayList<>();
        try {
            String strSQL = "select User_ID, Username, Email, Name, Phone_Number, Role_ID, status from Users";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int user_Id = rs.getInt(1);
                String username = rs.getString(2);
                String email = rs.getString(3);
                String name = rs.getString(4);
                String phone_Number = rs.getString(5);
                int role = rs.getInt(6);
                int status = rs.getInt(7);
                user_List.add(new User(user_Id, username, email, name, phone_Number, role, status));
            }
        } catch (SQLException e) {
            System.out.println("getUserList:" + e.getMessage());
        }
        return user_List;
    }
    
    public boolean isValidEmail(String email) {
        if (email == null || email.length() < 5) {
            return false;
        }

        Pattern pattern = Pattern.compile("^(.+)@(.+)$");
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();

    }
    
     /*
     * purpose: Edit user role.
     * date: Oct 29, 2023
     * author: PhongLDM
     */
    public boolean editRole(int role, int user_ID){
        try {
            String strSQL = "UPDATE Users SET Role_ID = ? WHERE User_ID = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, role);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("editRole:" + e.getMessage());
        }
        return false;
    }
    
    /*
     * purpose:update account status.
     * date: Oct 29, 2023
     * author: PhongLDM
     */
    public void updateAccountStatus(int user_ID) {
        try {
            String strSQL = "UPDATE Users SET status = (CASE WHEN status = 1 THEN 0 ELSE 1 END) WHERE User_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_ID);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateAccountStatus:" + e.getMessage());
        }
    }

    /*
     * purpose:update account status.
     * date: Oct 31, 2023
     * author: PhongLDM
     */
    public ArrayList<User> getUserByRole(int roleId) {
        ArrayList<User> user_List = new ArrayList<>();
        try {
            String strSQL = "SELECT User_ID, Username, Email, Name, Phone_Number, Role_ID, status FROM Users WHERE Role_ID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, roleId);  // Set the value for the first parameter
            rs = pstm.executeQuery();
            while (rs.next()) {
                int user_Id = rs.getInt(1);
                String username = rs.getString(2);
                String email = rs.getString(3);
                String name = rs.getString(4);
                String phone_Number = rs.getString(5);
                int role = Integer.parseInt(rs.getString("Role_ID"));
                int status = rs.getInt(7);
                user_List.add(new User(user_Id, username, email, name, phone_Number, role, status));
            }
        } catch (SQLException e) {
            System.out.println("getUserByRole:" + e.getMessage());
        }
        return user_List;
    }
}
