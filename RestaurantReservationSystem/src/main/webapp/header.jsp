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
   <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gwendolyn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./resources/css/restaurant.css">
</head>

<body>
  <div id="page">
   <header>
      <div id="myNav" class="overlay">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="overlay-content">
          <a href="#">Story</a>
          <a href="#">Menu</a>
          <a href="#" onclick="location.href='./reservation.jsp'">Reservation</a>
          <a href="#" onclick="location.href='./inquiryReservation.jsp'">Inquiry</a>
        </div>
      </div>
      <span id="menuBar" onclick="openNav()">&#9776;</span>
      <script>
        function openNav() {
          document.getElementById("myNav").style.width = "100%";
        }

        function closeNav() {
          document.getElementById("myNav").style.width = "0%";
        }
      </script>
      <div id="logo">
        <a href="./restaurant.jsp">
          <h1>teamF's restaurant</h1>
        </a>
      </div>
      <div id="top_menu">
        <c:choose>
           <c:when test="${empty sessionId}">
        <a href="./login.jsp">로그인</a>
        <a href="./signup.jsp">회원가입</a>
        <a href="./managerLogin.jsp">관리자</a>
           </c:when>
        <c:otherwise>
           <% 
        	if (session.getAttribute("sessionId") != null && ((String)session.getAttribute("sessionId")).equals("teamF_manager")) {
    		 %>
    		<p> <%= sessionId %>님 
    	    <a href="./managerPage.jsp">관리자</a>
         	<a href = "./logout.jsp">  로그아웃</a>
         	<%
        	  } else {
         	%>
         	 <p> <%= sessionId %>님 
         	 <a href = "./logout.jsp">  로그아웃</a>
         	 <%
        	  }
         	 %>
        </c:otherwise>
       </c:choose>
      </div>
    </header>
  </div>
</body>
</html>