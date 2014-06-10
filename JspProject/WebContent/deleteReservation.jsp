<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약 취소</title>
	<h5> [예약취소] </h5>
</head>
<body>
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

<%
String reservation_id = request.getParameter("reservation_id");
Enumeration<String> e2 = session.getAttributeNames();
String people_id = "";
String id="";
String pass="";
	if (e2 == null) {
		out.println("세션이 없습니다.");
	} 
	else {
		
		while(e2.hasMoreElements()) { 
			String name = e2.nextElement();
			if(name.equalsIgnoreCase("id")) {
				String value = (String) session.getAttribute(name); 
				people_id = value;
			}
			else if(name.equalsIgnoreCase("pass")){
				String value = (String)session.getAttribute(name); 
				pass=value;
			}
		
		}
	}
System.out.println("reservation_id = " + reservation_id);
peopledb.setOrd("delete");
peopledb.setSQL("delete from reservation where reserve_id = "+reservation_id);
ArrayList<reservation> list3 = peopledb.getReservation();  
int num = peopledb.getResult();

String name = "";
peopledb.setOrd("select");
peopledb.setSQL("select * from people where people_id ='" + people_id +"'");
ArrayList<peopleEntity> list2 = peopledb.getPeopleList();  
for(peopleEntity pe : list2 ) { 
	name = pe.getName();
}
if(num>= 1){

	%>
	<center>
	<font color="blue"> <b><%=name %></b> </font>
	<%
	out.println("님의 예약이 취소되었습니다." + "<p>");
}

%></center>
  <center> <a href="processLogin.jsp?id=<%=people_id%>&pass=<%=pass %>"> 홈으로 돌아가기 </a> 
   </center>
</body>

</html>