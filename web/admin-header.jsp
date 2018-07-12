<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<head>
    <%

        ArrayList<User> data = (ArrayList) session.getAttribute("auth");
    %>
    <title><%=data.get(0).getFullName() %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/css/admin-css.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/css/cards.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/css/tabs.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/children/resources/css/date-picker.css">
    

</head>
