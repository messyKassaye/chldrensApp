/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.Children;

/**
 *
 * @author meseret
 */
public class Searchs {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<Children> childrenData;

    public Searchs(Connection con) {
        this.connection = con;
    }

    public ArrayList<Children> searchChildren(String type, String value, String req, HttpServletResponse response) throws IOException {
        childrenData = new ArrayList<>();
        String query = "";
        switch (type) {
            case "Age":
                if (value.contains("-")) {
                    String firstValue = value.substring(0, value.indexOf("-"));
                    String secondValue = value.substring(value.indexOf("-") + 1, value.length());
                    if (req.equals("female")) {
                        query = "select * from childrens where gender='female' and birth_date between " + firstValue + " and " + secondValue;
                    } else if (req.equals("male")) {
                        query = "select * from childrens where gender='male' and birth_date between " + firstValue + " and " + secondValue;
                    } else if (req.equals("family")) {
                        query = "select * from childrens where live_with='family' and birth_date between " + firstValue + " and " + secondValue;
                    }
                } else {
                    if (req.equals("female")) {
                        query = "select * from childrens where gender='female' and birth_date=" + value;
                    } else if (req.equals("male")) {
                        query = "select * from childrens where gender='male' and birth_date=" + value;
                    } else if (req.equals("family")) {
                        query = "select * from childrens where live_with='family' and birth_date=" + value;
                    }

                }
                break;
            case "Registration date":
                if (value.contains("-")) {
                    String firstValue = value.substring(0, value.indexOf("-"));
                    String secondValue = value.substring(value.indexOf("-") + 1, value.length());
                    if (req.equals("female")) {
                        query = "select * from childrens where gender='female' and registration_date like '%" + firstValue + "%' OR registration_date like '%" + secondValue+"%'";
                    } else if (req.equals("male")) {
                        query = "select * from childrens where gender='male' and (registration_date between " + firstValue + " and " + secondValue + ")";
                    }
                } else {
                   if(req.equals("female")){
                       //response.getWriter().print(req);
                       query = "select * from childrens where gender='female' and registration_date like '%" + value + "%'";
                   }else if(req.equals("male")){
                       query = "select * from childrens where gender='female' and registration_date like '%" + value + "%'";
                   }
                }
                break;
        }

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Children child = new Children();
                child.setId(rs.getInt("id"));
                child.setFirstName(rs.getString("first_name"));
                child.setLastName(rs.getString("last_name"));
                child.setGender(rs.getString("gender"));
                child.setAge(rs.getString("birth_date"));
                child.setLivesWith(rs.getString("live_with"));
                childrenData.add(child);

            }
            return childrenData;
        } catch (SQLException ex) {
            Logger.getLogger(Searchs.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return null;
        }
    }

    public String replacYearFormat(String year) {
        String date = year.substring(0, year.indexOf("/"));
        String month = year.substring(year.indexOf("/") + 1, year.lastIndexOf("/"));
        String years = year.substring(year.lastIndexOf("/") + 1, year.length());

        String result = years + "-" + month + "-" + date;
        return result;
    }

}
