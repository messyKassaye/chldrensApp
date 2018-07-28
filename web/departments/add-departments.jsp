<%-- 
    Document   : add-departments
    Created on : Jul 18, 2018, 12:27:06 PM
    Author     : meseret
--%>
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
                            <div class="col-md-offset-3 col-lg-offset-3 col-md-6 col-lg-6 col-sm-12">
                                <h2 class="text-info">Register departments</h2>
                                <%
                                    if(session.getAttribute("department")!=null){
                                %>
                                <h4 class="text-success"><%=session.getAttribute("department") %></h4>
                                <%}%>
                                <form action="AddDepartment" method="post">
                                    <div class="form-group">
                                        <label for="name">Department Name:</label>
                                        <input class="form-control" name="name" id="name" placeholder="Department name">
                                    </div>
                                    <div class="form-group">
                                        <label for="desc">Description:</label>
                                        <textarea class="form-control" name="desc" id="desc" placeholder="say somthing about this department" rows="10" cols="10"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control btn btn-primary" type="submit" value="Register">
                                    </div>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>

        </div>
        <%@include file="../scripts.jsp" %>
    </body>
</html>

