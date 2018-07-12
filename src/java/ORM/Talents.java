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
import models.Talent;

/**
 *
 * @author meseret
 */
public class Talents {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<Talent> data;
    public Talents(Connection con) {
        this.connection=con;
    }
    
    public void index(){
        
    }
    
    public int create(Talent talent,HttpServletResponse response) throws IOException{
        String query="insert into talents(id,children_id,talents) values(?,?,?)";
        try {
            ps= connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, Integer.parseInt(talent.getChild_id()));
            ps.setString(3, talent.getTalent());
            int result= ps.executeUpdate();
           return result;
        } catch (SQLException ex) {
            Logger.getLogger(Talents.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }
    
    public ArrayList<Talent> show(String childId){
        data= new ArrayList<>();
        String query="select * from talents where children_id="+childId;
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                Talent talent=new Talent();
                talent.setTalent(rs.getString("talents"));
                data.add(talent);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Talents.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
    }
    
    
}
