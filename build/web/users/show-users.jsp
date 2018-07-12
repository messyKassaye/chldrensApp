<%-- 
    Document   : show-users
    Created on : Jul 11, 2018, 8:33:37 PM
    Author     : meseret
--%>

<%@page import="ORM.Users"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../admin-header.jsp" %>
    <body>
        <div class="container-fluid">
            <div id="throbber" style="display:none; min-height:120px;"></div>
            <div id="noty-holder"></div>
            <div id="wrapper">
                <%@include file="../sidenav.jsp" %>
                <div id="page-wrapper" style="margin-top: 80px;">
                    <div class="container-fluid">
                        <div class="tabbable-panel pull-left">
                            <%                                Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                                Users users = new Users(connection);
                                ArrayList<User> user_data = users.index();

                                int numberOfColumn = 4;
                                int rowCount = 0;
                                int bootstrapColumWidth = 12 / numberOfColumn;

                            %>
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#about-us" data-toggle="tab">
                                            Show in profile 
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#address" data-toggle="tab">
                                            Show In Table
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">

                                    <!-- about of child -->
                                    <div class="tab-pane active" id="about-us">
                                        <div class="row">

                                            <%                                                for (int i = 0; i < user_data.size(); i++) {
                                            %>

                                            <%
                                                if (user_data.get(i).getRole_id() != 1) {


                                            %>
                                            <div class="col-md-2 col-lg-2 col-sm-12">
                                                <div class="card bg-light">
                                                    <a href="#" ><img class="card-img-top" src="<%=user_data.get(i).getProfile()%>"></a>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><%=user_data.get(i).getFullName()%></h3>
                                                        <a href="" class="btn btn-primary text-center">Details</a>
                                                    </div>
                                                </div>

                                            </div>
                                            <%  }
                                                if (i % 5 == 0) {
                                                    out.print("<br>");
                                                }
                                            %>

                                            <%}%>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>

                                    <!-- about of child -->
                                    <div class="tab-pane" id="address">

                                        <div class="card bg-light">
                                            <div class="card-header">
                                                <div class="container-fluid">
                                                    <div class="col-md-3 col-lg-3 col-sm-4">
                                                        <span class="card-header-title"><i class="fa fa-child"></i> List of users</span>

                                                    </div>
                                                    <div class="col-md-9 col-lg-9 col-sm-8">
                                                        <div class="pull-right row">
                                                            <div class="col-md-6 col-sm-6 col-lg-6">
                                                                <button onclick="printTable()" class="btn btn-primary">Print</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <table  id="mytable" class="table table-bordred table-striped table-hover">

                                                    <thead>

                                                    <th>#</th>
                                                    <th>Full Name</th>
                                                    <th>Phone No</th>
                                                    <th>Gender</th>
                                                    <th>email</th>
                                                    <th>User Name</th>
                                                    <th>Temporary Password</th>
                                                    <th>Role</th>
                                                    <th>Responsibility</th>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            for (int i = 0; i < user_data.size(); i++) {

                                                        %>

                                                        <tr>
                                                            <td><%=i%></td>
                                                            <td><%=user_data.get(i).getFullName()%></td>
                                                            <td><%=user_data.get(i).getPhone()%></td>
                                                            <td><%=user_data.get(i).getGender()%></td>
                                                            <td><%=user_data.get(i).getEmail()%></td>
                                                            <td><%=user_data.get(i).getUserName()%></td>
                                                            <td><%=user_data.get(i).getTemp_pass()%></td>
                                                            <td><%=user_data.get(i).getRole_name()%></td>
                                                            <td><%=user_data.get(i).getResponsibility()%></td>
                                                        </tr>

                                                        <%}%>
                                                    </tbody>
                                                </table>
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
            <script type="text/javascript">
                function printTable() {
                    //Get the HTML of div
                    var divToPrint = document.getElementById("mytable");
                    divToPrint.style.border='1px solid gray';
                    divToPrint.style.cell='collapse';
                    newWin = window.open("");
                    newWin.document.write(divToPrint.outerHTML);
                    newWin.print();
                    newWin.close();

                }
            </script>
    </body>
</html>
