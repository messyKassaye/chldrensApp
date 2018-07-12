<%-- 
    Document   : add-roles
    Created on : Jul 11, 2018, 9:54:29 PM
    Author     : meseret
--%>

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
                            <div class="col-md-8 col-lg-8 col-sm-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-lg-offset-3 col-md-6 col-lg-6 col-sm-12">
                                            <h2 class="text-center text-success">Add Roles</h2>
                                            <%
                                              if(session.getAttribute("roleAdded")!=null){    
                                            %>
                                            <h3 class="text-success"><%=session.getAttribute("roleAdded") %></h3>
                                            <%}%>
                                            <p></p>
                                            <form action="RegisterRoles" method="post">
                                                <div class="form-group">
                                                    <label for="fullName">Role Name</label>
                                                    <input class="form-control" placeholder="Role Name" id="fullName" name="roleName" required="">
                                                </div>

                                                <div class="form-group">
                                                    <label for="resp">Responsibility:</label>
                                                    <textarea class="form-control" placeholder="Responsibilty......." id="resp" name="resp" rows="10"  cols="10">
                                                        
                                                    </textarea>
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control btn btn-primary" type="submit" value="Register User">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-lg-4 col-sm-12">
                                <h3>What is Role</h3>
                                <p class="text-justify"><strong>Role is:</strong>A prescribed or expected behavior associated with a particular position or status in a group or organization</p>
                                <p><strong>Example:</strong>Data Collector, Administrator, Department head</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                            <%@include file="../scripts.jsp" %>
    </body>
</html>
