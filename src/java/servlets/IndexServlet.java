package servlets;

import ORM.ChildrenAddresses;
import ORM.ChildrenHouses;
import ORM.Childrens;
import ORM.Enjoys;
import ORM.Siblings;
import ORM.Talents;
import ORM.Testimonials;
import ORM.Users;
import ORM.WhatWeDos;
import database.QueryBuilder;
import helpers.HashingPassword;
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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.print.Printer;
import models.Children;
import models.ChildrenAddress;
import models.ChildrenHouse;
import models.Enjoy;
import models.Sibling;
import models.Talent;
import models.Testimony;
import models.User;
import models.WhatWeDo;

@WebServlet(name = "servlets.IndexServlet")
public class IndexServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       

        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        HttpSession session = request.getSession(true);

        //finding featured child
        Childrens childrenORM = new Childrens(connection);
        Random random = new Random();
        ArrayList<Children> data = childrenORM.index();
        if (data.size() > 0) {
            ArrayList<Integer> randomData = new ArrayList<>();
            for (int i = 0; i < data.size(); i++) {
                randomData.add(data.get(i).getId());
            }
            int featuredChildId = randomData.get(random.nextInt(randomData.size()));
            Children child = childrenORM.show("" + featuredChildId);

            //address of featured child
            ChildrenAddresses address = new ChildrenAddresses(connection);
            ArrayList<ChildrenAddress> child_address = address.show("" + featuredChildId);

            //enjoys of featured child
            Enjoys enjoys = new Enjoys(connection);
            ArrayList<Enjoy> enjoy_data = enjoys.show("" + featuredChildId);
            session.setAttribute("enjoys", enjoy_data);

            //featured child talent
            Talents talent = new Talents(connection);
            ArrayList<Talent> talent_data = talent.show("" + featuredChildId);
            session.setAttribute("talents", talent_data);

            //siblings of featured child
            Siblings sibling = new Siblings(connection);
            ArrayList<Sibling> sibling_data = sibling.show("" + featuredChildId,response);
            session.setAttribute("siblings", sibling_data);

            ChildrenHouses house = new ChildrenHouses(connection);
            ArrayList<ChildrenHouse> house_data = house.show("" + featuredChildId);
            session.setAttribute("houses", house_data);

            session.setAttribute("featuredChild", child);
            session.setAttribute("featuredChildAddress", child_address);
        }
        //end of featured child

        //finding our works
        WhatWeDos what = new WhatWeDos(connection);
        ArrayList<WhatWeDo> whatData = what.index();
        //end of our works

        //testimony
        Testimonials testimony = new Testimonials(connection);
        ArrayList<Testimony> testimony_data = testimony.index(response);
        session.setAttribute("testimony", testimony_data);
        session.setAttribute("whatWedDo", whatData);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
