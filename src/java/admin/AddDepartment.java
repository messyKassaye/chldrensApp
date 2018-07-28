/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import ORM.Departments;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Department;

/**
 *
 * @author meseret
 */
@WebServlet(name = "AddDepartment", urlPatterns = {"/AddDepartment"})
public class AddDepartment extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session=request.getSession(true);
        Departments departments=new Departments(connection);
        String name= request.getParameter("name");
        String desc=request.getParameter("desc");
        Department dep=new Department();
        dep.setName(name);
        dep.setDesc(desc);
        int result= departments.create(dep,response);
        if(result>=1){
            session.setAttribute("department", "Registered Successfully");
            response.sendRedirect("AddDepartments");
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
