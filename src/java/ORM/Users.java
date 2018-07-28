/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import com.sun.xml.ws.security.impl.policy.Constants;
import helpers.HashingPassword;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.User;
import sun.security.provider.MD5;

/**
 *
 * @author meseret
 */
public class Users {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<User> data;

    public Users(Connection con) {
        this.connection = con;
    }

    public ArrayList<User> index() throws IOException {
        String query = "select * from users u join roles r on u.role_id=r.id;";
       data= new ArrayList<>();
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone_no"));
                user.setProfile(rs.getString("profile"));
                user.setUserName(rs.getString("user_name"));
                user.setTemp_pass(rs.getString("temp_pass"));
                user.setRole_id(rs.getInt("role_id"));
                user.setRole_name(rs.getString("name"));
                user.setResponsibility(rs.getString("resp"));
                data.add(user);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public int create(User user,HttpServletResponse response) throws  SQLException, IOException {
        String query = "insert into users(id,full_name,gender,phone_no,email,user_name,password,temp_pass,role_id,profile) values(?,?,?,?,?,?,?,?,?,?);";
        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        Timestamp time = new Timestamp(now.getTime());
        String hashedPassword = HashingPassword.instance().getHashedPassword(user.getPassword());

        try {
            ps = connection.prepareStatement(query);
            ps = connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, user.getFullName());
            ps.setString(3, user.getGender());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getUserName());
            ps.setString(7, hashedPassword);
            ps.setString(8, user.getTemp_pass());
            ps.setInt(9, user.getRole_id());
            ps.setString(10, user.getProfile());
            int result = ps.executeUpdate();
            return result;

        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        } 

    }

    
    public void show(String email){
        
    }
    
    public void update(String email,User model){
        
    }
    
    public void delete(String email){
        
    }
    
    public ArrayList<User> department(){
        String query="select * from users where role_id=2";
        ArrayList<User> users=new ArrayList<>();
        try {
            ps= connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                users.add(user);
            }
            return users;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
