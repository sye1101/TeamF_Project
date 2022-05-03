<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<sql:setDataSource var = "dataSource" url = "jdbc:mysql://localhost:3306/RestaurantDB?autoReconnect=true"
		driver = "com.mysql.jdbc.Driver" user = "root" password = "skfvkfl2004!" />
</body>
</html>