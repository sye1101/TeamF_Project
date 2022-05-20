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
	request.setCharacterEncoding("utf-8");
	String reservationId = request.getParameter("reservationId");
	PrintWriter writer = response.getWriter();

	reservationDAO res = new reservationDAO();
	%>
	<script type="text/javascript">
       var con = confirm("정말 레스토랑 예약을 취소하시겠습니까?");
	    // 자바스크립트에서는 jsp 변수를 가져와 저장하는 것이 가능하므로 위 자바 코드에서 작성한 변수들을 저장함
		if (con == true) {
			<% res.deleteReservation(Integer.parseInt(reservationId)); %>
			alert("레스토랑 예약이 취소되었습니다.");
			location.href = "reservationCancelCompleted.jsp";
		} else { 
			location.href = "reservationCancel.jsp?reservationId=<%= reservationId %>";
		}
	</script>
</body>
</html>