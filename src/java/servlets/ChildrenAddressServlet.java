/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.ChildrenAddresses;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ChildrenAddress;

/**
 *
 * @author meseret
 */
@WebServlet(name = "ChildrenAddress", urlPatterns = {"/ChildrenAddress"})
public class ChildrenAddressServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        ChildrenAddresses addressData=new ChildrenAddresses(connection);
        String country = (String) request.getParameter("country");
        String city = (String) request.getParameter("city");
        String id = (String) request.getParameter("id");
        ChildrenAddress address = new ChildrenAddress(0,Integer.parseInt(id), country, city);
        int result=addressData.create(address,response);
        if(result>0){
            response.sendRedirect("details?id="+id);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
