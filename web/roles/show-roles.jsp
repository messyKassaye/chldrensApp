<%-- 
    Document   : show-roles
    Created on : Jul 11, 2018, 9:54:41 PM
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
                        <%                            Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                            Roles role = new Roles(connection);
                            ArrayList<Role> role_data = role.index();
                            if (role_data.size() > 0) {
                        %>
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">List of Roles</h3>
                            </div>
                            <div class="card-body">
                                <table id="mytable" class="table table-bordred table-striped table-hover">

                                    <thead>

                                    <th>#</th>
                                    <th>Role Name</th>
                                    <th>Responsibility</th>
                                    <th style="text-align: center">Action</th>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < role_data.size(); i++) {

                                        %>

                                        <tr>
                                            <td><%=i%></td>
                                            <td><%=role_data.get(i).getName() %></td>
                                            <td><%=role_data.get(i).getResponsibility() %></td>
                                            <td class="text-center">
                                                <a class='btn btn-info btn-xs' href="#">
                                                    <span class="glyphicon glyphicon-edit"></span> Edit
                                                </a> 
                                                <a href="#" class="btn btn-danger btn-xs">
                                                    <span class="glyphicon glyphicon-remove"></span> Delete
                                                </a>
                                                <a href="#" class="btn btn-success btn-xs">
                                                    <span class="glyphicon glyphicon-adjust"></span> Details
                                                </a>
                                            </td>
                                        </tr>

                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%} else {%>
                        <p>Role is not added yet ):</p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
                        <%@include file="../scripts.jsp" %>
    </body>
</html>
