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
  <title>�����ϱ�</title>
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
      <h3>���̺� ��ġ��</h3>
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
      <h3>��¥&amp;�ð�&amp;�ο� ����</h3>
      <hr><br>
      <ul>
        <li>
          <label for="cover"> �ο� </label><br>
          <select id="cover">
            <script>
              for (var i = 1; i <= 10; i++) {
                var coverOption = document.createElement('option');
                var cover = document.createTextNode(i + '��');
                coverOption.appendChild(cover);
                document.getElementById("cover").appendChild(coverOption);
              }
            </script>
          </select>
        </li><br>
        <li>
          <label for="reservationDate"> ���೯¥ </label><br>
          <input type="date" id="dt">
          <script>
            document.getElementById('dt').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
          </script>
        </li><br>
        <li id="reservationTimeId">
          <label for="reservationTime"> ����ð� </label><br>
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
          <label for="selectTable"> ���̺� ���� </label><br>
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
                $('input:checkbox[name=multicheck]:checked').each(function() { // üũ�� üũ�ڽ��� value ���� ������ �´�.
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
      <h3>������ ����</h3>
      <hr><br>
      <ul>
        <li>
          <label for="name"> ������ </label><br>
          <input type="text" id="name">
        </li>
        <li><br>
          <label for="phonenumber"> ����ó </label><br>
          <input type="text" id="phonenumber">
        </li>
        <li><br>
          <label for="requirements"> �߰� �䱸 ���� </label><br>
          <textarea name="requirements" rows="4" cols="40"></textarea>
        </li>
      </ul><br>
      <div id="reserveButton">
        <button type="submit">�����ϱ�</button>
      </div><br><br>
    </div>
  </div>
</body>

</html>