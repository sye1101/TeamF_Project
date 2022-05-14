<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원 가입</title>
  <link rel="stylesheet" href="./resources/css/restaurant.css">
   <link rel = "stylesheet" href="./resources/css/signup.css">
</head>
<body>
<%@ include file = "./header.jsp" %>
  <div id="page">
    <article id="main">
   <div id="wrap">
        <form method="post" class="login_form" action = "./signupProcess.jsp">
            <h1>회원가입</h1><br>
            <input name="id" type="text" placeholder="아이디"><br><br>
            <input name="name" type="text" placeholder="이름"><br><br>
            <input name="phone_number" type="text" placeholder="휴대폰 번호"><br><br>
            <input name="password" type="password" placeholder="비밀번호"><br><br>
            <input name="password_check" type="password" placeholder="비밀번호 재입력"><br><br>
            <button id="btn2">가입하기</button>
        </form>
    </div>
    </article>
  </div>
</body>
</html>