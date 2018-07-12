
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
                    <div class="row">
                        <h3 class="text-center text-info"><%=message%></h3>
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <form>
                                <input class="form-control search-child" type="text" placeholder="Search....." name="search" id="search">
                            </form>
                        </div>
                    </div>
                    <div class="row">

                        <%
                            for (int i = 0; i < childData.size(); i++) {
                        %>
                        <div class="col-md-4 col-lg-4 col-sm-12" style="min-height:300px;margin-bottom: 15px;">
                            <div class="card bg-light">
                                <a href="details?id=<%=childData.get(i).getId()%>" ><img class="card-img-top" src="<%=childData.get(i).getProfile_pic()%>"></a>
                                <div class="card-body">
                                    <h3 class="card-title"><%=childData.get(i).getFirstName() + " " + childData.get(i).getLastName()%></h3>
                                    <a href="details?id=<%=childData.get(i).getId()%>" class="btn btn-primary text-center">Details</a>
                                </div>
                            </div>

                        </div>

                        <%}%>
                        <div class="clearfix"></div>
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
            });
        </script>
    </body>
</html>