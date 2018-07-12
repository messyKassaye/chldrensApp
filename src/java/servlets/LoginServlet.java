package servlets;

import ORM.Childrens;
import ORM.Login;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;
import models.Children;
import models.User;

@WebServlet(name = "servlets.LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session = request.getSession(true);

        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        Login login = new Login(connection);
        ArrayList<User> user = login.login(userName, password, response);
        if (user.size() > 0) {
            session.setAttribute("auth", user);
            int role_id = user.get(0).getRole_id();
            if (role_id == 1) {
                response.sendRedirect("adminProfile.jsp");
            } else if (role_id == 2) {
                response.sendRedirect("/profile/dataCollector/collcetorProfile.jsp");
            }
        } else {
            session.setAttribute("unknownUser", "Sorry, may be you are using incorrect user name or password");
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
