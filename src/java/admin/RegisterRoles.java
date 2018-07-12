/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import ORM.Roles;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Role;

/**
 *
 * @author meseret
 */
@WebServlet(name = "RegisterRoles", urlPatterns = {"/RegisterRoles"})
public class RegisterRoles extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session=request.getSession();
        Roles roles=new Roles(connection);
        String roleName= request.getParameter("roleName");
        String resp= request.getParameter("resp");
        Role role=new Role(roleName, resp);
        int result = roles.create(role);
        if(result>0){
            session.setAttribute("roleAdded", "Role is Added Successfully");
            response.sendRedirect("AddRoles");
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
