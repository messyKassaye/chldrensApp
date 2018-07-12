/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ORM;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import models.WhatWeDo;

/**
 *
 * @author meseret
 */
public class WhatWeDos {

    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private ArrayList<WhatWeDo> data;

    public WhatWeDos(Connection con) {
        this.connection = con;
    }

    public ArrayList<WhatWeDo> index() throws IOException {
        data = new ArrayList<>();
        String query = "select * from what_we_dos w, covers c where c.foreign_id=w.id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                WhatWeDo what = new WhatWeDo();
                what.setId(rs.getInt(1));
                what.setTitle(rs.getString("title"));
                what.setSubTitle(rs.getString("sub_title"));
                what.setDescription(rs.getString("description"));
                what.setCover(rs.getString("path"));
                data.add(what);
            }
            return data;
        } catch (SQLException ex) {
            Logger.getLogger(WhatWeDos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public int create(WhatWeDo what,HttpServletResponse response) throws IOException {
      String query="insert into what_we_dos(id,title,sub_title,description) values(?,?,?,?)";
      int lastInsertedId=0;
        try {
            ps= connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, 0);
            ps.setString(2, what.getTitle());
            ps.setString(3, what.getSubTitle());
            ps.setString(4, what.getDescription());
            int result= ps.executeUpdate();
            ResultSet rs2 = ps.getGeneratedKeys();
            while (rs2.next()) {
                lastInsertedId = rs2.getInt(1);
            }
            return lastInsertedId;
        } catch (SQLException ex) {
            Logger.getLogger(WhatWeDos.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
            return 0;
        }
    }

    public WhatWeDo show(String id) throws IOException {
        WhatWeDo what = new WhatWeDo();
        String query = "select * from what_we_dos w, covers c where c.foreign_id=w.id and w.id=" + id + ";";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                what.setId(rs.getInt("id"));
                what.setTitle(rs.getString("title"));
                what.setDescription(rs.getString("description"));
                what.setCover(rs.getString("path"));
            }
            return what;
        } catch (SQLException ex) {
            Logger.getLogger(WhatWeDos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
