/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.Cover;

/**
 *
 * @author meseret
 */
public class Covers {
    
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;

    public Covers(Connection con) {
        this.connection=con;
    }
    
    
    public void create(Cover cover,HttpServletResponse response) throws IOException{
        String query="insert into covers(id,foreign_id,path) values(?,?,?)";
        try {
            ps=connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, cover.getForeign_id());
            ps.setString(3, cover.getPath());
            int result=ps.executeUpdate();
            response.getWriter().print(result);
        } catch (SQLException ex) {
            Logger.getLogger(Covers.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
        }
        
    }
    
}
