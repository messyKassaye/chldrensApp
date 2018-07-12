<%-- 
    Document   : add-what-we-do
    Created on : Jul 8, 2018, 10:13:47 PM
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
                    <div class="container-fluid">
                        <h2 class="text-info text-center">Add What you do</h2>
                        <div class="row">
                            <div class="col-md-2 col-md-10 col-lg-10 col-sm-12">
                                <form action="AddWhatWeDoServlet" method="post" enctype="multipart/form-data">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="title">Title:</label>
                                                    <input class="form-control" id="title" name="title" placeholder="Title">
                                                </div>

                                                <div class="form-group">
                                                    <label for="subTitle">Sub Title:</label>
                                                    <input class="form-control" id="subTitle" name="subTitle" placeholder="Title">
                                                </div>

                                                <div class="form-group">
                                                    <label for="cover">Choose Cover photo:</label>
                                                    <div class="input-group input-file" name="Fichier1">
                                                        <input id="cover" type="text" class="form-control" name="file" placeholder='Choose a file...' />			
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default btn-choose" type="button">Choose</button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <img class="img-rounded">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ckeditor">Description:</label>
                                            <textarea class="form-control ckeditor" id="ckeditor" name="editor">
                                            
                                            </textarea>
                                        </div>
                                        <div class="form-group">
                                            <input class="btn btn-primary form-control" value="submit" type="submit">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../scripts.jsp" %>
        <script>
            $(document).ready(function () {
                $('input[type=file]').change(function () {
                    console.log(this.files[0].mozFullPath);
                });
            })
        </script>

    </body>
</html>
