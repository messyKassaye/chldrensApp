/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import helpers.HashingPassword;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author meseret
 */
public class Login {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<User> data = null;

    public Login(Connection con) {
        this.connection = con;
    }

    public ArrayList<User> login(String email, String password, HttpServletResponse respose) throws IOException {
        data = new ArrayList<>();
        String hashedPassword = HashingPassword.instance().getHashedPassword(password);
        String query = "select * from users where email = '" + email + "' and password = '" + hashedPassword + "'";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone_no"));
                user.setProfile(rs.getString("profile"));
                user.setUserName(rs.getString("user_name"));
                user.setTemp_pass(rs.getString("temp_pass"));
                user.setRole_id(rs.getInt("role_id"));
                data.add(user);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

}
