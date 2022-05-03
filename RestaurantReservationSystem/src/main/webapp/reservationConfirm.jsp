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
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>레스토랑 예약 정보 확인</title>

  <link rel="stylesheet" href="./retaurant.css">
  <link rel="stylesheet" href="./reservationConfirmed.css">
  <style>
    table,
    th,
    td {
      border: 1px solid black;
      border-collapse: collapse;
    }

    th, td {
      padding: 20px;
    }

    table {
      border-spacing: 5px;
    }

    th {
      width: 150px;
      background-color: lightgrey;
    }

    td {
      width: 80%;
    }
  </style>
</head>

<body>
	<%@ include file = "./header.jsp" %>
  <%
	request.setCharacterEncoding("utf-8");
	
	// 이름, 연락처, 추가 요구 사항
	String name = request.getParameter("name");
	String phoneNumber = request.getParameter("phonenumber");
	String requirements = (request.getParameter("requirements") != null) ? request.getParameter("requirements") : "";
	
	// 인원, 예약 날짜, 예약 시간, 테이블
	String date = request.getParameter("date");
	String cover = request.getParameter("cover").substring(0, 1); // '명' 제외
	String reservationTime = request.getParameter("reservationTime");
	String[] table = request.getParameterValues("table_num"); // '번' 제외 필요
	
	System.out.println(Arrays.toString(table));
	
	PrintWriter writer = response.getWriter();
	
	String table_parameter = "";
	for (int i = 0; i < table.length; i++) { 
		table_parameter += (table[i].substring(0, 1) + ","); // ex : 2,7
	 }   
	
	tableDAO td = new tableDAO();
	reservationDAO rd = new reservationDAO();
	ArrayList<Integer> table_convert = new ArrayList<>();
	for (int i = 0; i < table.length; i++) {
		table_convert.add(Integer.parseInt(table[i].substring(0, 1)));
	}
	 
	if (td.isCoverBiggerThanTable(Integer.parseInt(cover), table_convert)) {
		 writer.println("<script>");
		 writer.println("alert('예약 인원이 테이블 최대 수용 인원을 초과하였습니다. 테이블을 다시 선택해 주세요.')");
		 writer.println("location.href='./reservation.jsp'");
		 writer.println("</script>");
	}
	
	ArrayList<Integer> alreadyBookedTables = new ArrayList<Integer>();

	alreadyBookedTables = rd.isTableAlreadyBooked(table_convert);
	
	for (int i = 0; i < alreadyBookedTables.size(); i++) {
		if (alreadyBookedTables.contains(table_convert.get(i))) {
			 writer.println("<script>");
			 writer.println("alert('이미 예약된 테이블이 존재합니다. 다른 테이블을 선택해 주세요.')");
			 writer.println("location.href='./reservation.jsp'");
			 writer.println("</script>");
			 break;
		}
	}
  %>
  <div id="page">
    <div id="container">
      <h3> 예약 정보 확인 </h3>
      <hr><br><br>
      <table>
        <tr>
          <th>예약자</th>
          <td><%= name %> </td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><%= phoneNumber %> </td>
        </tr>
        <tr>
          <th>인원</th>
          <td><%= cover %>명</td>
        </tr>
        <tr>
          <th>예약날짜</th>
          <td><%= date %> </td>
        </tr>
        <tr>
          <th>예약시간</th>
          <td><%= reservationTime %> </td>
        </tr>
        <tr>
          <th>테이블</th>
          <td> <% for (int i = 0; i < table.length; i++) { %>
        	  		<%= table[i] + " " %>
        <%  } %>  
           </td>
        </tr>
        <tr>
          <th>추가 요구사항</th>
          <td><%= requirements %> </td>
        </tr>
      </table><br>
      <div id="checkButton">
         <a href = "./reservationProcess.jsp?name=<%= name %>&phoneNumber=<%= phoneNumber %>&date=<%= date %>&people=<%= cover %>&reservationTime=<%= reservationTime %>&requirements=<%= requirements %>&table=<%= table_parameter %>">예약하기</a>
      </div><br><br>
    </div>
  </div>
</body>
</html>

