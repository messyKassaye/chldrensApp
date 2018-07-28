/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import models.SponsorInNeed;
import ORM.SponsorInNeeds;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author meseret
 */
public class SponsorAchild extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session= request.getSession(true);
        
        String country= request.getParameter("country");
        String age= request.getParameter("age");
        String gender= request.getParameter("gender");
        
        SponsorInNeed inNeed=new SponsorInNeed();
        inNeed.setCountry(country);
        inNeed.setAge(Integer.parseInt(age));
        inNeed.setGender(gender);
        
        SponsorInNeeds needORM =new SponsorInNeeds(connection);
        ArrayList<SponsorInNeed> data= needORM.show(inNeed,response);
         
         session.setAttribute("sponsorInNeed", data);
        response.sendRedirect("sponsor-a-child.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  

}
