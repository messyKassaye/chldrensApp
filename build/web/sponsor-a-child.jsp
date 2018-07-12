<%@page import="models.SponsorInNeed"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>

<div class="container" style="margin-top: 100px;">
    <h2 class="text-center custom-h2">change your life by changing theirs</h2>
    <p class="text-center">for as little as 200 birr a month</p>
    <div class="row">
        <%
            ArrayList<SponsorInNeed> data = (ArrayList) session.getAttribute("sponsorInNeed");
            for (int i = 0; i < data.size(); i++) {
        %>
        <div class="col-md-3 col-lg-3 col-sm-12">
            <div class="card bg-light">
                <img class="card-img-top" src="<%=data.get(i).getProfile() %>">
            <div class="card-body">
                <h3><%=data.get(i).getFirstName()+" "+data.get(i).getLastName() %></h3>
                <% 
                  if(data.get(i).getGender().equals("male")){
                %>
                <a href="#" class="btn btn-success">Sponsor Him</a>
                <%}else{%>
                <a href="#" class="btn btn-success">Sponsor Her</a>
                <%}%>
            </div>
        </div>
        </div>
        <%}%>
    </div>
</div>

<%@include file="footer.jsp" %>