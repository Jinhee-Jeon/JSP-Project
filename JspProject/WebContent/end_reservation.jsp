<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약완료 & 확인</title>
	
</head>
<body>
<% request.setCharacterEncoding("euc-kr");
%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity, univ.rev, univ.psEntity,univ.reservation, univ.passport, univ.airschedule,univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<%@ taglib uri="/WEB-INF/tld/SelectReserveTag.tld" prefix="mytag" %> 
<center>
<h5> [예약완료 & 확인] </h5> 
<font size="2" face="맑은 고딕">

	<form method=post action="credit.jsp">
		<center>
<%
String people_id = "";
int i=0;
String number = request.getParameter("number");
String p_id = request.getParameter("p_id");
int n= Integer.parseInt(number);
String[] data = {""};
String pass_num = "pass_num";
String[] p=new String[10];
String tmp="";
Calendar oCalendar = Calendar.getInstance( );
Enumeration<String> e = request.getParameterNames();
Enumeration<String> e2 = session.getAttributeNames();

String year = oCalendar.get(Calendar.YEAR)+"";
int m= oCalendar.get(Calendar.MONTH)+1;
String month = m+"";
String day = oCalendar.get(Calendar.DAY_OF_MONTH)+"";
String seatData = request.getParameter("seat_num");
year = year.concat("-"+month + "-"+day);
	i=0;
	while ( e.hasMoreElements() ) {
		String name = e.nextElement();
		data= request.getParameterValues("seat_num");
		
	}
	
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
		
		}
	}

	
	//data 좌석번호 
	//여권 번호 가져오는 부분 
	for(i=1; i<=n; i++) {
		pass_num ="pass_num";
		pass_num = pass_num.concat(""+i);
		pass_num =  request.getParameter(pass_num);
		p[i] = pass_num;
	}
	for(i=1; i<=n; i++) {
		peopledb.setOrd("insert");
		/*peopledb.setSQL("insert into reservation values (" +null+",'" + year +"','"+number+"','"
				+people_id+"','"+p_id +"','" + data[i-1] +"','" + p[i]+"')"  );
		*/
		peopledb.setSQL("insert into reservation values (" +null+",'" + year +"','"+number+"','"
				+people_id+"','"+p_id +"','" + seatData +"','" + p[i]+"')"  );
		
		ArrayList<passport> list = peopledb.getPassport();  //예약 테이블에 예약정보 insert 
	}
	peopledb.setOrd("select");
	peopledb.setSQL("select * from reservation where passport_num = '"+p[1]+"'");
	System.out.println(peopledb.getSQL() );
	ArrayList<reservation> list2 = peopledb.getReservation();  //예약 번호 가져오기 
	
	int reserve_id=0;
	String product_name = "";
	int cost = 0;
	for(reservation r : list2 ) { 
		reserve_id = r.getReserve_id();
	}
	
	String name = "";
	peopledb.setOrd("select");
	peopledb.setSQL("select * from people where people_id ='" + people_id +"'");
	ArrayList<peopleEntity> list3 = peopledb.getPeopleList();  
	for(peopleEntity pe : list3 ) { 
		name = pe.getName();
	}
	
	
	%>
	<font color="blue"> <b><%=name %></b> </font>
	<%
	out.println("님의 예약이 완료되었습니다!!" + "<p>");
	peopledb.setSQL("select * from rev where reserve_id ='"+reserve_id+"'");
	ArrayList<rev> list = peopledb.getRev();  %>
	
	<mytag:print border="1" bgcolor="skyblue" list="${peopledb.rev}" >
	[예약완료 & 확인] 
	</mytag:print>
	
	
	<table width=100% border=1 cellpadding=1>
	<tr>
	   <td align=center><b>예약날짜 </b></td>
	    <td align=center><b>예약인원수</b></td>
       <td align=center><b>여권번호</b></td>
        <td align=center><b>사진</b></td>
       <td align=center><b>상품이름</b></td>
       <td align=center><b>가격</b></td>
       <td align=center><b>좌석번호</b></td>
       </tr>
       
<%	for(rev r : list ) {
		product_name = r.getProduct_name();
		cost = r.getCost();
%>
		
	<tr> 
    <td align=center><%=r.getReserve_date()%></td>
    <td align=center><%=r.getPeople_num()%></td>
    <td align=center><%=r.getPassport_num()%></a></td>
    <td align=center><img src="jspProject Image/<%=r.getProduct_id()%>.jpg"></td>
     <td align=center><%=r.getProduct_name()%></td>
    <td align=center><%=r.getCost()%></td>
     <td align=center><%=r.getSeat()%></td>
    </tr>
		
<%	}
%>
</table>
<p>
</font>
	<input type=hidden name="product_name" value="<%=product_name%>">
	<input type=hidden name="number" value="<%=number%>">
	<input type=hidden name="cost" value="<%=cost%>">
	
	<input type="submit" value="결제하기">
	</form>
</center>
</body>
</html>