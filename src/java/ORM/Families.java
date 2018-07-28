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
import models.Family;

/**
 *
 * @author meseret
 */
public class Families {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Family> data;
    public Families(Connection conn) {
        this.connection=conn;
    }
    
    public ArrayList<Family> index() throws IOException{
        data=new ArrayList<>();
        String query="select * from families";
        
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Family family=new Family();
                family.setChild_id(rs.getInt("child_id"));
                family.setFirst_name(rs.getString("first_name"));
                family.setLast_name(rs.getString("last_name"));
                family.setRelation(rs.getString("relation_type"));
                data.add(family);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Families.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int create(Family family,HttpServletResponse response) throws IOException{
        String query="insert into families(id,child_id,first_name,last_name,relation_type) values(?,?,?,?,?)";
        try {
            ps=connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, family.getChild_id());
            ps.setString(3, family.getFirst_name());
            ps.setString(4, family.getLast_name());
            ps.setString(5, family.getRelation());
            int result=ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Families.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
}
