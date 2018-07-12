<%@page import="models.ChildrenHouse"%>
<%@page import="models.Sibling"%>
<%@page import="models.Talent"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Enjoy"%>
<%@page import="models.ChildrenAddress"%>
<%@page import="models.Children"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<div class="container-fluid">
    <%
        Children children = (Children) session.getAttribute("child");
        ArrayList<ChildrenAddress> address = (ArrayList) session.getAttribute("featuredChildAddress");
        ArrayList<Enjoy> enjoy = (ArrayList) session.getAttribute("enjoys");
        ArrayList<Talent> talents = (ArrayList) session.getAttribute("talents");
        ArrayList<Sibling> sibling = (ArrayList) session.getAttribute("siblings");
    %>
    <div class="row">
        <img src="resources/images/dr-child-top.jpg" class="img-responsive"  style="width: 100%;"/>
    </div>
    <div class="container">
        <div class="row">
            <!-- profile image -->
            <div class="col-md-3 col-lg-3 col-sm-12">
                <img src="<%=children.getProfile_pic()%>" class="img-responsive img-rounded" style="margin-top: -60px;">
                <p>Share 

                </p>
            </div>

            <!-- description -->
            <div class="col-md-6 col-lg-6 col-sm-12">
                <h1 class="text-success"><%=children.getFirstName() + " " + children.getLastName()%></h1>
                <p class="what-we-do text-justify">
                    <%=children.getSponsors_saying()%>
                </p>
                <hr class="hr-rule">
                <div class="row" style="word-spacing: -10px;margin-top: -10px;">
                    <div class="col-md-4 col-lg-4 col-sm-12">
                        <span class="glyphicon glyphicon-calendar"> <%=children.getAge()%> years old</span>
                    </div>
                    <%
                        if (address.size() > 0) {
                    %>
                    <div class="col-md-4 col-lg-4 col-sm-12">
                        <span class="glyphicon glyphicon-flag" style="text-align: center;" > <%=address.get(0).getCountry()%></span>
                    </div>
                    <div class="col-md-4 col-lg-4 col-sm-12">
                        <span class="glyphicon glyphicon-tower" style="float: right;"> <%=address.get(0).getCity()%></span>
                    </div>
                    <%}%>
                </div>
            </div>

            <!-- buttons -->
            <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: center;margin-top: 50px;">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <%
                        if (children.getGender().contains("female")) {
                    %>
                    <a class="btn btn-success btn-lg my-btn">Sponser Her Now </a>
                    <%  } else { %>

                    <a class="btn btn-success btn-lg my-btn">Sponser Him Now</a>

                    <% }%>
                    <a class="btn btn-lg white-btn">Search more kids </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-12">                                    
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>About me and my Family</h3>
                    </div>

                    <div class="panel-body">
                        <p class="main-p">
                            <strong>Name:</strong> <%=children.getFirstName() + " " + children.getLastName()%>
                        </p>
                        <p class="main-p">
                            <strong>Family income:</strong> <%=children.getFamily_income()%> birr
                        </p>
                        <p class="main-p">
                            <strong>Gender </strong> <%=children.getGender()%>
                        </p>
                        <p class="main-p">
                            <strong>Age: </strong> <%=children.getAge() + " years old"%>
                        </p>
                        <p class="main-p">
                            <strong>Enjoys: </strong> 

                            <%
                                for (int i = 0; i < enjoy.size(); i++) {
                            %>
                            <span><%=enjoy.get(i).getEnjoys()%>, </span>
                            <%}%>
                        </p>
                        <p class="main-p">
                            <strong>Talents: </strong> 
                            <%
                                for (int i = 0; i < talents.size(); i++) {
                            %>
                            <span><%=talents.get(i).getTalent()%>, </span>
                            <%}%>
                        </p>
                        <p class="main-p">
                            <strong>Siblings: </strong><br>
                            <%
                                for (int i = 0; i < sibling.size(); i++) {
                            %>
                            <span><%=sibling.get(i).getFirstName() + " " + sibling.get(i).getLastName() + "," + sibling.get(i).getGender() + " ," + sibling.get(i).getBirthDate()%>, </span><br>
                            <%}%>
                        </p>
                        <p class="main-p">
                            <strong>Lives With: </strong> <%=children.getLivesWith()%>
                        </p>
                        <p class="main-p">
                            <strong>Language:</strong> <%=children.getSpeaks()%>
                        </p>
                        <p class="main-p">
                            <strong>Schools: </strong> <%=children.getSchools()%>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>About my house</h3>
                    </div>

                    <div class="panel-body">
                        <%
                            ArrayList<ChildrenHouse> house = (ArrayList) session.getAttribute("houses");

                            for (int i = 0; i < house.size(); i++) {
                        %>
                        <p class="main-p">
                            <strong><%=house.get(i).getKey()%>: </strong> <%=house.get(i).getValue()%>
                        </p>
                        <%}%>

                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-12">
                <%
                    if (address.size() > 0) {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>About <%=address.get(0).getCountry()%></h3>
                    </div>

                    <div class="panel-body">

                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
<%@include file ="footer.jsp" %>
