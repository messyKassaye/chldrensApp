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
import models.ChildrenHouse;

/**
 *
 * @author meseret
 */
public class ChildrenHouses {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    private ArrayList<ChildrenHouse> data;

    public ChildrenHouses(Connection con) {
        this.connection=con;
    }
    
    public void index(){
        
    }
    
    public void create(){
        
    }
    
    public ArrayList<ChildrenHouse> show(String childrenId){
        data = new ArrayList<>();
        String query="select * from childrens_houses where children_id="+childrenId;
        
        try {
            ps= connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                ChildrenHouse house=new ChildrenHouse();
                house.setKey(rs.getString("key"));
                house.setValue(rs.getString("value"));
                data.add(house);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(ChildrenHouses.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    
}
