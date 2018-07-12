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
import models.Enjoy;
import models.Talent;

/**
 *
 * @author meseret
 */
public class Enjoys {
    
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Enjoy> data;
    public Enjoys(Connection con) {
        this.connection=con;
    }
    
    public void index(){
        
    }
    
    public int  create(Enjoy enjoy,HttpServletResponse response) throws IOException{
        String query="insert into enjoys(id,children_id,enjoys) values(?,?,?)";
        try {
            ps= connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, enjoy.getChildren_id());
            ps.setString(3, enjoy.getEnjoys());
            int result=ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Enjoys.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }
    
    public ArrayList<Enjoy> show(String childId){
        data  =new ArrayList<>();
        String query="select * from enjoys where children_id="+childId;
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                Enjoy enjoy=new Enjoy();
              enjoy.setId(rs.getInt("id"));
              enjoy.setEnjoys(rs.getString("enjoys"));
              data.add(enjoy);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Enjoys.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    
}
