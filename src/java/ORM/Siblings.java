/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import helpers.AgeCalculator;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.Sibling;

/**
 *
 * @author meseret
 */
public class Siblings {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Sibling> data;

    public Siblings(Connection con) {
        this.connection=con;
    }
    
    public void index(){
        
    }
    
    public int  create(int child_id,String firstName,String lastName,String gender,String birthDate,HttpServletResponse response) throws IOException{
        String query="insert into siblings(id,child_id,first_name,last_name,gender,birth_date) values(?,?,?,?,?,?)";
        try {
            ps=connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, child_id);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, gender);
            ps.setString(6, birthDate);
            int result=ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Siblings.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
        
    }
    
    public ArrayList<Sibling> show(String childrenId,HttpServletResponse response) throws IOException{
        data = new ArrayList<>();
        String query="select * from siblings where child_id="+childrenId;
        try {
            ps= connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                Sibling sibling=new Sibling();
                sibling.setChildrenId(rs.getInt("child_id"));
                sibling.setFirstName(rs.getString("first_name"));
                sibling.setLastName(rs.getString("last_name"));
                sibling.setGender(rs.getString("gender"));
                sibling.setBirthDate(AgeCalculator.getAge(rs.getDate("birth_date")));
                data.add(sibling);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Siblings.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return null;
        }
    }
    
    
    
}
