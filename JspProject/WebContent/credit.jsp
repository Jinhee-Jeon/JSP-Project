<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ�</title>
</head>
<body>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<% request.setCharacterEncoding("euc-kr");
String number = request.getParameter("number");
String product_name = request.getParameter("product_name");
int cost = Integer.parseInt(request.getParameter("cost"));
Enumeration<String> e2 = session.getAttributeNames();
String people_id = "";
out.println("<font size=2 face=���� ��� color=red > ���������� ��� �Է����ּ���</font>");
if (e2 == null) {
	out.println("������ �����ϴ�.");
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
%>
<p>
<p>
<p>

<center>
<font size="2" face="���� ���">
	<h5> [���������Է�] </h5>
<form method=post name=test action="processLogin.jsp" >
<table width=50% border=2 cellpadding=1>
		<tr>
		<td>������ǰ</td> <td><%=product_name%></td>
		</tr>
		<tr>
		<td>�����ݾ�</td> <td><%=cost * Integer.parseInt(number) %>�� </td>
		</tr><tr>
		<td>ī��ȸ��</td> <td><select name="company">
			<option SELECTED value="0">�����ϼ���</option>
			<option  value="1">�ϳ�ī��</option>
			<option value="2">����ī��</option>
			<option value="3">�Ե�ī��</option> 
			<option value="4">�Ｚī��</option> 
			<option value="5">�츮ī��</option> 
			</select></td>
		</tr>
		<tr>
		<td>�Һμ���</td> <td><select name="compare">
			<option SELECTED value="0">�����ϼ���</option>
			<option  value="1">�Ͻú�</option>
			<option value="3">2����(������)</option> 
			<option value="4">3����</option> 
			<option value="5">4����</option> 
			<option value="5">5����</option> 
			<option value="5">6����</option> 
			<option value="5">7����</option> 
			<option value="5">8����</option> 
			<option value="5">9����</option> 
			<option value="5">10����</option> 
			<option value="5">11����</option> 
			<option value="5">12����</option> 
			
			</select></td>
		</tr>
		<tr><td>ī���ȣ </td> <td><input type="text" name="card_num"> <br> '-'���� �Է����ּ���. </td></tr>
		<tr><td>CVS </td> <td><input type="text" name="cvs"> </td></tr>
		<tr><td>�����ּ� </td> <td><input type="text" name="people_id" value="<%=people_id%>"><br>
			<font color=red> * E mail�� ���������� �߼۵˴ϴ�. </font> </td></tr>
			</table>
			<p>
	<input type="submit" value="�����Ϸ�">
</p>
</form>
</font>
<%
%>
</body>
</html>