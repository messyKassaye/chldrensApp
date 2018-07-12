<%@page import="models.Testimony"%>
<%@page import="models.ChildrenAddress"%>
<%@page import="models.Children"%>
<%@page import="models.WhatWeDo"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>



<!----- We app hero starts here ------>
<div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">
    <!-- Overlay -->
    <div class="overlay"></div>

    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#bs-carousel" data-slide-to="1"></li>
        <li data-target="#bs-carousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item slides active">
            <div class="slide-1" style="background-image: url(http://localhost:8080/children/resources/images/kenay.jpg);"></div>
            <div class="hero">
                <hgroup>
                    <h1>Create Hope</h1>
                    <h3>for children's living in poverty</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">Sign up</button>
            </div>
        </div>
        <div class="item slides">
            <div class="slide-2" style="background-image: url(http://localhost:8080/children/resources/images/all.jpg);"></div>
            <div class="hero">
                <hgroup>
                    <h1>Gift for children's</h1>
                    <h3>Give gift for and make them happy</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">Give</button>
            </div>
        </div>
        <div class="item slides">
            <div class="slide-3" style="background-image: url(http://localhost:8080/children/resources/images/circle-game.jpg);"></div>
            <div class="hero">
                <hgroup>
                    <h1>play with them</h1>
                    <h3>Come and play with children's today</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">Sign up & stay connected</button>
            </div>
        </div>
    </div>
</div>
<!----- end of the hero shot   ----->
<!---------------------------------->
<div class="container" style="margin-bottom: 20px;">
    <!------ objective of the web started   ------>
    <h2 class="text-center" style="margin-bottom: 20px;">Learn more about our work: <a href="#" class="text-success">What we do</a></h2>
    <div class="row">
        <%
            ArrayList<WhatWeDo> what = (ArrayList) session.getAttribute("whatWedDo");
            if (what.size() > 0) {
                for (int i = 0; i < what.size(); i++) {
        %>

        <div class="col-md-4 col-g-4 col-sm-12">
            <div class="panel panel-primary my-panel">
                <div class="panel-heading">
                    <h4 class="title"><a href="what-we-do.jsp?id=<%=what.get(i).getId()%>" style="color: white;"><%= what.get(i).getTitle()%>
                        </a> </h4>
                </div>
                <div class="bg-overlay-1">
                    <a href="what-we-do.jsp?id=<%=what.get(i).getId()%>"><img src="<%=what.get(i).getCover()%>" style="width:100%;height: 100%;"></a>
                </div>
            </div>
        </div>

        <% }%>
        <%} %>

    </div>
</div>
<!----- end of web app objective ----->
<!------------------------------------>

<!---- video and featured child started------>
<div class="container">
    <div class="row">
        <h2 class="text-center" style="margin-bottom: 20px;">How child Sponsorship  <span class="text-success">works</span></h2>

        <div class="col-md-6 col-lg-6 col-sm-12">
            <div class="embed-responsive embed-responsive-16by9">
                <video width="320" height="240" controls poster="resources/images/all.jpg">
                    <source src="resources/videos/video.mkv" type="video/mp4">
                </video>                    </div>
        </div>

        <div class="col-md-6 col-lg-6 col-sm-12" style="background-color: #fff;
             border: 1px solid #e3e3e3;
             padding: 20px;
             border-radius: 5px;">
            <div class="row">
                <%
                    Children child = (Children) session.getAttribute("featuredChild");
                    ArrayList<ChildrenAddress> address = (ArrayList) session.getAttribute("featuredChildAddress");
                    if (child != null) {

                %>
                <div class="col-md-3 featured-child">
                    <a href="Sponsors?id=<%=child.getId()%>" >
                        <img class="img-rounded" src="<%=child.getProfile_pic()%>" alt="featured child" width="200" height="250">
                    </a>
                </div>
                <div class="col-md-9 text-center pull-right">

                    <span style="font-size: 12pt;margin-bottom: 10px;">Change the Story for</span><br>
                    <span class="text-success" style="font-size: 20pt;"><%=child.getFirstName() + "  " + child.getLastName()%></span><br>
                    <span class="text-center"><%=child.getAge()%> Years old</span>
                    <span                    style="border: 0;
                                             margin-bottom: 20px;
                                             height: 10px;
                                             background: #333;
                                             background-image: linear-gradient(to right,rgba(0,0,0,0),rgba(0,0,0,0.75),rgba(0,0,0,0));">

                    </span><br>
                    <%
                        if (address.size() > 0) {
                    %>
                    <p><span><%=address.get(0).getCountry()%> ,<%=address.get(0).getCity()%></span></p>
                    <%} %>
                    <%
                        if (child.getGender().contains("female")) {

                    %>
                    <a href="Sponsors?id=<%=child.getId()%>" class="btn btn-success" style="margin-top: 20px;">Look inside Her world</a>

                    <%} else {%>
                    <a href="Sponsors?id=<%=child.getId()%>" class="btn btn-success" style="margin-top: 20px;">Look inside His world</a>

                    <%}%>
                </div>

                <%}%>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-9 col-lg-9 col-sm-12">
            <h3>Search to find a special child waiting for a sponsor <span class="text-success">like you!</span></h3>
            <form action="SponsorAchild" class="form-vertical" method="get">
                <div class="form-group">
                    <label for="country">Country:</label>
                    <select class="form-control" id="country" name="country">
                        <option>Ethiopia</option>
                        <option>Kenya</option>
                        <option>Sudan</option>
                        <option>Egypt</option>
                        <option>Ertrea</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select class="form-control" id="gender" name="gender">
                        <option>Any</option>
                        <option>female</option>
                        <option>male</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="age">Age:</label>
                    <select class="form-control" id="age" name="age">
                        <option>Any age</option>
                        <option><12</option>
                        <option>12</option>
                        <option>13</option>
                        <option>15</option>
                        <option>+16</option>
                    </select>
                </div>
                <div class="form-group">
                    <input class="btn btn-success pull-right" type="submit" value="Show Kids">
                </div>
            </form>
        </div>
        <div class="col-md-3 col-lg-3 col-sm-12">

        </div>
    </div>
