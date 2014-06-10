<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약수정</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr");%>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity, univ.rev, univ.psEntity,
	univ.reservation, univ.passport, univ.airschedule,univ.reservationInfo,
	univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<font size="2" face="맑은 고딕">
<p>
<%
int i=0;
int j=0;
String reservation_id = request.getParameter("reservation_id");
String number = request.getParameter("number");
System.out.println("좌석번호 : " + number);

%>
<form method=post action="updateAll.jsp">
<form name='frm'>
 
<img src="jspProject Image/air.jpg" style='position:absolute; width:600px; height:300px; left:0px; top:0px; z-index:1;' border='0' width='100%' height='100%'>
 <div style='position:absolute; width:600px; height:300px; left:0px; top:0px; z-index:2;'>
<center>
<font size="2" face="맑은 고딕"> <h5>*좌석을 선택하세요 (<%=number %>인 선택가능) </h5></font> </center>
<br /><br /><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<% for(i=1; i<=2; i++) { 
	for(j=1; j<=8; j++) {%>
	
 	<input type="checkbox" name="seat_num" value="<%=j*i%>">
 <%
	}%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%} %>
<br /><br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% for(i=1; i<=2; i++) { 
	for(j=17; j<=25; j++) {%>
	
 	<input type="checkbox" name="seat_num" value="<%=j*i%>">
 <%
	}%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%} %>
	<p>
	<input type=hidden name="Ord" value="seat">
	<input type=hidden name="reservation_id" value="<%=reservation_id%>">
	<input type=hidden name="number2" value="<%=number%>">
	<p><center> <input type="submit" value="수정완료"></center>

	</form>
</div>





</body>
</html>