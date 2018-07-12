package listener;

import database.DatabaseConnectionManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext context= servletContextEvent.getServletContext();

        String dbURl= context.getInitParameter("dbUrl");
        String dbUser= context.getInitParameter("dbUser");
        String dbPassword= context.getInitParameter("dbPassword");
        try{
            DatabaseConnectionManager connectionManager=new DatabaseConnectionManager(dbURl,dbUser,dbPassword);
            context.setAttribute("DbConnection",connectionManager.getConnection());
        }catch (Exception e){

        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        Connection connection= (Connection)servletContextEvent.getServletContext().getAttribute("DbConnection");
        try{
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
