<%-- 
    Document   : show-what-we-do
    Created on : Jul 8, 2018, 10:14:05 PM
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
                    
                </div>
            </div>
        </div>
        
        <%@include file="../scripts.jsp" %>
    </body>
</html>