</div>
<!----- end of video and featured child ----->
<!------------------------------------------->

<!--------- sponsors testimonial ------------->
<div class="container-fluid" style="background-color: #1abc9c;padding: 20px;margin-top: 20px;color: white;margin-bottom: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 column">
                <div class="carousel slide" id="testimonials-rotate">
                    <div class="carousel-inner">
                        <%
                            ArrayList<Testimony> testimony = (ArrayList) session.getAttribute("testimony");
                            for (int i = 0; i < testimony.size(); i++) {

                        %>
                        <%                            if (i == 0) {

                        %>
                        <div class="item active">
                            <div class="col-md-2"><img alt="" src="<%=testimony.get(i).getPicture()%>" class="img-circle img-responsive" style="width: 150px;height: 150px;"/></div>
                            <div class="testimonials col-md-10">

                                <h3>
                                    <%=testimony.get(i).getTestimony()%>
                                    <br><small class="pull-right" style="color: white;font-variant: all-petite-caps;font-size: 20pt;"> - <%=testimony.get(i).getName()%></small>
                                </h3>

                            </div>

                            <div class="clearfix"></div>
                        </div>
                        <%} else {%>
                        <div class="item">
                            <div class="col-md-2"><img alt="" src="<%=testimony.get(i).getPicture()%>" class="img-circle img-responsive" style="width: 150px;height: 150px;"/></div>
                            <div class="testimonials col-md-10">

                                <h3>
                                    <%=testimony.get(i).getTestimony()%>
                                    <br><small class="pull-right" style="color: white;font-variant: all-petite-caps;font-size: 20pt;"> - <%=testimony.get(i).getName()%></small>
                                </h3>

                            </div>

                            <div class="clearfix"></div>
                        </div>
                        <%}%>
                        <%}%>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!---end of sponsors testimonial ------------->
</div>

<!-------- what we do, how u help ---------------->
<div class="container">
    <div class="col-md-4 col-lg-4 col-sm-12">
        <img src="resources/images/who-we-are-2.jpg" alt="">
        <div style="padding: 10px;">
            <h2>Who we are</h2>
            <p style="line-height: 2.5em;">We're passionate world-changers who believe our kids deserve a chance.</p>
            <span id="about" class="text-success text-capitalize" style="font-size: 20px;cursor:pointer;" data-toggle="modal" data-target="#about-modal" >About Us</span>
        </div>
    </div>

    <div class="col-md-4 col-lg-4 col-sm-12">
        <img src="resources/images/what-we-do.jpg" alt="">
        <div style="padding: 10px;">
            <h2>What we do</h2>
            <p style="line-height: 2.5em;">We're a charity that takes a bold, effective approach to solving poverty.</p>
            <span id="findmore" class="text-success text-capitalize" style="font-size: 20px;cursor: pointer" data-toggle="modal" data-target="#findmore-modal">Find out more</span>
        </div>
    </div>

    <div class="col-md-4 col-lg-4 col-sm-12">
        <img src="resources/images/how-you-help-2.jpg" alt="">
        <div style="padding: 10px;">
            <h2>How you help</h2>
            <p style="line-height: 2.5em;">Your support helps break the cycle of poverty, impacting generations.</p>
            <a href="" class="text-success text-capitalize" style="font-size: 20px">How you help</a>
        </div>
    </div>
