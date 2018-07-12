package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class QueryBuilder {
    private Connection connection;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    public QueryBuilder(Connection connection) {
        this.connection = connection;
    }


    public void insert(){

    }

    public String selects(String query) throws SQLException{
       ps= connection.prepareStatement(query);
       rs = ps.executeQuery();
       ResultSetMetaData meta= rs.getMetaData();
       int columnNumbers= meta.getColumnCount();
       while(rs.next()){
           for(int i=0;i<columnNumbers;i++){
               rs.getString(i);
           }
       }
       
       return ""+columnNumbers;
    }

    public void update(){

    }

    public void delete(){

    }
}
