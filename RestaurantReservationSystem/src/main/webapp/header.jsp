<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ include file = "./db/db_connection.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
   <%
	String sessionId = (String) session.getAttribute("sessionId"); // 현재 저장된 세션을 얻어옴
	%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./resources/css/retaurant.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap/min.css">
</head>

<body>
  <div id="page">
    <header>
      <div id="logo">
        <a href="#" onclick="location.href='./restaurant.jsp'">
          <img src="./resources/imgs/logo.png" width="50px" alt="Logo">
        </a>
      </div>
      <div id="top_menu">
      <c:choose>
        <c:when test="${empty sessionId}">
      		 <a href="./login.jsp">LOGIN</a> |
             <a href="./signup.jsp">JOIN</a> |
             <a href="#">MANAGER</a>
        </c:when>
        <c:otherwise>
          <p> <%= sessionId %>님 
         <a href = "./logout.jsp">  로그아웃</a>
        </c:otherwise>
       </c:choose>
      </div>
        <nav>
          <ul>
          <li><a href="#" onclick="location.href='./reservation.jsp'">RESERVATION</a></li>
          <li><a href="#">INQUIRY</a></li>
        </ul>
      </nav>
    </header>
  </div>
</body>
</html>