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
	String requirements = (request.getParameter("requirements") != null) ? request.getParameter("requirements") : "없음";
	
	// 인원, 예약 날짜, 예약 시간, 테이블
	String date = request.getParameter("date");
	String cover = request.getParameter("people").substring(0, 1); // '명' 제외
	String reservationTime = request.getParameter("reservationTime");
	String table = request.getParameter("table");
	
	PrintWriter writer = response.getWriter();
	ArrayList<Integer> table_convert = new ArrayList<>();

	for (int i = 0; i < table.length(); i++) { // ex : 2,7
		if (table.charAt(i) != ',') {
			table_convert.add(Integer.parseInt(Character.toString(table.charAt(i))));
		}  
	}
	
	date = date + " " + reservationTime; // 2022-05-13 12:00
	
	tableDAO td = new tableDAO();
	reservationDAO rd = new reservationDAO();

	ArrayList<Integer> alreadyBookedTables = new ArrayList<Integer>();
 
	alreadyBookedTables = rd.getAlreadyBookedTable(table_convert, date);
	
	rd.reservation(name, phoneNumber, date, Integer.parseInt(cover), requirements);
	int reservationId = rd.getReservationId(name, phoneNumber, date);
	System.out.println("reservationId : " + reservationId);
	for (int i = 0; i < table_convert.size(); i++) {
		// public void reservation_table(int reservation_id, int table_id, String date)
		rd.reservation_table(table_convert.get(i), reservationId,  date);
	}
	
	response.sendRedirect("reservationCompleted.jsp");
  %>
</body>
</html>