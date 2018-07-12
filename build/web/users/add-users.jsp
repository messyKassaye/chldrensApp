<%-- 
    Document   : add-users
    Created on : Jul 11, 2018, 8:33:24 PM
    Author     : meseret
--%>


<%@page import="models.Role"%>
<%@page import="ORM.Roles"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../admin-header.jsp" %>
    <body style="background-color: #f6f4f3;margin: 0px">
        <div class="container-fluid">
            <div id="throbber" style="display:none; min-height:120px;"></div>
            <div id="noty-holder"></div>
            <div id="wrapper">
                <%@include file="../sidenav.jsp" %>
                <div id="page-wrapper" style="margin-top: 80px;">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-lg-offset-3 col-md-6 col-lg-6 col-sm-12">
                                            <h2 class="text-center text-success">Register Users</h2>
                                            <%                                              
                                                if (session.getAttribute("userAdded") != null) {
                                            %>

                                            <h3 class="text-success"><%=session.getAttribute("userAdded") %></h3>
                                            <%}%>
                                            <form action="RegisterUsers" method="post">
                                                <div class="form-group">
                                                    <label for="fullName">Full Name:</label>
                                                    <input class="form-control" placeholder="Full Name" id="fullName" name="fullName" required="">
                                                </div>

                                                <div class="form-group">
                                                    <label for="phone">Phone Number:</label>
                                                    <input class="form-control" placeholder="Phone number" id="phone" name="phoneNo" required="">
                                                </div>

                                                <div class="form-group">
                                                    <label for="email">Email Address:</label>
                                                    <input class="form-control" placeholder="Email" id="email" name="email" required="">
                                                </div>

                                                <div class="form-group">
                                                    <label for="firstName">Gender:</label>
                                                    <select class="form-control" id="gender" name="gender">
                                                        <option>Gender</option>
                                                        <option>female</option>
                                                        <option>male</option>
                                                    </select>
                                                </div>
                                                <%                                                    Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                                                    Roles role = new Roles(connection);
                                                    ArrayList<Role> role_data = role.index();
                                                    if (role_data.size() > 0) {

                                                %>
                                                <div class="form-group">
                                                    <label for="firstName">Role of this User:</label>
                                                    <select class="form-control" id="gender" name="role">
                                                        <option>Role</option>
                                                        <%                                                            for (int i = 0; i < role_data.size(); i++) {
                                                        %>
                                                        <option value="<%=role_data.get(i).getId()%>"><%=role_data.get(i).getName()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <%} else {%>
                                                <P class="text-danger">Users Role is not Added. <a href="AddRoles">Add Roles</a></P>
                                                    <%}%>
                                                <div class="form-group">
                                                    <label for="userName">User Name:</label>
                                                    <div class="row">
                                                        <div class="col-md-8 col-lg-8 col-sm-12">
                                                            <input class="form-control userName" placeholder="User Name" id="userName" name="userName" required="">
                                                        </div>
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <button class="btn btn-primary userNameGenerator">Generate user name</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Password</label>
                                                    <div class="row">
                                                        <div class="col-md-8 col-lg-8 col-sm-12">
                                                            <input class="form-control password" placeholder="password" id="password" name="password" required="">
                                                        </div>
                                                        <div class="col-md-4 col-lg-4 col-sm-12">
                                                            <button class="btn btn-primary passwordGenerator">Generate password</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control btn btn-primary" type="submit" value="Register User">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../scripts.jsp" %>
            <script type="text/javascript">
                $(document).ready(function () {

                    $('.userNameGenerator').click(function (e) {
                        e.preventDefault();
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

                        for (var i = 0; i < 5; i++) {
                            text += possible.charAt(Math.floor(Math.random() * possible.length));
                        }
                        $('.userName').val("");
                        $('.userName').val(text);


                    });

                    $('.passwordGenerator').click(function (e) {
                        e.preventDefault();
                        var a = Math.floor(100000 + Math.random() * 900000);
                        a = String(a);
                        a = a.substring(0, 4);
                        $('.password').val('');
                        $('.password').val(a);
                    });
                });
            </script>
    </body>
</html>
