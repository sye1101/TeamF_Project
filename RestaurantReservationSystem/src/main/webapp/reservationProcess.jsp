<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dao.tableDAO" %>
<%@ page import="dao.reservationDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
  <%
  
  request.setCharacterEncoding("utf-8");
	
	// 이름, 연락처, 추가 요구 사항
	String name = request.getParameter("name");
	String phoneNumber = request.getParameter("phoneNumber");
	String requirements = (request.getParameter("requirements") != null) ? request.getParameter("requirements") : "";
	
	// 인원, 예약 날짜, 예약 시간, 테이블
	String date = request.getParameter("date");
	String cover = request.getParameter("people").substring(0, 1); // '명' 제외
	String reservationTime = request.getParameter("reservationTime");
	String table = request.getParameter("table");

	System.out.println(table);
	
	PrintWriter writer = response.getWriter();
	ArrayList<Integer> table_convert = new ArrayList<>();

	for (int i = 0; i < table.length(); i++) { // ex : 2,7
		if (table.charAt(i) != ',') {
			table_convert.add(Integer.parseInt(Character.toString(table.charAt(i))));
		}  
	}
	
	tableDAO td = new tableDAO();
	reservationDAO rd = new reservationDAO();

	System.out.println(table_convert.size());
	ArrayList<Integer> alreadyBookedTables = new ArrayList<Integer>();
 
	alreadyBookedTables = rd.isTableAlreadyBooked(table_convert);
	
	rd.reservation(name, phoneNumber, date, reservationTime, Integer.parseInt(cover), requirements);
	for (int i = 0; i < table_convert.size(); i++) {
		rd.reservation_table(table_convert.get(i), name, phoneNumber);
	}
	
	response.sendRedirect("reservationCompleted.jsp");
  %>
</body>
</html>