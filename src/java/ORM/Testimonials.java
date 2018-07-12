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
import models.Testimony;

/**
 *
 * @author meseret
 */
public class Testimonials {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Testimony> data;
    public Testimonials(Connection con) {
        this.connection=con;
    }
    
    public ArrayList<Testimony> index(HttpServletResponse response) throws IOException{
        data=new ArrayList<>();
        String query="select * from testimonies";
        
        try {
            ps= connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Testimony testimony=new Testimony();
                testimony.setName(rs.getString("name"));
                testimony.setTestimony(rs.getString("testimony"));
                testimony.setPicture(rs.getString("profile"));
                data.add(testimony);
            }
            response.getWriter().print(data.get(0).getTestimony());
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Testimonials.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return null;
        }
        
    }
    
    public void create(){
        
    }
    
    public void show(){
        
    }
    
    
    
}
