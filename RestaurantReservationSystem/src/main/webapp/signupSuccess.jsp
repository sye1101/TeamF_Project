<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file = "./db/db_connection.jsp" %>
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
  <div id="page">
    <header>
      <div id="logo">
        <a href="#" onclick="location.href='./restaurant.jsp'">
          <img src="./resources/imgs/logo.png" width="50px" alt="Logo">
        </a>
      </div>
      <div id="top_menu">
        <a href="./login.jsp">LOGIN</a> |
        <a href="./signup.jsp">JOIN</a> |
        <a href="#">MANAGER</a>
      </div>
      <nav>
        <ul>
          <li><a href="#" onclick="location.href='./reservation.jsp'">RESERVATION</a></li>
          <li><a href="#">INQUIRY</a></li>
        </ul>
      </nav>
    </header>
    <article id="main">
      <div id="wrap">
            <h1>회원 가입이 완료되었습니다.</h1><br>
            <h3>저희 레스토랑의 회원으로 가입해 주셔서 감사합니다.</h3><br>
            <table>
              <thead>
                <tr>
                  <th><button id="btn" onclick="location.href='./login.jsp'">로그인</button></th>
                </tr>
              </thead>
            </table>
    </div>
    </article>

  </div>
</body>
</html>