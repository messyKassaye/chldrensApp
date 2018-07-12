/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.ChildrenAddress;

/**
 *
 * @author meseret
 */
public class ChildrenAddresses {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ChildrenAddresses(Connection con) {
        this.connection = con;
    }

    public void index() {

    }

    public int create(ChildrenAddress address,HttpServletResponse response) throws IOException {
        String query="insert into children_addresses(id,children_id,country,city) values(?,?,?,?)";
        try {
            ps= connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, address.getChldren_id());
            ps.setString(3, address.getCountry());
            ps.setString(4, address.getCity());
            int result=ps.executeUpdate();
            response.getWriter().print("success");
            return result;
            
        } catch (SQLException ex) {
            Logger.getLogger(ChildrenAddresses.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }

    public ArrayList<ChildrenAddress> show(String childId) throws IOException {
          ArrayList<ChildrenAddress> data=new ArrayList<>();
        String query = "select * from children_addresses where children_id=" + childId;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ChildrenAddress address = new ChildrenAddress();
                address.setId(rs.getInt("id"));
                address.setCountry(rs.getString("country"));
                address.setCity(rs.getString("city"));
               data.add(address);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(ChildrenAddresses.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
