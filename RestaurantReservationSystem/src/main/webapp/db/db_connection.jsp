<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Database SQL</title>
</head>
<body>
<!-- µ¥ÀÌÅÍº£ÀÌ½º ¿¬°á -->
	<sql:setDataSource var = "dataSource" url = "jdbc:mysql://localhost:3306/RestaurantDB"
		driver = "com.mysql.cj.jdbc.Driver" user = "root" password = "비밀번호" />
</body>
</html>
