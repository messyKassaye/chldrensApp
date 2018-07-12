<%-- 
    Document   : child-deatil
    Created on : Jul 7, 2018, 5:15:11 PM
    Author     : meseret
--%>

<%@page import="models.Hobby"%>
<%@page import="ORM.Hobbies"%>
<%@page import="models.ChildrenHouse"%>
<%@page import="ORM.ChildrenHouses"%>
<%@page import="models.Sibling"%>
<%@page import="ORM.Siblings"%>
<%@page import="models.Talent"%>
<%@page import="ORM.Talents"%>
<%@page import="models.Enjoy"%>
<%@page import="ORM.Enjoys"%>
<%@page import="models.ChildrenAddress"%>
<%@page import="ORM.ChildrenAddresses"%>
<%@page import="models.Children"%>
<%@page import="ORM.Childrens"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../admin-header.jsp" %>
    <body>

        <div id="throbber" style="display:none; min-height:120px;"></div>
        <div id="noty-holder"></div>
        <div id="wrapper">
            <%@include file="../sidenav.jsp" %>
            <div id="page-wrapper" >
                <div class="container-fluid" style="margin-top: 50px;">
                    <div class="row">

                        <div class="col-md-offset-1 col-md-11 col-lg-11 col-sm-12">


                            <%                        String id = (String) request.getParameter("id");
                                Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                                Childrens childrens = new Childrens(connection);
                                Children children = childrens.show(id);
                                //address of featured child
                                ChildrenAddresses address = new ChildrenAddresses(connection);
                                ArrayList<ChildrenAddress> child_address = address.show("" + id);

                                //enjoys of featured child
                                Enjoys enjoys = new Enjoys(connection);
                                ArrayList<Enjoy> enjoy_data = enjoys.show("" + id);

                                //featured child talent
                                Talents talent = new Talents(connection);
                                ArrayList<Talent> talent_data = talent.show("" + id);

                                Hobbies hobbies = new Hobbies(connection);
                                ArrayList<Hobby> hobby_data = hobbies.show(id);

                                //siblings of featured child
                                Siblings sibling = new Siblings(connection);
                                ArrayList<Sibling> sibling_data = sibling.show("" + id, response);

                                ChildrenHouses house = new ChildrenHouses(connection);
                                ArrayList<ChildrenHouse> house_data = house.show("" + id);
                            %>
                            <div class="col-md-2 col-lg-2 col-sm-12">
                                <div class="card bg-light">
                                    <img class="img-responsive  card-img-top" src="<%=children.getProfile_pic()%>" width="230" height="230">
                                    <div class="card-body">
                                        <h3 class="card-title text-muted"><%=children.getFirstName() + " " + children.getLastName()%></h3>
                                        <a class="btn btn-default">Change Picture</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-10 col-lg-10 col-sm-12">
                                <div class="tabbable-panel pull-left">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#about-us" data-toggle="tab">
                                                    About
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#address" data-toggle="tab">
                                                    Address
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#talents" data-toggle="tab">
                                                    Talents
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#enjoys" data-toggle="tab">
                                                    Enjoys
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#hobbies" data-toggle="tab">
                                                    Hobbies
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#family" data-toggle="tab">
                                                    Families
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#sibling" data-toggle="tab">
                                                    Sibling
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#educationBackground" data-toggle="tab">
                                                    Education Background
                                                </a>
                                            </li>
                                            <%
                                                if (children.getLivesWith() != null) {
                                            %>
                                            <li>
                                                <a href="#about-house" data-toggle="tab">
                                                    About House
                                                </a>
                                            </li>
                                            <%}%>
                                            <li>
                                                <a href="#donate" data-toggle="tab">
                                                    Donate
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#sponsors" data-toggle="tab">
                                                    Sponsors
                                                </a>
                                            </li>

                                        </ul>
                                        <div class="tab-content">

                                            <!-- about of child -->
                                            <div class="tab-pane active" id="about-us">
                                                <p class="main-p">
                                                    <strong>Name:</strong> <%=children.getFirstName() + " " + children.getLastName()%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>Family income:</strong> <%=children.getFamily_income()%> birr
                                                </p>
                                                <p class="main-p">
                                                    <strong>Gender </strong> <%=children.getGender()%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>Age: </strong> <%=children.getAge() + " years old"%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>Lives With: </strong> <%=children.getLivesWith()%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>Language:</strong> <%=children.getSpeaks()%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>Schools: </strong> <%=children.getSchools()%>
                                                </p>
                                            </div>
                                            <!-- end of about of child -->

                                            <!-- address of child -->
                                            <div class="tab-pane" id="address">
                                                <%
                                                    if (child_address.size() > 0) {

                                                %>
                                                <p class="main-p">
                                                    <strong>Country: </strong> <%=child_address.get(0).getCountry()%>
                                                </p>
                                                <p class="main-p">
                                                    <strong>City </strong> <%=child_address.get(0).getCity()%>
                                                </p>
                                                <%} else {%>
                                                <h3 class="text-info">Address of <%=children.getFirstName() + " " + children.getLastName()%> is not added</h3>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <div class="">
                                                                <form action="ChildrenAddress" method="post">
                                                                    <div class="form-group" style="display: none">
                                                                        <label for="country">Country</label>
                                                                        <input class="form-control" name="id" id="country" value="<%=id%>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="country">Country</label>
                                                                        <input class="form-control" name="country" id="country" placeholder="Country" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="city">Country</label>
                                                                        <input class="form-control" name="city" id="country" placeholder="City" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="form-control btn btn-primary" value="Add" type="submit" >
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                            <!-- end of address of child -->


                                            <!-- talent start here -->
                                            <div class="tab-pane" id="talents">
                                                <%

                                                    if (talent_data.size() > 0) {

                                                %>
                                                <h4 class="text-info">My Talents</h4>
                                                <%                                                    for (int i = 0; i < talent_data.size(); i++) {
                                                %>
                                                <h5><%=talent_data.get(i).getTalent()%></h5>
                                                <%}%>
                                                <button class="pull-left btn btn-primary btn-sm" style="margin-top: 30px;">Add more</button>
                                                <%} else {%>

                                                <h3 class="text-info">Talents of <%=children.getFirstName() + " " + children.getLastName()%> is not added</h3>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <div class="">
                                                                <form action="TalentServlet" method="post">
                                                                    <div class="form-group" style="display: none">
                                                                        <label for="country">Talent</label>
                                                                        <input class="form-control" name="id" id="country" value="<%=id%>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="talent">Talent</label>
                                                                        <input class="form-control" name="talent" id="talent" placeholder="Talents" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="form-control btn btn-primary" value="Add" type="submit" >
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%}%>
                                            </div>
                                            <!-- talent start here -->

                                            <!--- enjoy started here -->
                                            <div class="tab-pane" id="enjoys">

                                                <%

                                                    if (enjoy_data.size() > 0) {

                                                %>
                                                <h4 class="text-info">What makes me Enjoyable</h4>
                                                <%                                                    for (int i = 0; i < enjoy_data.size(); i++) {
                                                %>
                                                <h5><%=enjoy_data.get(i).getEnjoys()%></h5>
                                                <%}%>
                                                <button class="pull-left btn btn-primary btn-sm" style="margin-top: 30px;">Add more</button>
                                                <%} else {%>

                                                <h3 class="text-info">What makes enjoy <%=children.getFirstName() + " " + children.getLastName()%> is not added</h3>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <div class="">
                                                                <form action="EnjoyServlet" method="post">
                                                                    <div class="form-group" style="display: none">
                                                                        <label for="country">Enjoy</label>
                                                                        <input class="form-control" name="id" id="country" value="<%=id%>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="talent">Enjoy</label>
                                                                        <input class="form-control" name="enjoy" id="talent" placeholder="Enjoys" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="form-control btn btn-primary" value="Add" type="submit" >
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%}%>
                                            </div>
                                            <!--- end of talents tab pane -->


                                            <!-- hobby started -->
                                            <div class="tab-pane" id="hobbies">


                                                <%

                                                    if (hobby_data.size() > 0) {

                                                %>
                                                <h4 class="text-info">My Hobbies</h4>
                                                <%                                                    for (int i = 0; i < hobby_data.size(); i++) {
                                                %>
                                                <h5><%=hobby_data.get(i).getName()%></h5>
                                                <%}%>
                                                <button class="pull-left btn btn-primary btn-sm" style="margin-top: 30px;">Add more</button>
                                                <%} else {%>

                                                <h3 class="text-info">Hobbies of <%=children.getFirstName() + " " + children.getLastName()%> is not added</h3>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <div class="">
                                                                <form action="HobbiesServlet" method="post">
                                                                    <div class="form-group" style="display: none">
                                                                        <label for="country">hobby</label>
                                                                        <input class="form-control" name="id" id="country" value="<%=id%>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="talent">Enjoy</label>
                                                                        <input class="form-control" name="hobby" id="talent" placeholder="Hobbies" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="form-control btn btn-primary" value="Add" type="submit" >
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%}%>


                                            </div>
                                            <!-- end of hobby started -->
                                            
                                            <!-- family starts here -->
                                            <div class="tab-pane" id="family">
                                                Family
                                            </div>


                                            <!-- hobby started -->
                                            <div class="tab-pane" id="sibling">


                                                <%

                                                    if (sibling_data.size() > 0) {

                                                %>


                                                <%                                                    for (int i = 0; i < sibling_data.size(); i++) {
                                                %>

                                                <%
                                                    if (sibling_data.get(i).getGender().endsWith("Brother")) {
                                                %>
                                                <h3>Brothers</h3>
                                                <p><%=sibling_data.get(i).getFirstName() + " " + sibling_data.get(i).getLastName()%></p>
                                                <%} else {%>
                                                <h3>Sisters</h3>
                                                <p><%=sibling_data.get(i).getFirstName() + " " + sibling_data.get(i).getLastName()%></p>
                                                <%}%>

                                                <%}%>
                                                <button class="pull-left btn btn-primary btn-sm" style="margin-top: 30px;">Add more</button>
                                                <%} else {%>

                                                <h3 class="text-info">Add brother or sister of <%=children.getFirstName() + " " + children.getLastName()%> </h3>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <div class="">
                                                                <form action="SiblingServlet" method="post">
                                                                    <div class="form-group" style="display: none">
                                                                        <label for="country">hobby</label>
                                                                        <input class="form-control" name="id" id="country" value="<%=id%>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="name">First Name:</label>
                                                                        <input class="form-control" name="firstName" id="name" placeholder="First Name" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="lastName">Last Name:</label>
                                                                        <input class="form-control" name="lastName" id="lastName" placeholder="Last Name" >
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="country">Relation Type</label>
                                                                        <select class="form-control" id="country" name="relation">
                                                                            <option>Brother</option>
                                                                            <option>Sister</option>
                                                                        </select>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="birthDate">Birth date</label>
                                                                        <div class='input-group date' id='datetimepicker1'>
                                                                            <input type='text' class="form-control" name="birthDate" id="birthDate" />
                                                                            <span class="input-group-addon">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </span>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <input class="form-control btn btn-primary" value="Add" type="submit" >
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%}%>
                                            </div>
                                            <!-- end of sibling -->




                                            <div class="tab-pane" id="educationBackground">
                                                Education Background
                                            </div>

                                            <div class="tab-pane" id="about-house">
                                                About house
                                            </div>
                                            <div class="tab-pane" id="donate">
                                                donate
                                            </div>
                                            <div class="tab-pane" id="sponsors">
                                                Sponsors
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../scripts.jsp" %>
    </body>
</html>
