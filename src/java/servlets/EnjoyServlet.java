/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.Enjoys;
import ORM.Talents;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Enjoy;

/**
 *
 * @author meseret
 */
@WebServlet(name = "EnjoyServlet", urlPatterns = {"/EnjoyServlet"})
public class EnjoyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        Enjoys enjoys = new Enjoys(connection);
        int id = Integer.parseInt((String) request.getParameter("id"));
        String name = (String) request.getParameter("enjoy");
        Enjoy enjoy = new Enjoy(0, id, name);
        int result = enjoys.create(enjoy, response);
        if (result == 1) {
            response.sendRedirect("details?id=" + id);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
