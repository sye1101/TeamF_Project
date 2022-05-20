<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.adminDAO" %>
<%@ include file = "./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link rel="stylesheet" href="./resources/css/managerpage.css">
  <title>관리자 페이지</title>
</head>
<body>
 <%
 
 	PrintWriter writer = response.getWriter();
 
	 if (!(session.getAttribute("sessionId") != null && ((String)session.getAttribute("sessionId")).equals("teamF_manager"))) {
		writer.println("<script>");
		writer.println("alert('관리자만 접근 가능한 페이지입니다.')");
		writer.println("location.href='./restaurant.jsp'");
		writer.println("</script>");
	}
 
 	request.setCharacterEncoding("utf-8");
 	
	ArrayList<ArrayList<String>> reservationData = new ArrayList<ArrayList<String>>(); 
	adminDAO dao = new adminDAO();

	reservationData = dao.getAllReservations();
 	
 	if (reservationData.size() == 0) {
 		writer.println("<script>");
		writer.println("alert('레스토랑 내 예약자가 존재하지 않습니다.')");
		writer.println("location.href='./managerPage.jsp'");
		writer.println("</script>");
 	}
 %>
  <div class="lb-wrap">
      <div class="lb-text">
  <div class="ad-wrap">
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>예약자 전체 목록</h3><br>
      <p>관리자 페이지 입니다.<br>예약자 내역을 확인 및 수정 가능합니다.</p><br><br>
		</div>
		</div>
     <table id="adminTable">
      <thead>
        <tr>
          <th>예약자</th>
          <th>연락처</th>
          <th>예약일자</th>
          <th>인원</th>
          <th>추가 요구사항</th>
          <th>테이블</th>
          <th>수정 및 삭제</th>
        </tr>
        </thead>
          <tbody>
         <%
     	    for (int i = 0; i < reservationData.size(); i++) {
          %>
        <tr>
          <th><%= reservationData.get(i).get(1) %></th>
          <th><%= reservationData.get(i).get(2) %></th>
          <th><%= reservationData.get(i).get(3) %></th>
          <th><%= reservationData.get(i).get(4) %></th>
          <th><%= reservationData.get(i).get(5) %></th>
          <th><%= reservationData.get(i).get(6) %></th>
          <td align="center">
            <input type="button" value="수정" onclick="location.href='./managerModifyReservation.jsp?reservationId=<%= reservationData.get(i).get(0)%>&from=all'">
	          <input type="button" value="삭제" onclick="location.href='./managerDeleteReservation.jsp?reservationId=<%= reservationData.get(i).get(0)%>&from=all'" >
               </tr>
             <%
     	        }
             %>
            </tbody>
        </table><br><br><br>
     </div><br><br><br><br><br><br><br><br><br><br><br>
 <body>
</html>