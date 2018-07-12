/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Role;

/**
 *
 * @author meseret
 */
public class Roles {

    private Connection connection;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public Roles(Connection connection) {
        this.connection = connection;
    }

    public ArrayList<Role> index() {
        ArrayList<Role> data = new ArrayList<>();
        String query = "select * from roles";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setName(rs.getString("name"));
                role.setResponsibility(rs.getString("resp"));
                data.add(role);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Roles.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int create(Role role) {

        String query = "insert into roles(id,name,resp) values(?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, role.getName());
            ps.setString(3, role.getResponsibility());
            int result = ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Roles.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }

    }

}
