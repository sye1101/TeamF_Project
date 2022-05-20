<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.*" %>
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
%>
  <div class="lb-wrap">
      <div class="lb-text">
  <div class="ad-wrap">
      <div class="img"></div>
    </div>
    <div id="container">
      <br><br><br><br>
      <h3>예약자 목록 검색</h3><br>
      <p>관리자 페이지 입니다.<br>예약자 내역을 확인 및 수정 가능합니다.</p><br><br>
          <div id="search">
          	<form method = "post" action = "./managerInquiry.jsp">
            <select name="ch1" id="ch1">
              <option>이름</option>
              <option>연락처</option>
            </select>
            <input type="text" name="input_search" id="input_search" >
            <input type="submit" value="검색하기">
            <input type="button" value="예약자 전체 보기" onclick = "location.href='./managerAllInquiry.jsp'">
            </form>
            <br><br>
          </div>
		</div>
		</div>
    </div><br><br><br><br><br><br><br><br><br><br><br>
</body>

</html>