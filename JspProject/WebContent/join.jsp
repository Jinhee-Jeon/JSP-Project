<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WELCOME TO J*TOUR!</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.util.ArrayList, univ.peopleEntity, univ.peopleCP" %>
<%@ page import="java.util.ArrayList,univ.productEntity,univ.psEntity, univ.airschedule,univ.staffEntity ,univ.peopleEntity"%>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />

<h2>WELCOME TO J*TOUR!</h2>

<%

String id = request.getParameter("id"); 
String password = request.getParameter("password"); 
String social_num = request.getParameter("social_num"); 
String gender = request.getParameter("gender"); 
String phone = request.getParameter("phone"); 
String name = request.getParameter("name"); 
String p_id="";
Enumeration<String> e2 = session.getAttributeNames();
if(id==null) { %>
	<h5> [회원가입] </h5>
	 <form method=post name=test action="join.jsp" >
	<table width=50% border=2 cellpadding=1>
			<tr>
			<form method=post action="processLogin.jsp">
			<td>E mail</td> <td><input type="text" name="id"> 
			<font color=red> * E mail을 ID로 사용합니다. </font></td>
			</tr>
			<tr><td>비밀번호</td> <td><input type="text" name="password"></td>
			</tr><tr>
			<td>이름</td> <td><input type="text" name="name"></td>
			</tr><tr>
			<td>주민등록번호</td><td><input type="text" name="social_num">
			</tr><tr>
			<td>전화번호</td> <td><input type="text" name="phone"></td>
			</tr><tr>
			<td>성별 </td> <td> <input type="radio" name="gender" value="f" checked> 여자
							<input type="radio" name="gender" value="m"> 남자 </td>
			</tr>
				</table> <p>
				<input type=hidden name="Ord" value="insert">
				 <input type="submit" value="회원가입"> <input type="reset" value="취소"> 
	</p></form><%
	}
	else{
		 id = request.getParameter("id"); 
		String Ord = request.getParameter("Ord");
		System.out.println("id = "+ id);
		System.out.println("Ord = "+Ord);
		
		if(Ord.equals("update")) {
			
			peopledb.setOrd("select");
			peopledb.setSQL("select * from people where people_id = '" + id +"'");
			ArrayList<peopleEntity> list = peopledb.getPeopleList();
			
			for(peopleEntity p : list ) { 
				password = p.getPasswd();
				name = p.getName();
				phone = p.getPhone();
				gender = p.getGender();%>
				<h5> [회원정보 확인 및 수정 ] </h5>
			<form method=post name=test action="p_update.jsp" >
			<table width=50% border=2 cellpadding=1>
			<tr>
			<td>E mail</td> <td><input type="text" name="id" value="<%=p.getId()%>">
			<font color=red> * E mail을 ID로 사용합니다. </font></td>
			</tr>
			<tr>
			<td>비밀번호</td> <td><input type="text" name="password" value="<%=p.getPasswd()%>"></td>
			</tr>
			<tr>
			<td>이름</td> <td><input type="text" name="name" value="<%=p.getName()%>"></td>
			</tr><tr>
			<td>전화번호</td> <td><input type="text" name="phone" value="<%=p.getPhone()%>"></td>
			</tr>
			<tr>
			<% if(p.getGender().equals("f")) {%>
				<td>성별 </td> <td> <input type="radio" name="gender" value="f" checked> 여자
								<input type="radio" name="gender" value="m"> 남자 </td>
			<%}
				else {%>
				<td>성별 </td> <td> <input type="radio" name="gender" value="f"> 여자
									<input type="radio" name="gender" value="m"  checked> 남자 </td>

				<% }%>
			<%}%>
			</tr>
				</table> <p>
			
				 <input type="submit" value="회원정보 수정"> 
			
			</form>
	<%	}	
		else {
				
		
		peopledb.setOrd("insert");
		peopledb.setSQL("insert into people(people_id, password, name, gender, social_num, phone) values('"+ id+"','"+ password+"','"+ name+"','"
				+ gender +"','" + social_num +"','"+ phone +"')");
		ArrayList<peopleEntity> list = peopledb.getPeopleList();
%>
		<h5> 가입이 완료되었습니다^^* </h5>
<%		}	
	}
	%>
	<a href=project.html> 홈으로 돌아가기 </a> 
	</body>
</html>