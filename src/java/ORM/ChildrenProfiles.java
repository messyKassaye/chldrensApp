/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.ChildrenProfile;

/**
 *
 * @author meseret
 */
public class ChildrenProfiles {
    private Connection connections=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;

    public ChildrenProfiles(Connection con) {
        this.connections=con;
    }
    
    public int create(ChildrenProfile cover){
        String query="insert into children_profiles(id,foreign_id,path) values(?,?,?)";
        try {
            ps= connections.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, cover.getForeign_id());
            ps.setString(3, cover.getPath());
            int result= ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(ChildrenProfiles.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
    
}
