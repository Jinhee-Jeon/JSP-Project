<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석선택</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity,univ.psEntity,  univ.passport, univ.airschedule,univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<form method=post action="end_reservation.jsp">
<%
String number = request.getParameter("number");
String p_id = request.getParameter("p_id");

System.out.println("air_re: p_id" + p_id);
int i=0,j=0;
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
		
		/*System.out.println("name = " + name);
		System.out.println("eng_name = " + eng_name);
		System.out.println("pass_num = " + pass_num);
		System.out.println("birth= " + birth);
		System.out.println("exdate = " + exdate);
		*/
		
		peopledb.setOrd("insert");
		peopledb.setSQL("insert into passport values ("+ "'"+name +"','"+eng_name + 
				"','" + birth + "','" + exdate + "','" + pass_num + "')");
		ArrayList<passport> list = peopledb.getPassport();

		
		%>
		<input type=hidden name="pass_num<%=i%>" value=<%=pass_num%>>
		<%
		}
	%>
<form name='frm'>
 
<img src="jspProject Image/air.jpg" style='position:absolute; width:600px; height:300px; left:0px; top:0px; z-index:1;' border='0' width='100%' height='100%'>
 <div style='position:absolute; width:600px; height:300px; left:0px; top:0px; z-index:2;'>
<center>
<font size="2" face="맑은 고딕"> <h5>*좌석을 선택하세요 (<%=number %>인 선택가능) </h5></font> 
<p>
</center>

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

	<input type=hidden name="p_id" value="<%=p_id%>">
	<input type=hidden name="number" value="<%=number%>">
	<p><center> <input type="submit" value="좌석 선택 완료"></center>
	</form>
</div>
 </form>



</body>
</html>