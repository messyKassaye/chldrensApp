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
import models.SponsorInNeed;

/**
 *
 * @author meseret
 */
public class SponsorInNeeds {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<SponsorInNeed> data;

    public SponsorInNeeds(Connection con) {
        this.connection = con;
    }

    public void index() {

    }

    public void create() {

    }

    public ArrayList<SponsorInNeed> show(SponsorInNeed sponsor, HttpServletResponse response) throws IOException {
        data = new ArrayList<>();
        String query = "";
        if (sponsor.getGender().equals("any")) {
            query = " select * from childrens c join sponsor_in_needs s on c.id = s.children_id "
                    + "join children_profiles p on c.id=p.foreign_id "
                    + "join children_addresses a on c.id=a.children_id ";
        } else {
            query = " select * from childrens c join sponsor_in_needs s on c.id = s.children_id "
                    + "join children_profiles p on c.id=p.foreign_id "
                    + "join children_addresses a on c.id=a.children_id where c.gender='" + sponsor.getGender() + "'";
        }
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                SponsorInNeed inNeed = new SponsorInNeed();
                inNeed.setFirstName(rs.getString("first_name"));
                inNeed.setLastName(rs.getString("last_name"));
                inNeed.setCountry(rs.getString("country"));
                inNeed.setAge(Integer.parseInt(rs.getString("birth_date")));
                inNeed.setNeeds(rs.getString("needAverage"));
                inNeed.setGender(rs.getString("gender"));
                inNeed.setProfile(rs.getString("path"));
                data.add(inNeed);
            }
            return data;

        } catch (SQLException ex) {
            Logger.getLogger(SponsorInNeeds.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return null;
        }
    }

    public void update() {

    }

    public void delete() {

    }

}
