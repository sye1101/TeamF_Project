<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dao.reservationDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <link rel="stylesheet" href="./resources/css/inquiry.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<title>레스토랑 예약 조회</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	PrintWriter writer = response.getWriter();

	// 예약 번호
	String reservationId = request.getParameter("reservationId");
	
	reservationDAO res = new reservationDAO();
	
	ArrayList<String> reservationData = res.getOneReservation(Integer.parseInt(reservationId));
	
%>
  <div id="page">
    <div class="lb-wrap">
      <div class="lb-text">
        <h2>Reservation inquiry: Reservation</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 예약 조회</h3><br>
      <p>TeamF's Restaurant를 이용해 주셔서 감사합니다.<br>세부적인 예약 내역을 확인하실 수 있습니다.</p><br><br>
      <table id="inquiryTable">
        <tr>
          <th>예약자</th>
          <td> <%= reservationData.get(1) %> </td>
        </tr>
        <tr>
          <th>연락처</th>
          <td> <%= reservationData.get(2) %> </td>
        </tr>
        <tr>
          <th>인원</th>
          <td> <%= reservationData.get(3) %>명 </td>
        </tr>
        <tr>
          <th>예약날짜</th>
          <td> <%= reservationData.get(4) %> </td>
        </tr>
        <tr>
          <th>예약시간</th>
          <td> <%= reservationData.get(5) %> </td>
        </tr>
        <tr>
          <th>테이블</th>
          <td> <%= reservationData.get(6) %> </td>
        </tr>
        <tr>
          <th>추가 요구사항</th>
          <td> <%= reservationData.get(7) %> </td>
        </tr>
      </table><br><br><br>
      <div id="allInquiryButton">
        <button type="submit" onclick="location.href='./allReservationInquiry.jsp?name=<%= reservationData.get(1) %>&phone_number=<%= reservationData.get(2) %>'">전체예약조회</button>
      </div>
      <div id="cancelButton">
        <button type="button" onclick="location.href='./reservationCancel.jsp?reservationId=<%= reservationData.get(0) %>'">예약취소</button>
      </div>
    </div><br><br><br><br><br><br><br><br><br><br><br>

  </div>
</body>

</html>
