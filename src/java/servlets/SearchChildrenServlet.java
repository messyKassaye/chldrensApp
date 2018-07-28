/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.Searchs;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Children;

/**
 *
 * @author meseret
 */
@WebServlet(name = "SearchChildrenServlet", urlPatterns = {"/SearchChildrenServlet"})
public class SearchChildrenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        Searchs searchs = new Searchs(connection);
        String type = (String) request.getParameter("type");
        String value = (String) request.getParameter("value");
        String req=(String)request.getParameter("req");
        ArrayList<Children> children = searchs.searchChildren(type, value,req,response);
        Gson gson = new Gson();
        String data = gson.toJson(children);
        response.getWriter().write(data);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
