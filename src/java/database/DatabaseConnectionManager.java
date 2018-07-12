package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnectionManager {

    private Connection connection=null;

    private String dbUrl;
    private String userName;
    private String password;

    public DatabaseConnectionManager(String dbUrl, String userName, String password) {
        this.dbUrl = dbUrl;
        this.userName = userName;
        this.password = password;
         try{
             Class.forName("com.mysql.jdbc.Driver");
             connection= DriverManager.getConnection(dbUrl,userName,password);
         }catch (Exception e){
             e.printStackTrace();
         }
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
