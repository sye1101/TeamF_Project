<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./resources/css/nonLoginInquiry.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<title>레스토랑 예약 조회</title>
</head>
<body>
  <div id="page">
   <div class="lb-wrap">
      <div class="lb-text">
        <h2>Reservation inquiry: verification</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 예약 조회</h3><br><br>
      <h4>온라인 조회 서비스</h4><br>
      <p>예약 조회 페이지 내 온라인 조회를 통해<br>예약 내역을 확인하실 수 있습니다</p>
      <div class="a">
      	<form class="login_form" action = "./allReservationInquiry.jsp">
        <input name="name" type="text" placeholder=" 이름"><br><br><br>
        <input name="phone_number" type="text" placeholder=" 휴대폰 번호"><br><br><br>
        <div id="moveButton">
          <button type="submit">조회하기</button><br><br><br><br><br><br>
        </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>