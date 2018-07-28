<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <%
        ArrayList<User> auth = (ArrayList) session.getAttribute("auth");
    %>
    <div class="col-md-12 col-lg-12 col-sm-12">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="dashboard" style="text-align: center;margin-top: 20px;">
                Dashboard
            </a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li><a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Stats"><i class="fa fa-bar-chart-o"></i>
                </a>
            </li>            
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin User <b class="fa fa-angle-down"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="fa fa-fw fa-user"></i> Edit Profile</a></li>
                    <li><a href="#"><i class="fa fa-fw fa-cog"></i> Change Password</a></li>
                    <li class="divider"></li>
                    <li><a href="Logout"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 40px;text-align: center;">
                <img src="<%=auth.get(0).getProfile() %>" class="img-circle img-responsive center-block" style="width: 80px;height: 80px;margin-top: 20px;margin-bottom: 15px;">
                <a href="#" class="" style="color: white;font-size: 16px;">

                    <%=auth.get(0).getFullName()%>
                </a>
            </div>

            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw fa-child"></i> Children<i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-1" class="collapse submenus">
                    <li><a href="childrenRegistration"><i class="fa fa-plus"></i>   Register Children</a></li>
                    <li><a href="showChildren?req=male"><i class="fa fa-user"></i>   Boy</a></li>
                    <li><a href="showChildren?req=female"><i class="fa fa-female"></i>  Female</a></li>
                    <li><a href="showChildren?req=school-yes"><i class="fa fa-university"></i> at school</a></li>
                    <li><a href="showChildren?req=family"><i class="fa fa-users"></i> with family</a></li>
                    <li><a href="showChildren?req=all"><i class="fa fa-eye"></i> Show all</a></li>

                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-2"><i class="fa fa-users "></i>  User Roles <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-2" class="collapse submenus">
                    <li><a href="AddRoles"><i class="fa fa-database"></i>  Add Roles</a></li>
                    <li><a href="ShowRoles"><i class="fa fa-meanpath"></i>  Show Roles</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-3"><i class="fa fa-users "></i>  Users <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-3" class="collapse submenus">
                    <li><a href="AddUsers"><i class="fa fa-database"></i>  Register Users</a></li>
                    <li><a href="ShowUsers"><i class="fa fa-meanpath"></i>  Show Users</a></li>
                </ul>
            </li>
            
             <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-d"><i class="fa fa-users "></i>  Departments <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-d" class="collapse submenus">
                    <li><a href="AddDepartments"><i class="fa fa-database"></i>  Add departments</a></li>
                    <li><a href="ShowDepartments"><i class="fa fa-meanpath"></i>  Show Departments</a></li>
                </ul>
            </li>
            
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-t"><i class="fa fa-users "></i>  Tasks <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-t" class="collapse submenus">
                    <li><a href="AddTasks"><i class="fa fa-database"></i>  Add task</a></li>
                    <li><a href="ShowTasks"><i class="fa fa-meanpath"></i>  Show tasks</a></li>
                </ul>
            </li>
            
            
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-4"><i class="fa fa-tasks"></i> What we do <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-4" class="collapse submenus">
                    <li><a href="AddWhatWeDo"><i class="fa fa-plus"></i> add our works</a></li>
                    <li><a href="ShowWhatWeDo"><i class="fa fa-eye"></i> Show our works</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-5"><i class="fa fa-handshake-o "></i>   How to help <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-5" class="collapse submenus">
                    <li><a href="#"><i class="fa fa-plus"></i> add new help</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> Show helps</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-6"><i class="fa fa-info "></i>   Get involved <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-6" class="collapse submenus">
                    <li><a href="#"><i class="fa fa-plus"></i> add new idea</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> Show previous</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-7"><i class="fa fa-heart"> </i> Sponsors <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-7" class="collapse submenus">
                    <li><a href="#"><i class="fa fa-plus"></i> add how Sponsorship works</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> Show previous Sponsorship</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-8"><i class="fa fa-gift"> </i> Gifts <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-8" class="collapse submenus">
                    <li><a href="#"><i class="fa fa-plus"></i> add how to give</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> add how gifts are invested</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> Show previous</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-9"><i class="fa fa-gift"> </i> Testimony <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-9" class="collapse submenus">
                    <li><a href="#"><i class="fa fa-plus"></i> add new one</a></li>
                    <li><a href="#"><i class="fa fa-eye"></i> Show previous</a></li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-11"><i class="fa fa-question"> </i> FAQ </a>

            </li>
            <li>
                <a href="#" data-toggle="collapse" data-target="#submenu-12"><i class="fa fa-gear"> </i> Setting </a>

            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>