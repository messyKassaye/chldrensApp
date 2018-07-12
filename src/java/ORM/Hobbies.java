/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.Enjoy;
import models.Hobby;

/**
 *
 * @author meseret
 */
public class Hobbies {
    
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Hobby> data;

    public Hobbies(Connection con) {
        this.connection=con;
    }
    
    public void index(){
        String query="select * from hobbies";
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                Hobby hobby=new Hobby();
                hobby.setName(query);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Hobbies.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int create(Hobby hobby,HttpServletResponse response) throws IOException{
        String query="insert into hobbies(id,child_id,name) values(?,?,?)";
        try {
            ps=connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2,hobby.getChild_id());
            ps.setString(3, hobby.getName());
            int result=ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Hobbies.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }
    
    public ArrayList<Hobby> show(String id){
        ArrayList<Hobby> data=new ArrayList<>();
        String query="select * from hobbies where child_id="+id;
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                Hobby hobby=new Hobby();
                hobby.setName(rs.getString("name"));
                data.add(hobby);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Hobbies.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
}
