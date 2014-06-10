<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품예약하기</title>
	<h5> [여권정보입력] </h5>
<script type="text/javascript">
	function selectChange() {
		var f=document.sForm;
		f.action = "reservation.jsp";
		f.submit();
	}
	</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity,univ.psEntity, univ.airschedule,univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<%String p_id = request.getParameter("id");
String number = request.getParameter("number");
String cnt = (String)request.getAttribute("cnt");
int i=0;  
int n=0;
System.out.println("cnt : " + cnt);

if(Integer.parseInt(cnt) <=34) {
	

%>
<form name="sForm" method="post">
<font size="2" face="맑은 고딕">
	예약인원 선택 : 
	
	<%if(number==null) { %>
	<select name="number" onchange="selectChange()";>
		<option SELECTED value="0">선택하세요</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option> 
		<option value="4">4</option> 
		<option value="5">5</option> 
		</select>
		
	<%}
	if(number!=null) {
		if( Integer.parseInt(number)==1) { %>
			<select name="number" onchange="selectChange()";>
			<option value="0">선택하세요</option>
			<option SELECTED value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option> 
			<option value="4">4</option> 
			<option value="5">5</option> 
			</select>
	<%}
	
		else if( Integer.parseInt(number)==2) { %>
			<select name="number" onchange="selectChange()";>
			<option value="0">선택하세요</option>
			<option  value="1">1</option>
			<option SELECTED value="2">2</option>
			<option value="3">3</option> 
			<option value="4">4</option> 
			<option value="5">5</option> 
			</select>
	<%}
	
		else if( Integer.parseInt(number)==3) { %>
				<select name="number" onchange="selectChange()";>
				<option value="0">선택하세요</option>
				<option  value="1">1</option>
				<option  value="2">2</option>
				<option SELECTED value="3">3</option> 
				<option value="4">4</option> 
				<option value="5">5</option> 
				</select>
		<%}
			
			
	
		else if( Integer.parseInt(number)==4) { %>
				<select name="number" onchange="selectChange()";>
				<option value="0">선택하세요</option>
				<option  value="1">1</option>
				<option  value="2">2</option>
				<option  value="3">3</option> 
				<option SELECTED value="4">4</option> 
				<option value="5">5</option> 
				</select>
		<%}
			
		else if( Integer.parseInt(number)==5) { %>
		<select name="number" onchange="selectChange()";>
		<option value="0">선택하세요</option>
		<option  value="1">1</option>
		<option  value="2">2</option>
		<option  value="3">3</option> 
		<option  value="4">4</option> 
		<option SELECTED value="5">5</option> 
		</select>
	<%	}
	}
	%> <p>
	<input type=hidden name="id" value="<%=p_id%>">

</font>
</form>
<form method=post action="air_reservation.jsp">
<%

if(number !=null) {%>
	<font size="2" face="맑은 고딕" color=red > *여권정보를 입력해주세요!!!  </font> <p>
<%	if(Integer.parseInt(number)!=0) {
		n=Integer.parseInt(number);
		
		for(i=1; i<=n; i++) { %>
		
		<font size="2" face="맑은 고딕">
		<%=i %>.
			<table width=30% border=1 cellpadding=1>
				<tr><td>이름</td> <td><input type="text" size=10 name="name<%=i%>"></td></tr>
				<tr><td>영문이름</td> <td><input type="text" size=10 name = "eng_name<%=i%>"></td></tr>
				<tr><td>여권번호</td> <td><input type="text" size=20 name = "pass_num<%=i%>"></td></tr>
				<tr><td>생년월일</td> <td><select name="year<%=i%>"> 
								   <option>1990</option>
								   <option>1991</option>
								   <option>1992</option>
								   <option>1993</option>
								   <option>1994</option>
								   <option>1995</option>
								 </select>
								  년 
						<select name="month<%=i%>">
						   <option>01</option>
						   <option>02</option>
						   <option>03</option>
						   <option>04</option>
						   <option>05</option>
						   <option>06</option>
						   <option>07</option>
						   <option selected="selected">08</option>
						   <option>09</option>
						   <option>10</option>
						   <option>11</option>
						   <option>12</option>
						   </select>
						   월
						   
						  <select name="day<%=i%>">
					 <%for(int k = 1; k<=31; k++){ %>
						 <option><%=k %></option>
					  <%} %>
						
						</select>일 
					</td></tr>
				<tr><td>여권만료일</td> <td><select name="exyear<%=i%>"> 
								   <option>2013</option>
								   <option>2014</option>
								   <option>2015</option>
								   <option>2016</option>
								   <option>2017</option>
								   <option>2018</option>
								 </select>
								  년 
						<select name="exmonth<%=i%>">
						   <option>01</option>
						   <option>02</option>
						   <option>03</option>
						   <option>04</option>
						   <option>05</option>
						   <option>06</option>
						   <option>07</option>
						   <option selected="selected">08</option>
						   <option>09</option>
						   <option>10</option>
						   <option>11</option>
						   <option>12</option>
						   </select>
						   월
						   
						  <select name="exday<%=i%>">
					 <%for(int k = 1; k<=31; k++){ %>
						 <option><%=k %></option>
					  <%} %>
						
						</select>일 
			
			</table> 
			</font>
		
			
			<p>
		<%
		}
	}
	
	
}


System.out.println("p_id = " + p_id);
%>
<p>
	
	<input type=hidden name="p_id" value="<%=p_id%>">
	<input type=hidden name="number" value="<%=number%>">
	<input type="submit" value="여권 입력 완료">
	</form>
<%}
else {
	out.println("예약이 꽉 찼습니다. 다른 스케줄을 선택해주세요.");
}
%>	
</body>
</html>