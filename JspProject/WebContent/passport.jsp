<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� Ȯ��!</title>
</head>
<body>
<%
	String p_id = request.getParameter("p_id");
	String number = request.getParameter("number");
	String result = (String) session.getAttribute("result");
	
	if(result.equals("passportError")) {
		out.println("<font size=2 face=���� ��� color=red > ���������� ��� �Է����ּ���!!!</font>");
		pageContext.include("reservation.jsp?p_id="+p_id+"&&number="+number);
	}
	else {
		pageContext.forward("air_reservation.jsp?p_id="+p_id+"&&number="+number);
	}
	
	
%>
</body>
</html>