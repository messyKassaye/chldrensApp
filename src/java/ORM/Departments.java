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
import models.Department;

/**
 *
 * @author meseret
 */
public class Departments {
    private Connection connection=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    ArrayList<Department> data=null;
    public Departments(Connection conn) {
        this.connection=conn;
    }
    
    public ArrayList<Department> index() throws IOException{
        data=new ArrayList<>();
        String query="select d.name,d.description,d.id,u.id as user_id,u.full_name from departments d left join users u on d.id=u.department_id";
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Department dep=new Department();
                dep.setId(rs.getInt("id"));
                dep.setName(rs.getString("name"));
                dep.setDesc(rs.getString("description"));
                dep.setHeadName(rs.getString("full_name"));
                dep.setHead_id(rs.getInt("user_id"));
                data.add(dep);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Departments.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
    }
    
    public int create(Department department,HttpServletResponse response) throws IOException{
        String query="insert into departments(id,name,description) values(?,?,?)";
        try {
            ps=connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, department.getName());
            ps.setString(3, department.getDesc());
            int result=ps.executeUpdate();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(Departments.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }
    
  
    
    public void show(int id){
        
    }
    
    public void update(int id,Department department){
        
    }
    
    public void destroy(int id){
        
    }
    
    
}
