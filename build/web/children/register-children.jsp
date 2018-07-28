
<%@page import="models.Children"%>
<%@page import="ORM.Childrens"%>
<%@page import="java.sql.Connection"%>
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
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-lg-offset-3 col-md-6 col-lg-6 col-sm-12">
                                            <h2 class="text-center text-info">Child Registration</h2>
                                            <%                                                Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
                                                Childrens childrenData = new Childrens(connection);
                                                ArrayList<Children> children = childrenData.index();

                                                if (session.getAttribute("message") != null) {
                                            %>

                                            <h3 class="text-center text-success"><%=session.getAttribute("message")%></h3>
                                            <% }%>
                                            <form action="RegisterChild" method="post" enctype = "multipart/form-data">
                                                <div class="form-group">
                                                    <label for="firstName">Child first name</label>
                                                    <input class="form-control" name="childFirstName" placeholder="Child First name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastName">Child last name</label>
                                                    <input class="form-control" name="childLastName" placeholder="Child First name">
                                                </div>

                                                <div class="form-group">
                                                    <label for="country">Country:</label>
                                                    <select class="form-control" id="country" name="country">
                                                        <option>Ethiopia</option>
                                                        <option>Kenya</option>
                                                        <option>Sudan</option>
                                                        <option>Egypt</option>
                                                        <option>Eritrea</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="gender">Gender:</label>
                                                    <select class="form-control" id="gender" name="gender">
                                                        <option>Gender</option>
                                                        <option>female</option>
                                                        <option>male</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="birthDate">Birth date</label>
                                                    <div class='input-group date' id='datetimepicker1'>
                                                        <input type='text' class="form-control" name="birthDate" id="birthDate" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="livesWith">Lives With</label>
                                                    <select class="form-control" id="livesWith" name="livesWith">
                                                        <option>Family</option>
                                                        <option>Aunt</option>
                                                        <option>Grand Father</option>
                                                        <option>brother</option>
                                                        <option>Sister</option>
                                                        <option>No one</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="speaks">Speaks</label>
                                                    <select class="form-control" id="speaks" name="speaks">
                                                        <option>Amharic</option>
                                                        <option>Oromiffa</option>
                                                        <option>Tigrigna</option>
                                                        <option>Somaligna</option>
                                                        <option>Guragegna</option>
                                                        <option>Unknown yet</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="speaks">Child photo</label>
                                                    <input type="file" name="photo" id="photo">
                                                </div>

                                                <div class="form-group">
                                                    <input type="submit"value="Register" class="btn btn-primary form-control">
                                                </div>

                                            </form>
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
    </body>
</html>
