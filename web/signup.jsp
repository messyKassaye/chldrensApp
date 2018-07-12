<%@include file="header.jsp"%>
<%@include file="navbar.jsp"%>

  <div class="container" style="margin-top: 80px;">
    <div class="row">
      <div class="col-md-offset-4 col-md-4 col-lg-4 col-sm-12">
        <form action="" class="center-block">
          <h3 class=" text-center">Sign up and <span class="text-success">Stay connected</span></h3>
          <div class="form-group">
            <label for="first_name">First name</label>
            <input type="text" id="first_name" name="first_name" placeholder="First name" class="form-control">
          </div>
          <div class="form-group">
            <label for="lastName">Last name</label>
            <input type="text" id="lastName" name="last_name" placeholder="Last name" class="form-control">
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Email" class="form-control">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Password" class="form-control">
          </div>
          <div class="form-group">
            <label for="repassword">Confirm Password</label>
            <input type="password" id="repassword" name="repassword" placeholder="Confirm your password" class="form-control">
          </div>

          <div class="form-group">
            <input type="submit" class="form-control btn btn-primary" value="Sign up">
          </div>
          <div class="form-group">
            <p class="text-right">I'm already a member <a href="login.jsp" class="text-success">Login</a></p>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@include file="footer.jsp"%>
