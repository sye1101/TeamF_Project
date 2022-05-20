<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dao.reservationDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	String reservationId = request.getParameter("reservationId");
	String from = request.getParameter("from");

	reservationDAO res = new reservationDAO();
	%>
	<script type="text/javascript">
       var con = confirm("해당 예약을 삭제하시겠습니까?");
		if (con == true) {
			<% 
				res.deleteReservation(Integer.parseInt(reservationId)); 
				if (from.equals("all")) {
			%>
				alert("해당 예약이 삭제되었습니다.");
				location.href = "managerAllInquiry.jsp?delete=true";
			<%
			    } else if (from.equals("some")) {
			%>
				alert("해당 예약이 삭제되었습니다.");
				location.href = "managerInquiry.jsp?delete=true";
			<%
			    }
			%>
		}
	</script>
</body>
</html>