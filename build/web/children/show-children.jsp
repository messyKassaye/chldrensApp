
<%@page import="ORM.Users"%>
<%@page import="ORM.Childrens"%>
<%@page import="java.sql.Connection"%>
<%@page import="models.Children"%>
<html>
    <%@include file="../admin-header.jsp" %>
    <body>
        <div id="throbber" style="display:none; min-height:120px;"></div>
        <div id="noty-holder"></div>
        <div id="wrapper">
            <%@include file="../sidenav.jsp" %>
            <div id="page-wrapper" style="margin-top: 80px;">
                <%                    Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                    Childrens childrens = new Childrens(connection);
                    String req = (String) request.getParameter("req");
                    String message = "";
                    if (req.equals("male") || req.equals("female")) {
                        message = "List of " + req + " Children";
                    } else if (req.equals("school-yes")) {
                        message = "List of children at School";
                    } else if (req.equals("family")) {
                        message = "List of childrens lives with family";
                    } else if (req.equals("need-sponsor")) {
                        message = "List of Children who mostly needs Sponsor";
                    }
                    ArrayList<Children> childData = childrens.showByQuery(req);
                %>

                <div class="container">
                    <h3 class="text-center text-info"><%=message%></h3>
                    <div class="row">
                        <div class="tabbable-panel pull-left">

                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#about-us" data-toggle="tab">
                                            Show in profile 
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#address" data-toggle="tab">
                                            Show In Table
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="about-us">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-12 col-sm-12">
                                                <form>
                                                    <input class="form-control search-child" type="text" placeholder="Search....." name="search" id="search">
                                                </form>
                                            </div>
                                        </div>
                                        <%                            for (int i = 0; i < childData.size(); i++) {
                                        %>
                                        <%
                                            if (i % 4 == 0) {
                                                out.print("<br>");
                                            } else {
                                        %>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="min-height:300px;margin-bottom: 15px;">
                                            <div class="card bg-light">
                                                <a href="details?id=<%=childData.get(i).getId()%>" ><img class="card-img-top" src="<%=childData.get(i).getProfile_pic()%>"></a>
                                                <div class="card-body">
                                                    <h3 class="card-title"><%=childData.get(i).getFirstName() + " " + childData.get(i).getLastName()%></h3>
                                                    <a href="details?id=<%=childData.get(i).getId()%>" class="btn btn-primary text-center">Details</a>
                                                </div>
                                            </div>

                                        </div>
                                        <%}%>
                                        <%}%>
                                    </div>

                                    <div class="tab-pane" id="address">
                                        <div class="container" style="padding: 0px;margin-top: 0px;">
                                            <div class="card bg-light">
                                                <div class="card-header">

                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6 col-sm-12">
                                                            <div class="input-group">
                                                                <div class="input-group-btn search-panel">
                                                                    <button type="button" class="btn btn-default dropdown-toggle" id="filter" data-toggle="dropdown">
                                                                        <span id="search_concept">Filter by</span> <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu" role="menu">
                                                                        <li><a href="#">Age</a></li>
                                                                        <li><a href="#">Registration date</a></li>
                                                                        <li><a href="#">Gender</a></li>
                                                                        <li><a href="#">family income </a></li>
                                                                    </ul>
                                                                </div>
                                                                <input type="hidden" name="search_param" value="all" id="search_param">         
                                                                <input type="text" class="form-control search" name="x" placeholder="Search term...">
                                                                <span class="input-group-btn">
                                                                    <button class="btn btn-primary search-btn" type="button"><span class="glyphicon glyphicon-search" style="padding-top: 5px;"></span></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6 col-sm-12">
                                                            <p class="text-info search-hint"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <table id="mytable" class="table table-bordred table-striped table-hover">

                                                        <thead>

                                                        <th>id</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Gender</th>
                                                        <th>Age</th>
                                                        <th>Lives With</th>
                                                        <th style="text-align: center">Action</th>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                for (int i = 0; i < childData.size(); i++) {

                                                            %>

                                                            <tr>
                                                                <td><%=childData.get(i).getId()%></td>
                                                                <td><%=childData.get(i).getFirstName()%></td>
                                                                <td><%=childData.get(i).getLastName()%></td>
                                                                <td><%=childData.get(i).getGender()%></td>
                                                                <td><%=childData.get(i).getAge()%></td>
                                                                <td><%=childData.get(i).getLivesWith()%></td>
                                                                <td class="text-center">
                                                                    <a class='btn btn-info btn-xs' href="#">
                                                                        <span class="glyphicon glyphicon-edit"></span> Edit
                                                                    </a> 
                                                                    <a href="#" class="btn btn-danger btn-xs">
                                                                        <span class="glyphicon glyphicon-remove"></span> Delete
                                                                    </a>
                                                                    <a href="details?id=<%=childData.get(i).getId()%>" class="btn btn-success btn-xs">
                                                                        <span class="glyphicon glyphicon-adjust"></span> Details
                                                                    </a>
                                                                </td>
                                                            </tr>

                                                            <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include file="../scripts.jsp" %>
        <script >
            $(function () {
                $('.searchbox-input').change(function () {
                    $('.card').show();
                    var filter = $(this).val(); // get the value of the input, which we filter on
                    $('.container').find(".card-title:not(:contains(" + filter + "))").parent().css('display', 'none');
                });
                $('.search-panel .dropdown-menu').find('a').click(function (e) {
                    e.preventDefault();
                    var param = $(this).attr("href").replace("#", "");
                    var concept = $(this).text();
                    $('.search-panel span#search_concept').text(concept);
                    $('.input-group #search_param').val(param);
                    switch (concept) {
                        case "Age":
                            $('.search-hint').text("Find childrens by age using 2 types of search. by specifying age like 12. and using in between like 10 - 20");
                            break;
                        case "Registration date":
                            $('.search-hint').text("Find childrens by registration date by  specifying registartion date like 12/10/2010 or using year like 2010 and in between years like 2010 - 2012");
                            break;
                        case "Gender":
                            $('.search-hint').text("Find childrens by gender ");
                            break;
                    }
                });
                $('.search-btn').on('click', function (e) {
                    e.preventDefault();
                    var types = $('#search_concept').text();
                    var values = $('.search').val();
                    $.get("SearchChildrenServlet", {type: types, value: values, req: '<%=req%>'}, function (data) {
                        if (data !== null) {
                            $('#mytable tbody tr').remove();
                            $.each(JSON.parse(data), function (k, v) {

                                $('#mytable > tbody').append("<tr><td>" + v.id + "</td><td>" + v.firstName + "</td><td>" +
                                        v.lastName + "</td><td>" + v.gender + "</td><td>" + v.age + "</td><td>" + v.livesWith + "</td>\n\
                        <td><a class='btn btn-info btn-xs'><span class='glyphicon glyphicon-edit'></span>Edit</a><a class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span>Delete</a>\n\
                            <a href='details?id=" + v.id + "' class='btn btn-success btn-xs'><span class='glyphicon glyphicon-adjust'></span>Details<a></td></tr>");
                            });
                        }
                    });
                });

                $('.search').keyup(function (e) {
                    if (e.keyCode === 13) {
                        e.preventDefault();
                        var types = $('#search_concept').text();
                        var values = $('.search').val();
                        $.get("SearchChildrenServlet", {type: types, value: values, req: '<%=req%>'}, function (data) {
                            if (data !== null) {
                                $('#mytable tbody tr').remove();
                                $.each(JSON.parse(data), function (k, v) {

                                    $('#mytable > tbody').append("<tr><td>" + v.id + "</td><td>" + v.firstName + "</td><td>" +
                                            v.lastName + "</td><td>" + v.gender + "</td><td>" + v.age + "</td><td>" + v.livesWith + "</td>\n\
                        <td><a class='btn btn-info btn-xs'><span class='glyphicon glyphicon-edit'></span>Edit</a><a class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span>Delete</a>\n\
                            <a href='details?id=" + v.id + "' class='btn btn-success btn-xs'><span class='glyphicon glyphicon-adjust'></span>Details<a></td></tr>");
                                });
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>