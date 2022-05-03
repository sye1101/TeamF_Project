<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page import = "dao.tableDAO" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="#">
  <title>예약하기</title>
  <link rel="stylesheet" href="./resources/css/retaurant.css">
  <link rel="stylesheet" href="./resources/css/reservation.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap/min.css">
</head>

<body>
  <%
	PrintWriter writer = response.getWriter();
	if (session.getAttribute("sessionId") == null) {
		writer.println("<script>");
		writer.println("alert('회원만 레스토랑 예약이 가능합니다. 예약하시려면 로그인하세요.')");
		writer.println("location.href='./restaurant.jsp'");
		writer.println("</script>");
	} 
	%>
<form method="get" action="./reservationConfirm.jsp">
  <div id="page">
  <%@ include file = "./header.jsp" %>
    <article id="content">
      <h3>테이블 배치도</h3>
      <hr>
      <section id="table_six">
        <img src="./resources/imgs/table_six.png" width="10%" alt="table img">
        <img src="./resources/imgs/table_six.png" width="10%" alt="table img">
      </section>
      <section id="table_four">
      	<img src="./resources/imgs/table_four.png" width="10%" alt="table img">
        <img src="./resources/imgs/table_four.png" width="10%" alt="table img">
      </section>
       <section id="table_two">
      	<img src="./resources/imgs/table_two.png" width="7%" alt="table img">
        <img src="./resources/imgs/table_two.png" width="7%" alt="table img">
      </section>

    </article>
    <div id="container">
      <h3>날짜&amp;시간&amp;인원 선택</h3>
      <hr><br>
      <ul>
        <li>
          <label for="cover"> 인원 </label><br>
          <select id="cover" name="cover">
            <script>
              for (var i = 1; i <= 10; i++) {
                var coverOption = document.createElement('option');
                var cover = document.createTextNode(i + '명');
                coverOption.appendChild(cover);
                document.getElementById("cover").appendChild(coverOption);
              }
            </script>
          </select>
        </li><br>
        <li>
          <label for="reservationDate"> 예약날짜 </label><br>
          <input type="date" id="dt" name="date">
          <script>
            document.getElementById('dt').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
          </script>
        </li><br>
      <li id="reservationTimeId">
          <label for="reservationTime"> 예약시간 </label><br>
          <select id="reservationTime" name = "reservationTime">
            <script>
              for (var i = 10; i <= 23; i++) {
                var reservationTimeOption = document.createElement('option');
                var time = document.createTextNode(i + ' : 00');
                reservationTimeOption.appendChild(time);
                document.getElementById("reservationTime").appendChild(reservationTimeOption);
              }
            </script> 
          </select>
        </li><br>
        <li>
         <label for="selectTable"> 테이블 선택 </label><br>
          <ul>
            <li id="selectTableId">
          <script>
            for (var i = 1; i <= 6; i++) {
              var selectTableCheckbox = document.createElement("INPUT");
              selectTableCheckbox.setAttribute("type", "checkbox");
              selectTableCheckbox.setAttribute("value", i + "번");
              selectTableCheckbox.name = "table_num";
              document.getElementById("selectTableId").appendChild(selectTableCheckbox);
              document.write(i + '번&nbsp;&nbsp;&nbsp;&nbsp;')
            }
          </script>
        </li>
          </ul>
        </li>
      </ul><br>
      <h3>예약자 정보</h3>
      <hr><br>
      <ul>
        <li>
          <label for="name"> 예약자 </label><br>
          <input type="text" id="name" name="name">
        </li>
        <li><br>
          <label for="phonenumber"> 연락처 </label><br>
          <input type="text" id="phonenumber" name="phonenumber">
        </li>
        <li><br>
          <label for="requirements"> 추가 요구 사항 </label><br>
          <textarea name="requirements" rows="4" cols="40"></textarea>
        </li>
      </ul><br>
      <div id="reserveButton">
        <button type="submit">예약하기</button>
      </div><br><br>
   	 </div>
  	</div>
  </form>
</body>

</html>