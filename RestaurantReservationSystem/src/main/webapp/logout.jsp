<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
  <%
  	session.invalidate();
    response.sendRedirect("restaurant.jsp");
  %>
</body>
</html>