</div>
<!---------     end of help          ------------->

<!--------- gift starts here --------------------->
<div class="container-fluid gift" style="background-image: url(http://localhost:8080/children/resources/images/children.jpg);
     background-repeat: no-repeat;
     margin-top: 40px;
     background-size:100%;
     margin-bottom: 20px;
     background-cover:cover;
     padding: 80px;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-6 col-sm-12" style="background: rgba(255,255,255,.91) none repeat scroll 0 0;

                 color: black;padding: 50px;border-radius: 5px;">
                <h2 class="text-center">Give kids the chance to succeed</h2>
                <p class="text-justify" style="font-weight: normal;
                   font-size: 16px;
                   letter-spacing: .5px;
                   line-height: 1.8;" >
                    A good education is a child's best chance to escape poverty.
                    When you fund an Education Pass for only 200 birr a month, you ensure that every month,
                    four kids can participate in one of Children International's tutoring or computer skills classes.
                </p>
                <div style="position: relative;padding: 20px;margin: 20px;">
                    <h1 class="text-center">200 Birr     /Month</h1>
                </div>
                <button class="btn btn-success btn-lg center-block">Give Education</button>
            </div>
        </div>
    </div>
</div>


<!----------- gift container started here  -------------->
<div class="container">
    <div class="row">
        <div class="col-md-3 col-lg-3 col-sm-12" style="background-color: white;">
            <img src="resources/images/grow.png" alt="" style="width: 100%;">
            <h3 class="text-success" style="margin-top: 20px">Make a difference</h3>
            <hr class="custom-hr" style="border: 0;
                clear:both;
                display:block;
                width: 96%;
                background-color:#3c763d;
                height: 1px;">
            <p class="text-success" style="font-family: AvenirLT-Roman;
               font-size: 16px;
               line-height: 1.5;">
                More than half of all people who live in poverty are kids.
            </p>
            <hr style="border: 0;
                clear:both;
                display:block;
                width: 96%;
                background-color:#3c763d;
                height: 1px;">

        </div>

        <div class="col-md-9 col-lg-9 col-sm-12" style="padding: 20px;">
            <div class="row">
                <div class="col-md-offset-2 col-lg-offset-2 col-md-10 col-lg-10 col-sm-12">
                    <h4 class="text-muted">HOW YOUR GIFT IS INVESTED</h4>
                    <h2>A safe place</h2>
                    <p style="font-family:martellight;
                       font-size: 16px;
                       font-weight: normal;
                       letter-spacing: .5px;
                       line-height: 1.8;
                       margin: 0 0 30px;">
                        70+ community centers where kids get life-changing benefits, like medical care,
                        tutoring, job placement and more.
                    </p>
                    <h2>A caring team</h2>
                    <p style="font-family:martellight;
                       font-size: 16px;
                       font-weight: normal;
                       letter-spacing: .5px;
                       line-height: 1.8;
                       margin: 0 0 30px;"
                       >
                        9,000+ volunteers and local staff in 10 countries who know our kids and their communities.
                    </p>
                    <h2>A path out of poverty</h2>
                    <p style="font-family:martellight;
                       font-size: 16px;
                       font-weight: normal;
                       letter-spacing: .5px;
                       line-height: 1.8;
                       margin: 0 0 30px;"
                       >
                        Programs focused on health, education, employment and empowerment to break the cycle of poverty.
                    </p>

                    <h4 class="text-muted">YOU MIGHT BE THINKING ABOUT ...</h4>
                    <h2>Where do we work?</h2>
                    <p style="font-family:martellight;
                       font-size: 16px;
                       font-weight: normal;
                       letter-spacing: .5px;
                       line-height: 1.8;
                       margin: 0 0 30px;"
                       >
                        In 10 countries around the world. We also have a U.S. program to help kids living in poverty in Arkansas.
                        <a href="" class="text-success text-capitalize" style="font-size: 26px;">  Site map</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--------- end of gift container  --------->


