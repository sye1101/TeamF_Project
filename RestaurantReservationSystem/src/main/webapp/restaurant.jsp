<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>레스토랑 예약</title>

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
        <a href="#">LOGIN</a> |
        <a href="#">JOIN</a> |
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
      <section id="banner">
        <img src="./resources/imgs/banner.jpg" width="100%" alt="table img">
      </section>

    </article>

  </div>
</body>
</html>