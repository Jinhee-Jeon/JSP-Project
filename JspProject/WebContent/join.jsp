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
	<h5> [ȸ������] </h5>
	 <form method=post name=test action="join.jsp" >
	<table width=50% border=2 cellpadding=1>
			<tr>
			<form method=post action="processLogin.jsp">
			<td>E mail</td> <td><input type="text" name="id"> 
			<font color=red> * E mail�� ID�� ����մϴ�. </font></td>
			</tr>
			<tr><td>��й�ȣ</td> <td><input type="text" name="password"></td>
			</tr><tr>
			<td>�̸�</td> <td><input type="text" name="name"></td>
			</tr><tr>
			<td>�ֹε�Ϲ�ȣ</td><td><input type="text" name="social_num">
			</tr><tr>
			<td>��ȭ��ȣ</td> <td><input type="text" name="phone"></td>
			</tr><tr>
			<td>���� </td> <td> <input type="radio" name="gender" value="f" checked> ����
							<input type="radio" name="gender" value="m"> ���� </td>
			</tr>
				</table> <p>
				<input type=hidden name="Ord" value="insert">
				 <input type="submit" value="ȸ������"> <input type="reset" value="���"> 
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
				<h5> [ȸ������ Ȯ�� �� ���� ] </h5>
			<form method=post name=test action="p_update.jsp" >
			<table width=50% border=2 cellpadding=1>
			<tr>
			<td>E mail</td> <td><input type="text" name="id" value="<%=p.getId()%>">
			<font color=red> * E mail�� ID�� ����մϴ�. </font></td>
			</tr>
			<tr>
			<td>��й�ȣ</td> <td><input type="text" name="password" value="<%=p.getPasswd()%>"></td>
			</tr>
			<tr>
			<td>�̸�</td> <td><input type="text" name="name" value="<%=p.getName()%>"></td>
			</tr><tr>
			<td>��ȭ��ȣ</td> <td><input type="text" name="phone" value="<%=p.getPhone()%>"></td>
			</tr>
			<tr>
			<% if(p.getGender().equals("f")) {%>
				<td>���� </td> <td> <input type="radio" name="gender" value="f" checked> ����
								<input type="radio" name="gender" value="m"> ���� </td>
			<%}
				else {%>
				<td>���� </td> <td> <input type="radio" name="gender" value="f"> ����
									<input type="radio" name="gender" value="m"  checked> ���� </td>

				<% }%>
			<%}%>
			</tr>
				</table> <p>
			
				 <input type="submit" value="ȸ������ ����"> 
			
			</form>
	<%	}	
		else {
				
		
		peopledb.setOrd("insert");
		peopledb.setSQL("insert into people(people_id, password, name, gender, social_num, phone) values('"+ id+"','"+ password+"','"+ name+"','"
				+ gender +"','" + social_num +"','"+ phone +"')");
		ArrayList<peopleEntity> list = peopledb.getPeopleList();
%>
		<h5> ������ �Ϸ�Ǿ����ϴ�^^* </h5>
<%		}	
	}
	%>
	<a href=project.html> Ȩ���� ���ư��� </a> 
	</body>
</html>