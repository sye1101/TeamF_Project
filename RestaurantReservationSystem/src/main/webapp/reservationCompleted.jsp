<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>레스토랑 예약 완료</title>

  <link rel="stylesheet" href="./resources/css/restaurant.css">
  <link rel="stylesheet" href="./resources/css/reservationCompleted.css">
</head>

<body>
  <div id="page">
	<%@ include file = "./header.jsp" %>
  <div class="lb-wrap">
      <div class="lb-text">
        <h2>Reservation: Reservation complete</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 예약 완료</h3><br>
      <p>TeamF's Restaurant를 이용해 주셔서 감사합니다.<br>고객님을 뵙기를 기대합니다.</p><br><br>
      <div id="inquiryButton">
        <button type="button" onClick="location.href='./inquiryReservation.jsp'">조회하기</button>
      </div><br><br><br><br><br><br><br><br><br><br><br>
    </div>
  </div>
</body>

</html>