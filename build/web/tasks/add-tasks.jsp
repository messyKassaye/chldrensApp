<%-- 
    Document   : add-tasks
    Created on : Jul 18, 2018, 12:27:55 PM
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
                                <h2 class="text-info">Add tasks</h2>
                            </div>
                        </div>
                    </div>       
                </div>
            </div>
        </div>
                <%@include file="../scripts.jsp" %>
    </body>
</html>
