<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*" %>
<%@ include file = "./header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page import = "dao.tableDAO" %>
<%@ page import = "dao.reservationDAO" %>
<%@ page import="dao.userDAO"%>
<%@ page import = "dto.User" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="#">
  <title>관리자 페이지</title>
  <link rel="stylesheet" href="./resources/css/reservation.css">
     <link rel="stylesheet" href="./resources/css/managerpage.css">
</head>

<body>
  <%
	PrintWriter writer = response.getWriter();

	if (!(session.getAttribute("sessionId") != null && ((String)session.getAttribute("sessionId")).equals("관리자 아이디"))) {
		writer.println("<script>");
		writer.println("alert('관리자만 접근 가능한 페이지입니다.')");
		writer.println("location.href='./restaurant.jsp'");
		writer.println("</script>");
	}
	
	String reservationId = request.getParameter("reservationId");
	reservationDAO dao1 = new reservationDAO();
	
	// 예약번호 이름 연락처 인원 날짜 시간 테이블 추가 요구 사항
	ArrayList<String> reservationData = dao1.getOneReservation(Integer.parseInt(reservationId));
	
	System.out.println(Arrays.toString(reservationData.toArray()));
	
	// 최대 예약 인원은 10명이므로 테이블은 최대 4개까지 예약 가능
	String[] tables = new String[4];
	tables = reservationData.get(6).split("\\s");
	System.out.println(Arrays.toString(tables));
	%>
<form method="post" action="./reservationModifyProcess.jsp">
  <div id="page">
    <div class="lb-wrap">
      <div class="img"></div>
    </div>
    <div id="inpage">
      <br><br><br><br>
      <h3>예약 정보 수정</h3><br><br>
    <article id="content">
      <h3>테이블 배치도</h3>
      <hr><br><br>
      <section id="table_six">
        <img src="./resources/imgs/table_six.png" width="10%" alt="table img">
        <img src="./resources/imgs/table_six.png" width="10%" alt="table img">
      </section>
      <section id="table_four">
      	<img src="./resources/imgs/table_four.png" width="10%" alt="table img">
        <img src="./resources/imgs/table_four.png" width="10%" alt="table img">
      </section><br>
       <section id="table_two">
      	<img src="./resources/imgs/two_table.png" width="8%" alt="table img">
        <img src="./resources/imgs/two_table.png" width="8%" alt="table img">
      </section>
    </article><br><br>
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
              var covers = document.getElementById("cover")
              for (var i, j = 0; j <= covers.options[j]; j++) {
            	  if (i.value == <%= reservationData.get(3) + "명" %>) {
                    	covers.selectedIndex = j
                    }
                }
            </script>
          </select>
        </li><br>
        <li>
          <label for="reservationDate"> 예약날짜 </label><br>
          <input type="date" id="dt" name="date">
          <script> 
            document.getElementById('dt').value = <%= reservationData.get(4) %>
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
                if (reservationTimeOption.value == <%= reservationData.get(5) %>) {
                	reservationTimeOption.selected = true;
                }
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
          <script> // 예약번호 이름 연락처 인원 날짜 시간 테이블 추가 요구 사항
            for (var i = 1; i <= 6; i++) {
              var selectTableCheckbox = document.createElement("INPUT");
              selectTableCheckbox.setAttribute("type", "checkbox");
              selectTableCheckbox.setAttribute("value", i + "번");
              selectTableCheckbox.name = "table_num";
              <% for (int i = 0; i < tables.length; i++) { %>
              	if (selectTableCheckbox == <%= tables[i] %>) {
            	  selectTableCheckbox.checked = true;
                  }
              	<%
                }
              %>
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
          <input type="text" id="name" value = "<%= reservationData.get(1) %>" name="name"  readonly>
        </li>
        <li><br>
          <label for="phonenumber"> 연락처 </label><br>
          <input type="text" id="phonenumber" value = "<%= reservationData.get(2) %>" name="phonenumber" readonly>
        </li>
        <li><br>
          <label for="requirements"> 추가 요구 사항 </label><br>
          <textarea name="requirements" rows="4" cols="40"><%= reservationData.get(7) %></textarea>
        </li>
      </ul><br>
      <div id="reserveButton">
        <button type="submit">수정하기</button>
     </div><br><br><br><br><br><br>
      </div>
    </div>
  </div>
  </form>
</body>

</html>
