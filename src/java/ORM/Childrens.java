/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import helpers.AgeCalculator;
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
public class Childrens {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<Children> data;

    public Childrens(Connection conn) {
        this.connection = conn;
    }

    public ArrayList<Children> index() throws IOException {
        data = new ArrayList<>();
        String query = "select * from childrens c join children_profiles p on c.id=p.foreign_id where active=0";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Children children = new Children();
                children.setId(rs.getInt(1));
                children.setFirstName(rs.getString("first_name"));
                children.setLastName(rs.getString("last_name"));
                children.setGender(rs.getString("gender"));
                children.setLivesWith(rs.getString("live_with"));
                children.setAge(rs.getString("birth_date"));
                children.setSpeaks("speaks");
                children.setProfile_pic(rs.getString("path"));
                children.setSchools(rs.getString("school"));
                children.setSponsors_saying("sponsor_saying");
                children.setHistory(rs.getString("history"));
                children.setFamily_income(rs.getString("family_income"));
                data.add(children);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(Childrens.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public int create(Children child, HttpServletResponse response) throws IOException {
        String query = "insert into childrens(id,first_name,last_name,gender,birth_date,live_with,speaks,school,family_income,history,sponsor_saying,active) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?)";
        int lastInsertedId = 0;
        try {
            ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, 0);
            ps.setString(2, child.getFirstName());
            ps.setString(3, child.getLastName());
            ps.setString(4, child.getGender());
            ps.setString(5, child.getAge());
            ps.setString(6, child.getLivesWith());
            ps.setString(7, child.getSpeaks());
            ps.setString(8, "");
            ps.setString(9, "");
            ps.setString(10, "");
            ps.setString(11, "");
            ps.setInt(12, 0);
            int result = ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                lastInsertedId = rs.getInt(1);
            }
            return lastInsertedId;
        } catch (SQLException ex) {
            Logger.getLogger(Childrens.class.getName()).log(Level.SEVERE, null, ex);
            return lastInsertedId;
        }
    }

    public Children show(String id) throws IOException {
        Children children = new Children();
        String query = "select * from childrens c join children_profiles p on c.id=p.foreign_id  where c.active=0 and c.id=" + id;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                children.setId(rs.getInt(1));
                children.setFirstName(rs.getString("first_name"));
                children.setLastName(rs.getString("last_name"));
                children.setGender(rs.getString("gender"));
                children.setLivesWith(rs.getString("live_with"));
                children.setAge(rs.getString("birth_date"));
                children.setSpeaks(rs.getString("speaks"));
                children.setSchools(rs.getString("school"));
                children.setSponsors_saying(rs.getString("sponsor_saying"));
                children.setHistory(rs.getString("history"));
                children.setProfile_pic(rs.getString("path"));
                children.setFamily_income(rs.getString("family_income"));

            }
            return children;
        } catch (SQLException ex) {
            Logger.getLogger(Childrens.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<Children> showByQuery(String type) throws IOException {
        ArrayList<Children> childrenData=new ArrayList<>();
        String query = "";
        if (type.equals("male") || type.equals("female")) {
            query = "select * from childrens c join children_profiles p on c.id=p.foreign_id  where c.active=0 and c.gender='"+type+"'";
        } else if (type.equals("school-yes")) {
            query = "select * from childrens c join children_profiles p on c.id=p.foreign_id  where c.active=0 and c.school='yes'";
        } else if (type.equals("family")) {
            query = "select * from childrens c join children_profiles p on c.id=p.foreign_id  where c.active=0 and c.live_with='family'";
        } else if (type.equals("need-sponsor")) {

        }

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Children children=new Children();
                children.setId(rs.getInt(1));
                children.setFirstName(rs.getString("first_name"));
                children.setLastName(rs.getString("last_name"));
                children.setGender(rs.getString("gender"));
                children.setLivesWith(rs.getString("live_with"));
                children.setAge(rs.getString("birth_date"));
                children.setSpeaks(rs.getString("speaks"));
                children.setSchools(rs.getString("school"));
                children.setSponsors_saying(rs.getString("sponsor_saying"));
                children.setHistory(rs.getString("history"));
                children.setProfile_pic(rs.getString("path"));
                children.setFamily_income(rs.getString("family_income"));
               childrenData.add(children);
            }
            return childrenData;
        } catch (SQLException ex) {
            Logger.getLogger(Childrens.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void update() {

    }

    public void delete() {

    }

}
