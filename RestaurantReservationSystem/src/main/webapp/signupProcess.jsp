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

		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");

		PrintWriter writer = response.getWriter();
		
		Statement stmt = null;

		userDAO dao = new userDAO();
		int result = dao.existId(id);
		
		if (id.trim().equals("") || pw.trim().equals("") || name.trim().equals("") || phone_number.trim().equals("")) {
			 writer.println("<script>");
			 writer.println("alert('입력이 안 된 항목이 있습니다.')");
			 writer.println("location.href='./signup.jsp'");
			 writer.println("</script>");
		} else if (result == 1) {
			 writer.println("<script>");
			 writer.println("alert('이미 존재하는 아이디입니다.')");
			 writer.println("location.href='./signup.jsp'");
			 writer.println("</script>");
		}
	%>
	
	<!-- 유저 테이블에 가입 시 입력한 아이디와 비밀번호 정보를 넣음 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
		INSERT INTO user(id, password, name, phone_number) VALUES (?,?,?,?)
		<sql:param value = "<%= id %>" />
		<sql:param value = "<%= pw %>" />
		<sql:param value = "<%= name %>" />
		<sql:param value = "<%= phone_number %>" />
	</sql:update>
	
	<%
		 writer.println("<script>");
		 writer.println("location.href='./signupSuccess.jsp'");
		 writer.println("</script>");
	%>
	
</body>
</html>