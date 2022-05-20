<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*" %>
<%@ include file="./db/db_connection.jsp"%>
<%@ page import="dao.userDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
	    request.setCharacterEncoding("UTF-8");
	
		userDAO dao = new userDAO();
		PrintWriter writer = response.getWriter();

 		String managerId = request.getParameter("managerID");
		String managerPw = request.getParameter("managerPassword");
		
		if (dao.isExistNullField(managerId, managerPw)) {
				writer.println("<script>");
				writer.println("alert('아이디나 비밀번호가 입력되지 않았습니다.')");
				writer.println("history.back();");
				writer.println("</script>");
		} else {
			boolean result = (managerId.equals("관리자 아이디") && managerPw.equals("관리자 비밀번호")) ? true : false;
			if (result) {
				session.setAttribute("sessionId", managerId);
				writer.println("<script>");
				writer.println("alert('관리자로 로그인 되었습니다.')");
				writer.println("location.href='./restaurant.jsp'");
				writer.println("</script>");
			} else {
				writer.println("<script>");
				writer.println("alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.')");
				writer.println("history.back();");
				writer.println("</script>");
			}
		}
	%>
</body>
</html>
