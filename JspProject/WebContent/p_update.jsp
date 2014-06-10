<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보수정</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.util.ArrayList, univ.peopleEntity, univ.peopleCP" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%
Enumeration<String> e2 = session.getAttributeNames();
String id = request.getParameter("id"); 
String password = request.getParameter("password"); 
String gender = request.getParameter("gender"); 
String phone = request.getParameter("phone"); 
String name = request.getParameter("name"); 

String pass="";
	%> 
	<font size="2" face="맑은 고딕">
	 <form method=post name=test action="join.jsp" >
	<h5> [회원정보 수정 완료!] </h5>
	<%
	peopledb.setOrd("update");
	peopledb.setSQL("UPDATE people SET password ='"+password +"', name = '"+name+"' ,phone ='"+phone+"',  gender = '"+gender+"' WHERE people_id ='" + id+"'");
	ArrayList<peopleEntity> list = peopledb.getPeopleList();
	
	if (e2 == null) {
		out.println("로그인을 해주세요.");
	} 
	else {
		while(e2.hasMoreElements()) { 
			name = e2.nextElement();
		
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
<input type=hidden name="id" value=<%= id%>>
<a href="processLogin.jsp?id=<%=id%>&pass=<%=pass%>"> 홈으로 돌아가기 </a> 
</form>
</font>
<input type=hidden name="id" value=id>

</body>
</html>