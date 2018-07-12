/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.Talents;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Talent;

/**
 *
 * @author meseret
 */
@WebServlet(name = "TalentServlet", urlPatterns = {"/TalentServlet"})
public class TalentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        Talents talents = new Talents(connection);
        String id = (String) request.getParameter("id");
        String talentName = (String) request.getParameter("talent");
        Talent talent = new Talent(0, id, talentName);
        int result = talents.create(talent, response);
        if (result == 1) {
            response.sendRedirect("details?id=" + id);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