<!------------ boxes started    -------------->
<div class="container" style="margin-top: 20px;">
    <div class="row">
        <div class="col-md-4 col-lg-4 col-sm-12" >
            <div class="col-md-12 col-lg-12 col-sm-12" style="background-color: #901f61;padding:20px 40px; color: white;">
                <h1 style="font-weight: 900;
                    font-size: 48px;
                    text-transform: uppercase;">Give</h1>
                <p style="font-size: 16px;"><strong>One time</strong> or monthly giving</p>
                <p style="font-size: 16px;"><strong>Help</strong> a meaningful cause</p>
                <p style="font-size: 16px;"><strong>Make a difference</strong> in the world</p>
                <button class="btn btn-primary btn-lg text-center" style="text-transform:capitalize;background-color:#901f61 !important; margin-top:40px;border-color: white; ">DONATE TODAY</button>

            </div>
        </div>

        <div class="col-md-4 col-lg-4 col-sm-12" >
            <div class="col-md-12 col-lg-12 col-sm-12" style="background-color: #009976;padding:20px 40px; color: white;">
                <h1 style="font-weight: 900;
                    font-size: 48px;
                    text-transform: uppercase;">sponsor</h1>
                <p style="font-size: 16px;"><strong>Sponsor</strong> a child in need</p>
                <p style="font-size: 16px;"><strong>Make</strong> a connection</p>
                <p style="font-size: 16px;"><strong>Change </strong> a child's life</p>
                <button class="btn btn-primary btn-lg text-center" style="text-transform:capitalize;background-color:#009976 !important; margin-top:40px;border-color: white; ">FIND A CHILD</button>

            </div>
        </div>

        <div class="col-md-4 col-lg-4 col-sm-12" >
            <div class="col-md-12 col-lg-12 col-sm-12" style="background-color:  #d64227;padding:20px 40px; color: white;">
                <h1 style="font-weight: 900;
                    font-size: 48px;
                    text-transform: uppercase;">trust</h1>
                <p style="font-size: 16px;"><strong>who we are</strong> and what we do</p>
                <p style="font-size: 16px;"><strong>Financial</strong> transparency</p>
                <p style="font-size: 16px;"><strong>Find FAQs</strong> and more info</p>
                <button class="btn btn-primary btn-lg text-center" style="text-transform:capitalize;background-color: #d64227!important; margin-top:40px;border-color: white; ">LEARN MORE</button>

            </div>
        </div>
    </div>
</div>
<!------------ end of boxes    --------------->


<!-- modals -->

<!-- about us modal -->
<div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container" style="text-align: center;">
                    <img src="resources/images/about-us.jpg" class="img-responsive img-rounded">
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <h2>Who we are</h2>
                        <ul>
                            <li>
                                <p class="text-justify pa" >
                                    We're a top-rated, international charity organization and a community of passionate world-changers.
                                </p>
                            </li>

                            <li>
                                <p class="text-justify pa" >
                                    With your help, we're working to end global poverty once and for all.
                                </p>
                            </li>
                            <li>
                                <p class="text-justify pa">
                                    We believe every kid deserves a chance.
                                </p>
                            </li>
                            <li>
                                <p class="text-justify pa">
                                    We're focused on impact ? we work in four key areas to help kids break the cycle of poverty: health, education, empowerment and employment.
                                </p>
                            </li>
                        </ul>
                        <p style="font-size: 18px;">
                            <strong>Looking for more?</strong><a href="#" class="text-success">Learn about child Care</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- find more modal -->

<div class="modal fade" id="findmore-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container" style="text-align: center;">
                    <img src="resources/images/solve-poverty-community2.jpg" class="img-responsive img-rounded">
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <h2>Your support helps us focus on 4 key areas</h2>
                        <ul>
                            <li>
                                <p class="text-justify pa" >
                                    <strong>Health:</strong> to help kids develop healthy habits and connect them to services.
                                </p>
                            </li>

                            <li>
                                <p class="text-justify pa" >
                                    <strong>Education:</strong> to help children complete secondary school.
                                </p>
                            </li>
                            <li>
                                <p class="text-justify pa">
                                    <strong> Empowerment:</strong> so kids can build leadership, teamwork and confidence.
                                </p>
                            </li>
                            <li>
                                <p class="text-justify pa">
                                    <strong> Employment:</strong> to help teens develop workplace and technical skills to change their life for good.
                                </p>
                            </li>
                        </ul>
                        <p style="font-size: 18px;">
                            <strong>Looking for more?</strong><a href="#" class="text-success">Learn about child Care</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- end of modal -->

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.carousel').carousel();

    }
    );
</script>
<%@include file="footer.jsp" %>
