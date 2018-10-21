<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Marcin Boniecki
  Date: 20.10.2018
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello, JSTL</title>
</head>
<body>
<h1>HELLO JSTL</h1>

<%
    String[] cities = {"Gdańsk", "Gdynia", "Sopot"};
    pageContext.setAttribute("cities", cities);
%>

</body>
</html>
