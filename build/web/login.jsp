<%@include file="header.jsp"%>
<%@include file="navbar.jsp"%>

  <div class="container" style="margin-top: 150px;">
   <div class="row">
    <div class="col-md-offset-4 col-md-4 col-lg-4 col-sm-12">
     <form action="LoginForm" method="post">
      <h2 class="text-center text-success">Login</h2>
      <%
        if(session.getAttribute("unknownUser")!=null){

      %>
       <p class="text-danger"><%=session.getAttribute("unknownUser") %></p>
      <% }%>
      <div class="form-group">
       <label for="username" class="">User Name</label>
       <input type="text" id="username" name="username" class="form-control" placeholder="User name">
      </div>

      <div class="form-group">
       <label for="password" class="">password</label>
       <input id="password" name="password" type="password" class="form-control" placeholder="Password">
      </div>

      <div class="form-group">
       <input type="submit" value="Login" class="form-control btn btn-primary">
      </div>
      <div class="form-group">
        <p class="text-right">I'm new for child care <a href="signup.jsp" class="text-success">Create new Account</a></p>
      </div>
     </form>
    </div>
   </div>
  </div>
<%@include file="footer.jsp"%>
