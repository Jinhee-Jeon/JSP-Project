<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ����</title>
</head>
<script type="text/javascript">
	function selectChange() {
		var f=document.sForm;
		f.action = "updatePassport.jsp";
		f.submit();
	}
	</script>
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
<font size="2" face="���� ���">
<p>
<%
String reservation_id = request.getParameter("reservation_id");
String number = request.getParameter("number");
String res = request.getParameter("res");
System.out.println("isPasswd : " + res);
int i=0;
int n=0;
System.out.println("�����ȣ = "+ reservation_id);
%>
<form name="sForm" method="post">
<font size="2" face="���� ���">
<%if(res.equals("true")) { %>
	�����ο� ���� : 
	<%if(number==null) { %>
	<select name="number" onchange="selectChange()";>
		<option SELECTED value="0">�����ϼ���</option>
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
			<option value="0">�����ϼ���</option>
			<option SELECTED value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option> 
			<option value="4">4</option> 
			<option value="5">5</option> 
			</select>
	<%}	else if( Integer.parseInt(number)==2) { %>
			<select name="number" onchange="selectChange()";>
			<option value="0">�����ϼ���</option>
			<option  value="1">1</option>
			<option SELECTED value="2">2</option>
			<option value="3">3</option> 
			<option value="4">4</option> 
			<option value="5">5</option> 
			</select>
	<%}
		else if( Integer.parseInt(number)==3) { %>
				<select name="number" onchange="selectChange()";>
				<option value="0">�����ϼ���</option>
				<option  value="1">1</option>
				<option  value="2">2</option>
				<option SELECTED value="3">3</option> 
				<option value="4">4</option> 
				<option value="5">5</option> 
				</select>
		<%}	
	
		else if( Integer.parseInt(number)==4) { %>
				<select name="number" onchange="selectChange()";>
				<option value="0">�����ϼ���</option>
				<option  value="1">1</option>
				<option  value="2">2</option>
				<option  value="3">3</option> 
				<option SELECTED value="4">4</option> 
				<option value="5">5</option> 
				</select>
		<%}
			
		else if( Integer.parseInt(number)==5) { %>
		<select name="number" onchange="selectChange()";>
		<option value="0">�����ϼ���</option>
		<option  value="1">1</option>
		<option  value="2">2</option>
		<option  value="3">3</option> 
		<option  value="4">4</option> 
		<option SELECTED value="5">5</option> 
		</select>
	<%	}
	}
	%> <p>
<input type=hidden name="reservation_id" value="<%=reservation_id%>">
</font>
</form>
<form method=post action="updateAll.jsp">
<%

if(number !=null) {%>
	<font size="2" face="���� ���" color=red > *���������� �Է����ּ���!!!  </font> <p>
<%	if(Integer.parseInt(number)!=0) {
		n=Integer.parseInt(number);
		
		for(i=1; i<=n; i++) { %>
		
		<font size="2" face="���� ���">
		<%=i %>.
			<table width=30% border=1 cellpadding=1>
				<tr><td>�̸�</td> <td><input type="text" size=10 name="name<%=i%>"></td></tr>
				<tr><td>�����̸�</td> <td><input type="text" size=10 name = "eng_name<%=i%>"></td></tr>
				<tr><td>���ǹ�ȣ</td> <td><input type="text" size=20 name = "pass_num<%=i%>"></td></tr>
				<tr><td>�������</td> <td><select name="year<%=i%>"> 
								   <option>1990</option>
								   <option>1991</option>
								   <option>1992</option>
								   <option>1993</option>
								   <option>1994</option>
								   <option>1995</option>
								 </select>
								  �� 
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
						   ��
						   
						  <select name="day<%=i%>">
					 <%for(int k = 1; k<=31; k++){ %>
						 <option><%=k %></option>
					  <%} %>
						
						</select>�� 
					</td></tr>
				<tr><td>���Ǹ�����</td> <td><select name="exyear<%=i%>"> 
								   <option>2013</option>
								   <option>2014</option>
								   <option>2015</option>
								   <option>2016</option>
								   <option>2017</option>
								   <option>2018</option>
								 </select>
								  �� 
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
						   ��
						  <select name="exday<%=i%>">
					 <%for(int k = 1; k<=31; k++){ %>
						 <option><%=k %></option>
					  <%} %>
						
						</select>�� 
			</table> 
			</font>
			<p>
		<%
		}
	}
}


%>
<p>

<input type=hidden name="Ord" value="passport">
<input type=hidden name="reservation_id" value="<%=reservation_id%>">
	<input type=hidden name="number" value="<%=number%>">
	<input type="submit" value="�����Ϸ�">
	</form>
	
	<%
}	
	else {
	out.println("��й�ȣ ������ �����Ͽ� �����Ͻ� �� �����ϴ�.");
	%>
	<p><a href="project.html"> Ȩ���� ���ư��� </a> 
<%}
	%>
</body>
</html>