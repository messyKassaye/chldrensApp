/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import ORM.Families;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Family;

/**
 *
 * @author meseret
 */
@WebServlet(name = "RegistorFamily", urlPatterns = {"/RegistorFamily"})
public class RegistorFamily extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        Families families=new Families(connection);
        String id=request.getParameter("id");
        String firstName= request.getParameter("firstName");
        String lastName=request.getParameter("lastName");
        String relation=request.getParameter("relation");
        
        Family family=new Family();
        family.setChild_id(Integer.parseInt(id));
        family.setFirst_name(firstName);
        family.setLast_name(lastName);
        family.setRelation(relation);
        
        int result = families.create(family,response);
        if(result==1){
            response.sendRedirect("details?id=" + id);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
