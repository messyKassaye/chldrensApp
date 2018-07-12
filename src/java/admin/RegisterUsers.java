/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import ORM.Users;
import helpers.FilePaths;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author meseret
 */
@WebServlet(name = "RegisterUsers", urlPatterns = {"/RegisterUsers"})
public class RegisterUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session=request.getSession();
        Users users = new Users(connection);
        
        String fullName = request.getParameter("fullName");
        String phoneNo = request.getParameter("phoneNo");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        User user = new User();
        user.setFullName(fullName);
        user.setPhone(phoneNo);
        user.setEmail(email);
        user.setGender(gender);
        user.setUserName(userName);
        user.setPassword(password);
        user.setTemp_pass(password);
        user.setRole_id(Integer.parseInt(role));
        user.setProfile(FilePaths.IMAGE_URL+"default_avator.png");
        try {
            int result=users.create(user,response);
            if(result>0){
                session.setAttribute("userAdded", "User added successfully");
                response.sendRedirect("AddUsers");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
