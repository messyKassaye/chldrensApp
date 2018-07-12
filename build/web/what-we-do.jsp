
<%@page import="java.util.ArrayList"%>
<%@page import="ORM.WhatWeDos"%>
<%@page import="java.sql.Connection"%>
<%@page import="models.WhatWeDo"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%
  Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
  WhatWeDos what =new WhatWeDos(connection);
  String id=request.getParameter("id");
  WhatWeDo what_data= what.show(id);
%>

<div class="container-fluid" style="margin-top: 50px;padding: 20px;">
    <div class="container">

        <div class="row">
            <div class="col-md-8 col-lg-8 col-sm-12 ">
                <h4 class="text-info"><%=what_data.getTitle() %></h4>
                <p class="text-justify">
                    <%=what_data.getDescription() %>
                </p>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-12" >
                <div class="col-md-12 col-lg-12 my-div">
                    <h2 class="text-success">Considered donating?</h2>
                    <p class="text-justify" style="
                       font-size: 1.7rem;
                       font-weight: 500;
                       line-height: 1.4;
                       ">There are so many great ways to get involved. Volunteer your time or simply provide a financial donation. Every pound makes a difference.</p>
                    <p  style="
                        font-size: 1.7rem;
                        font-weight: 500;
                        line-height: 1.4;
                        ">
                        Click the button below to give securely on-line in Dollars  now...
                    </p>
                    <a rel="#">
                        <img src="resources/images/donat_btn.gif" class="img-rounded" style="width:100%;"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

