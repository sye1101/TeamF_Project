<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="./resources/css/reservationCancel.css">
<title>레스토랑 예약 취소</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String reservationId = request.getParameter("reservationId");	
%>
	<div id="page">
    <div class="lb-wrap">
      <div class="lb-text">
        <h2>Reservation: Cancel reservation</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 예약 취소</h3><br><br>
      <h4>온라인 취소 서비스</h4><br>
      <p>예약 조회 페이지 내 예약 조회 버튼을 통해<br>예약 취소를 하실 수 있습니다.</p><br><br><br><br>
      <div class="note">
        <dl>
          <dt><b>&#8251; 예약 취소시 유의 사항</b></dt>
          <dd>&#10003; 취소 시 예약을 되돌릴 수 없습니다.</dd>
          <dd>&#10003; 취소는 예약 취소 페이지 안에서만 가능합니다.</dd>
          <dd>&#10003; 취소 후 재예약시 같은 날짜 및 시간을 예약하기 어려울 수 있습니다.</dd>
        </dl><br><br><br>
        <div id="inquiryButton">
          <button type="button" onClick="location.href='./reservationCancelProcess.jsp?reservationId=<%= reservationId %>'">취소하기</button>
        </div><br><br><br><br><br><br><br><br><br><br><br>
      </div>
    </div>

  </div>
</body>
</html>