<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ include file = "./db/db_connection.jsp" %>
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
  <div id="page">
    <header>
      <div id="logo">
        <a href="#" onclick="location.href='./restaurant.jsp'">
          <img src="./resources/imgs/logo.png" width="50px" alt="Logo">
        </a>
      </div>
      <div id="top_menu">
        <a href="#">LOGIN</a> |
        <a href="#">JOIN</a> |
        <a href="#">MANAGER</a>
      </div>
      <nav>
        <ul>
          <li><a href="#" onclick="location.href='./reservation.jsp'">RESERVATION</a></li>
          <li><a href="#">INQUIRY</a></li>
        </ul>
      </nav>
    </header>
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

    </article>
    <div id="container">
      <h3>날짜&amp;시간&amp;인원 선택</h3>
      <hr><br>
      <ul>
        <li>
          <label for="cover"> 인원 </label><br>
          <select id="cover">
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
          <input type="date" id="dt">
          <script>
            document.getElementById('dt').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
          </script>
        </li><br>
        <li id="reservationTimeId">
          <label for="reservationTime"> 예약시간 </label><br>
          <script>
            for (var i = 10; i < 23; i++) {
              var timeButton = document.createElement('button');
              var time = document.createTextNode(i + ' : 00');
              timeButton.appendChild(time);
              timeButton.className = 'timeButtonClass';
              timeButton.type = 'submit';
              document.getElementById("reservationTimeId").appendChild(timeButton);
              timeButton.onclick = change;
            }

            function change() {
              var changeButton = document.getElementsByClassName("timeButtonClass");

              function handleClick(event) {
                if (event.target.classList[0] === "clicked") {
                  event.target.classList.remove("clicked");
                } else {
                  for (var i = 0; i < changeButton.length; i++) {
                    changeButton[i].classList.remove("clicked");
                  }
                  event.target.classList.add("clicked");
                }
              }

              function init() {
                for (var i = 0; i < changeButton.length; i++) {
                  changeButton[i].addEventListener("click", handleClick);
                }
              }

              init();
            }
          </script>
        </li><br>
        <li>
          <label for="selectTable"> 테이블 선택 </label><br>
          <input type="text" id="testt" class="w90p" align="center" onClick="multiSelect('OPEN')" value="" readonly />
          <input type="button" id="selectButton" value="v" onclick="multiSelect('OPEN')" />
          <div id="Div" class="multi">
            <ul>
              <c:forEach var="list" items="${codeList }" varStatus="loop">
                <li id="checkboxStyle">
                  <input type="checkbox" name="multicheck" nm="${list.codeNm}" value="${list.codeCd}">${list.codeNm}
                </li>
              </c:forEach>
            </ul>
            <div id="closeButton">
              <input type="button" id="checkboxButton" value="select" onClick="multiSelect('CLOSE')">
            </div>
          </div>
          <script>
            function multiSelect(value) {
              if (value == "OPEN") {
                Div.style.visibility = "visible";
              } else {
                Div.style.visibility = "hidden";
                var chkArray = new Array();
                $('input:checkbox[name=multicheck]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
                  chkArray.push(this.getAttribute('nm'));
                });
                if (chkArray.length > 0) {
                  $('#testt').val(chkArray)
                }
              }
            }
          </script>
        </li>
      </ul><br>
      <h3>예약자 정보</h3>
      <hr><br>
      <ul>
        <li>
          <label for="name"> 예약자 </label><br>
          <input type="text" id="name">
        </li>
        <li><br>
          <label for="phonenumber"> 연락처 </label><br>
          <input type="text" id="phonenumber">
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
</body>

</html>