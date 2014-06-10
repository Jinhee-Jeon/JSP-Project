<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String cvs = request.getParameter("cvs");
	String result3 = (String) session.getAttribute("result3");
	
	if(result3.equals("creditError")) {
		out.println("<font size=2 face=맑은 고딕 color=red > 결제정보를 모두 입력해주세요</font>");
		pageContext.include("credit.jsp");
	}
	else {
		pageContext.forward("processLogin.jsp?cvs="+cvs);
	}
	
	
%>
</body>
</html>