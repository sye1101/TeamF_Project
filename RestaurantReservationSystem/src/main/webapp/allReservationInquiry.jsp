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
     <link rel="stylesheet" href="./resources/css/AllInquiry.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<title>레스토랑 예약 전체 조회</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
	PrintWriter writer = response.getWriter();
	
	// 이름, 연락처
	String name = (request.getParameter("name") != null) ? request.getParameter("name") : "";
	String phone_number = (request.getParameter("phone_number") != null) ?  request.getParameter("phone_number") : "";
	
	if (name.trim().equals("") || phone_number.trim().equals("")) {
			writer.println("<script>");
			writer.println("alert('이름 혹은 연락처가 입력되지 않았습니다. 다시 입력해 주세요.')");
			writer.println("location.href='./inquiryReservation.jsp'");
			writer.println("</script>");
	}
	
	reservationDAO res = new reservationDAO();
	ArrayList<ArrayList<String>> allReservationData = res.getAllMyReservations(name, phone_number);
	
	if (allReservationData.size() == 0) {
		writer.println("<script>");
		writer.println("alert('해당 정보로 예약된 내역이 존재하지 않습니다.')");
		writer.println("location.href='./inquiryReservation.jsp'");
		writer.println("</script>");
	}
  %>
	<div id="page">
    <div class="lb-wrap">
      <div class="lb-text">
        <h2>Reservation inquiry: All reservations</h2>
      </div>
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>레스토랑 전체 예약 조회</h3><br>
      <p>TeamF's Restaurant를 이용해 주셔서 감사합니다.<br>전체 예약 내역을 확인하실 수 있습니다.</p><br><br>
           <div class="table">
        <table>
          <tr>
            <td>예약 번호</td>
            <td>예약 날짜</td>
            <td>상세 보기</td>
            <td>예약 취소</td>
          </tr>
          <% 
             for (int i = 0; i < allReservationData.size(); i++) { 
          %>
           <tr>
            <td> <%= allReservationData.get(i).get(0) %></td>
            <td> <%= allReservationData.get(i).get(1)  %></td>
            <td><button type="submit" onclick="location.href = './oneReservationInquiry.jsp?reservationId=<%= allReservationData.get(i).get(0) %>'">상세보기</button></td>
            <td><button type="submit" onclick="location.href = './reservationCancel.jsp?reservationId=<%= allReservationData.get(i).get(0)%>'">예약취소</button></td>
          </tr>
          <%
             }
          %>
        </table>
      </div>
    </div><br><br><br><br><br><br><br><br><br><br><br>
  </div>
</body>
</html>