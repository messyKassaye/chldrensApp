<%@page import="models.Role"%>
<%@page import="ORM.Roles"%>
<%@page import="ORM.Users"%>
<%@page import="ORM.Childrens"%>
<%@page import="java.sql.Connection"%>
<%@page import="models.Children"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%@include file="admin-header.jsp" %>
    <body style="background-color: #f6f4f3;margin: 0px">
        <%            Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
            Childrens childrenData = new Childrens(connection);
            ArrayList<Children> children = childrenData.index();

            Users user = new Users(connection);
            ArrayList<User> userList = user.index();

            Roles roles = new Roles(connection);
            ArrayList<Role> roleList = roles.index();
        %>
        <div class="container-fluid">
            <div id="throbber" style="display:none; min-height:120px;"></div>
            <div id="noty-holder"></div>
            <div id="wrapper">
                <%@include file="sidenav.jsp" %>

                <div id="page-wrapper" style="margin-top: 80px;">
                    <div class="container-fluid" >
                        <div class="row">
                            <!-- new message -->
                            <div class="col-md-3 col-lg-3 col-sm-6">
                                <div class="card text-white bg-primary">
                                    <div class="card-body">
                                        <h4 class="card-title"><%=children.size()%> Children registered</h4>
                                        <div class="card-body-icon">
                                            <i class="fa fa-fw fa-comments">

                                            </i>
                                        </div>
                                    </div>
                                    <div class="card-footer text-white clearfix">
                                        <a href="#" class="float-left text-white"><span >View Details</span></a>
                                        <a class="pull-right text-white">
                                            <span >
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- end of message -->


                            <!-- new message -->
                            <div class="col-md-3 col-lg-3 col-sm-6">
                                <div class="card text-white bg-warning">
                                    <div class="card-body">
                                        <h4 class="card-title"><%=userList.size()%> Users Are Registered</h4>
                                        <div class="card-body-icon">
                                            <i class="fa fa-fw fa-comments">

                                            </i>
                                        </div>
                                    </div>
                                    <div class="card-footer text-white clearfix">
                                        <a href="#" class="float-left text-white"><span >View Details</span></a>
                                        <a class="pull-right text-white">
                                            <span >
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- end of message -->




                            <!-- new message -->
                            <div class="col-md-3 col-lg-3 col-sm-6">
                                <div class="card text-white bg-success">
                                    <div class="card-body">
                                        <h4 class="card-title"><%=roleList.size()%> Roles are Added</h4>
                                        <div class="card-body-icon">
                                            <i class="fa fa-fw fa-comments">

                                            </i>
                                        </div>
                                    </div>
                                    <div class="card-footer text-white clearfix">
                                        <a href="#" class="float-left text-white"><span >View Details</span></a>
                                        <a class="pull-right text-white">
                                            <span >
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- end of message -->

                            <!-- new message -->
                            <div class="col-md-3 col-lg-3 col-sm-6">
                                <div class="card text-white bg-danger">
                                    <div class="card-body">
                                        <h4 class="card-title">5 things are not approved yet</h4>
                                        <div class="card-body-icon">
                                            <i class="fa fa-fw fa-comments">

                                            </i>
                                        </div>
                                    </div>
                                    <div class="card-footer text-white clearfix">
                                        <a href="#" class="float-left text-white"><span >View Details</span></a>
                                        <a class="pull-right text-white">
                                            <span >
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- end of message -->

                        </div>
                    </div>



                    <!-- children table -->
                    <div class="container-fluid" style="margin-top: 20px;">
                        <div class="row">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <div class="card bg-light">
                                    <div class="card-header">
                                        <div class="container-fluid">
                                            <div class="col-md-3 col-lg-3 col-sm-4">
                                                <span class="card-header-title"><i class="fa fa-child"></i> Registered children</span>

                                            </div>
                                            <div class="col-md-9 col-lg-9 col-sm-8">
                                                <div class="pull-right row">
                                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                                        <input class="form-control pull-left" type="text" placeholder="Search.....">
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-lg-6">
                                                        <select class="form-control" id="speaks" name="sort">
                                                            <option>Sort by</option>
                                                            <option>females</option>
                                                            <option>males</option>
                                                            <option>lives with family</option>
                                                            <option>Most need sponsor</option>
                                                            <option>Speaks Amharic</option>
                                                            <option>Speaks Oromiffa</option>
                                                            <option>Speaks Tigrigna</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table id="mytable" class="table table-bordred table-striped table-hover">

                                            <thead>

                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Gender</th>
                                            <th>Age</th>
                                            <th>Lives With</th>
                                            <th style="text-align: center">Action</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < children.size(); i++) {

                                                %>

                                                <tr>
                                                    <td><%=i%></td>
                                                    <td><%=children.get(i).getFirstName()%></td>
                                                    <td><%=children.get(i).getLastName()%></td>
                                                    <td><%=children.get(i).getGender()%></td>
                                                    <td><%=children.get(i).getAge()%></td>
                                                    <td><%=children.get(i).getLivesWith()%></td>
                                                    <td class="text-center">
                                                        <a class='btn btn-info btn-xs' href="#">
                                                            <span class="glyphicon glyphicon-edit"></span> Edit
                                                        </a> 
                                                        <a href="#" class="btn btn-danger btn-xs">
                                                            <span class="glyphicon glyphicon-remove"></span> Delete
                                                        </a>
                                                        <a href="details?id=<%=children.get(i).getId()%>" class="btn btn-success btn-xs">
                                                            <span class="glyphicon glyphicon-adjust"></span> Details
                                                        </a>
                                                    </td>
                                                </tr>

                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-lg-3 col-sm-12">
                                <div class="card bg-light">
                                    <div class="card-header">
                                        <span class="card-header-title"><i class="fa fa-handshake-o"></i> Children with sponsor</span>
                                    </div>
                                    <div class="card-body" style="padding: 0px !important">
                                        <div class="list-group">
                                            <%
                                                for (int i = 0; i < 5; i++) {
                                            %>
                                            <a class="list-group-item list-group-item-action" href="details?id=<%=children.get(i).getId()%>" style="border: none !important;font-size: 17px;">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <img class="img-circle" width="50" height="50" src="<%=children.get(i).getProfile_pic() %>" alt="" style="margin-right: 5px;"><%=children.get(i).getFirstName()+" "+children.get(i).getFirstName() %>
                                                    </div>
                                                </div>
                                            </a>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end of children table --> 



                    <!-- char starts here -->
                    <div class="container-fluid" style="margin-top: 20px;">
                        <div class="row">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <div class="card bg-light">
                                    <div class="card-header">
                                        <span class="card-header-title"><i class="fa fa-line-chart"></i> Children In need of help</span>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-lg-3 col-sm-12">

                            </div>
                        </div>
                    </div>
                    <!-- end of charts -->



                </div>

            </div>
            <!-- /#page-wrapper -->
        </div><!-- /#wrapper -->
    </div>
    <%@include file="scripts.jsp" %>
</body>
</html>
