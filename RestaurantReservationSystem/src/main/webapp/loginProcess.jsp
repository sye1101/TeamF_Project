<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ include file="./db/db_connection.jsp"%>
<%@ page import="dao.userDAO"%>
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
		Statement stmt = null;

			String id = request.getParameter("id_login");
			String pw = request.getParameter("password_login");
			if (dao.isExistNullField(id, pw)) {
				writer.println("<script>");
				writer.println("alert('아이디나 비밀번호가 입력되지 않았습니다.')");
				writer.println("history.back();");
				writer.println("</script>");
			} else {
				int result = dao.login(id, pw); // 1이면 로그인 성공, 0이면 비밀번호 틀림, -1이면 아이디 존재하지 않음
				if (result == 1) {
					session.setAttribute("sessionId", id);
					writer.println("<script>");
					writer.println("location.href='./restaurant.jsp'");
					writer.println("</script>");
				} else if (result == 0 && ((!pw.trim().equals("")) && pw != null)) {
					writer.println("<script>");
					writer.println("alert('비밀번호가 일치하지 않습니다.')");
					writer.println("history.back();");
					writer.println("</script>");
				} else if (result == -1) {
					writer.println("<script>");
					writer.println("alert('존재하지 않는 아이디입니다.')");
					writer.println("history.back();");
					writer.println("</script>");
				}
			}
	%>
</body>
</html>