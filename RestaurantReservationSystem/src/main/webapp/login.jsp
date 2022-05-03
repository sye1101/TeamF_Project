<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인</title>

  <link rel="stylesheet" href="./resources/css/retaurant.css">
  <link rel="stylesheet" href="./resources/css/login.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap/min.css">
</head>

<body>
<%@ include file = "./header.jsp" %>
  <div id="page">
    <article id="main">
      <div id="wrap">
        <form class="login_form" action = "./loginProcess.jsp">
            <h1>로그인</h1><br>
            <input name="id_login" type="text" placeholder="아이디를 입력하세요"><br>
            <input name="password_login" type="text" placeholder="비밀번호를 입력하세요"><br>
            <table>
              <thead>
                <tr>
                  <th><input type="submit" id="btn" value = "로그인"></th>
                  <th><input type="button" id="btn" value = "회원가입" onClick = "location.href='./signup.jsp'"></th>
                </tr>
              </thead>
            </table>
        </form>
    </div>
    </article>
  </div>
</body>
</html>