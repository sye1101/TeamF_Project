<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>레스토랑 예약 완료</title>

  <link rel="stylesheet" href="./resources/css/retaurant.css">
  <link rel="stylesheet" href="./resources/css/reservationCompleted.css">
</head>

<body>
  <div id="page">
	<%@ include file = "./header.jsp" %>
    <div id="container">
      <h2> 예약 완료 </h2><br>
      <h4> 저희 레스토랑을 예약해 주셔서 감사합니다. </h4><br>
      <hr><br><br>
      <article id="comleteImg">
        <section id="banner">
          <img src="./resources/imgs/thankyou.png" width="45%" alt="completed img">
        </section>

      </article><br><br>
      <div id="inquiryButton">
        <button type="button" onClick="location.href='#'">조회하기</button>
        <button type="button" onClick="location.href='./restaurant.jsp'">홈으로 가기</button>
      </div><br><br>
    </div>
  </div>
</body>

</html>