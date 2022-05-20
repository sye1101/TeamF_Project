<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link rel="stylesheet" href="./resources/css/managerLogin.css">
  <title>로그인</title>
</head>
<body>
  <div class="lb-wrap">
      <div class="lb-text">
        <h2>teamF's Restaurant: Manager login</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 관리자 로그인</h3><br>
      <article id="main">
        <div id="wrap">
          <form class="login_form" action = "./managerLoginProcess.jsp">
          <input name="managerID" type="text" placeholder=" 아이디를 입력하세요"><br><br><br>
          <input name="managerPassword" type="password" placeholder=" 비밀번호를 입력하세요"><br><br><br>
          <button type="submit" id="loginButton">로그인</button>
          </form>
        </div>
      </article><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
  </div>
</body>
</html>