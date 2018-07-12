/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.Childrens;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Children;

/**
 *
 * @author meseret
 */
public class SponsorsServlet extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id=(String)request.getParameter("id");
        
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session= request.getSession(true);
         
        //finding featured child
        Childrens childrenORM=new Childrens(connection);
        Children child=childrenORM.show(id);
        
        session.setAttribute("child", child);
        response.sendRedirect("sponsors.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
