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
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity,univ.psEntity, univ.reservation, univ.passport, univ.airschedule,univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<form method=post action="end_reservation.jsp">

<%
Enumeration<String> e2 = session.getAttributeNames();
String id="";
String pass="";
String[] data = {""};


String reservation_id = request.getParameter("reservation_id");
String Ord = request.getParameter("Ord");


int i=0,j=0;
if( Ord.equals("passport") ){

	String number = request.getParameter("number");
	int n= Integer.parseInt(number);

		for(i=1; i<=n; i++) {
			
			String name="name";
			String eng_name="eng_name";
			String birth="";
			String month="month";
			String year="year";
			String day="day";
			String exmonth="exmonth";
			String exyear="exyear";
			String exday="exday";
			String exdate="";
			String pass_num ="pass_num";
			
		
			name = name.concat(""+i);
			eng_name = eng_name.concat(""+i);
			pass_num = pass_num.concat(""+i);
			year = year.concat(""+i);
			month = month.concat(""+i);
			day = day.concat(""+i);
			exyear = exyear.concat(""+i);
			exmonth = exmonth.concat(""+i);
			exday = exday.concat(""+i);
			
			System.out.println("pass_num = " + pass_num);
			System.out.println("birth : " + year + "," + month + "," + day);
			System.out.println("exdate: " + exyear + "," + exmonth + "," +exday);
			
			
			name =  request.getParameter(name);
			eng_name =  request.getParameter(eng_name);
			pass_num =  request.getParameter(pass_num);
		//	birth =  request.getParameter(birth);
			exday =  request.getParameter(exday);
			exmonth =  request.getParameter(exmonth);
			exyear =  request.getParameter(exyear);
			month =  request.getParameter(month);
			year =  request.getParameter(year);
			day =  request.getParameter(day);
			exdate = exdate.concat(exyear+"-"+exmonth+"-" +exday);
			birth = birth.concat(year+"-"+month+"-"+day);
			
			System.out.println("name = " + name);
			System.out.println("eng_name = " + eng_name);
			System.out.println("pass_num = " + pass_num);
			System.out.println("birth= " + birth);
			System.out.println("exdate = " + exdate);
			
			peopledb.setOrd("update");
			peopledb.setSQL("update reservation set passport_num = '"+pass_num + "', people_num = "+n+" where reserve_id =" + reservation_id ); 
			ArrayList<reservation> list = peopledb.getReservation();

			
			%>
			<input type=hidden name="pass_num<%=i%>" value=<%=pass_num%>>
			<%
			}
		

		
	
}
else  {
	String number2 = request.getParameter("number2");
	int n2= Integer.parseInt(number2);
	Enumeration<String> e = request.getParameterNames();
	while ( e.hasMoreElements() ) {
		String name = e.nextElement();
		data= request.getParameterValues("seat_num");
	}
	
	for(i=1; i<2; i++) {
		peopledb.setOrd("update");
		peopledb.setSQL("update reservation set seat = "+ data[0] + " where reserve_id = " + reservation_id);
		
		ArrayList<reservation> list = peopledb.getReservation();  //예약 테이블에 예약정보 insert 
	}
	
	
}


if (e2 == null) {
	out.println("로그인을 해주세요.");
} 
else {
	
	while(e2.hasMoreElements()) { 
		String name = e2.nextElement();
	
		if(name.equalsIgnoreCase("id")) {
			String value = (String) session.getAttribute(name); 
			id = value;
		}
		else if(name.equalsIgnoreCase("pass")){
			String value = (String)session.getAttribute(name); 
			pass=value;
		}
	}
}
%>
<font size="2" face="맑은 고딕">
<h5> 예약수정이 완료되었습니다 </h5>
<a href="processLogin.jsp?id=<%=id%>&pass=<%=pass%>"> 홈으로 돌아가기 </a> </font>
</body>
</html>