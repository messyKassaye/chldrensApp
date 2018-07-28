<%-- 
    Document   : show-departments
    Created on : Jul 18, 2018, 12:27:22 PM
    Author     : meseret
--%>

<%@page import="ORM.Users"%>
<%@page import="models.Department"%>
<%@page import="ORM.Departments"%>
<%@page import="java.sql.Connection"%>
<html>
    <%@include file="../admin-header.jsp" %>
    <body style="background-color: #f6f4f3;margin: 0px">
        <div class="container-fluid">
            <div id="throbber" style="display:none; min-height:120px;"></div>
            <div id="noty-holder"></div>
            <%                Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                Departments departments = new Departments(connection);
                ArrayList<Department> dep_data = departments.index();
            %>
            <div id="wrapper">
                <%@include file="../sidenav.jsp" %>
                <div id="page-wrapper" style="margin-top: 80px;">
                    <div class="container">
                        <div class="row">

                            <h2 class="text-info">List of Departments</h2>
                            <%                                    for (int i = 0; i < dep_data.size(); i++) {
                            %>
                            <div class="col-md-4">
                                <div class="card bg-light">
                                    <div class="card-header">
                                        <h3 class="card-title"><%=dep_data.get(i).getName()%></h3>
                                    </div>
                                    <div class="card-body">
                                        <p><%=dep_data.get(i).getDesc()%></p>
                                        <%
                                            if (dep_data.get(i).getHeadName() != null) {
                                        %>
                                        <P><strong>Administrator: </strong><%=dep_data.get(i).getHeadName()%></P>
                                            <%} else {%>
                                        <a class="btn btn-primary displayModal"
                                           name="<%=dep_data.get(i).getName()%>" 
                                           dep_id="<%=dep_data.get(i).getId()%>">Add Administrator</a>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">New message</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="tabbable-panel pull-left">

                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#about-us" data-toggle="tab">
                                            Select Users 
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#address" data-toggle="tab">
                                            Register new User
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="about-us">
                                        <%
                                            Users users = new Users(connection);
                                            ArrayList<User> user_data = users.department();
                                            if (user_data.size() > 0) {
                                        %>
                                        <h4 class="text-info">List of Users who are registered as department head</h4>
                                        <table class="table table-bordred table-hover">
                                            <thead>
                                            <th>No</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Select</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < user_data.size(); i++) {
                                                %>
                                                <tr>
                                                    <td><%=user_data.get(i).getId() %></td>
                                                    <td><%=user_data.get(i).getFullName() %></td>
                                                    <td><%=user_data.get(i).getEmail() %></td>
                                                    <td><a class="btn btn-success" user_id="<%=user_data.get(i).getId() %>">Select</a></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                        <%} else {%>
                                        <h3>No one is register previously as Department head</h3>
                                        <%}%>
                                    </div>
                                    <div class="tab-pane" id="address">
                                        <form action="RegisterUsers" method="post">
                                            <div class="form-group" style="display: none;">
                                                <label for="full_name" class="col-form-label">Full Name:</label>
                                                <input type="text" class="form-control departmentId" id="full_name" name="departmentId">
                                            </div>

                                            <div class="form-group">
                                                <label for="full_name" class="col-form-label">Full Name:</label>
                                                <input type="text" class="form-control" id="full_name" name="fullName">
                                            </div>

                                            <div class="form-group">
                                                <label for="phoneNo" class="col-form-label">Phone no:</label>
                                                <input class="form-control" id="phoneNo" name="phoneNo" placeholder="Phone no">
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
                                                <label for="password">Password:</label>
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
                                                <input type="submit" class="btn btn-success" value="Register Admin">
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="display: none;">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../scripts.jsp" %>
        <script type="text/javascript">
            $(document).ready(function () {

                $('.displayModal').on('click', function () {
                    $('#exampleModal').modal('show');
                    var department_name = $(this).attr('name');
                    var department_id = $(this).attr('dep_id');
                    $('.departmentId').val(department_id);
                    $('#exampleModalLabel').html("Register admin for department of " + department_name);
                });

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
