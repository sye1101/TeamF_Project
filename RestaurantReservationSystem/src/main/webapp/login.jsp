<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link rel="stylesheet" href="./resources/css/_login.css">
  <title>로그인</title>
</head>
<body>
  <%
	PrintWriter writer = response.getWriter();
	if (session.getAttribute("sessionId") != null) {
		response.sendRedirect("restaurant.jsp");
	} 
	%>
  <div class="lb-wrap">
      <div class="lb-text">
        <h2>teamF's Restaurant: Login</h2>
      </div>
      <div class="img"></div>
    </div>
     <div id="container">
      <br><br><br><br>
      <h3>레스토랑 로그인</h3><br>
      <p>예약 로그인 페이지 내 로그인을 통해<br>다양한 혜택을 받으실 수 있습니다</p>
      <article id="main">
        <div id="wrap">
          <form class="login_form" action = "./loginProcess.jsp">
          <input name="id_login" type="text" placeholder=" 아이디를 입력하세요"><br><br>
          <input name="password_login" type="password" placeholder=" 비밀번호를 입력하세요"><br><br>
          <input type="submit" id="btn" value = "로그인">
          <input type="button" id="btn" value = "회원가입" onClick = "location.href='./signup.jsp'">
          </form>
        </div>
      </article><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
</body>

</html>
