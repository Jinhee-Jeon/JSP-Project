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
	String p_id = request.getParameter("p_id");
	String number = request.getParameter("number");
	
	String result2 = (String) session.getAttribute("result2");
	
	if(result2.equals("seatError")) {
		out.println("좌석을 선택해주세요.");
		pageContext.include("air_reservation.jsp?p_id="+p_id+"&&number="+number);
	}
	else {
		String seatData = request.getParameter("seat_num");
		pageContext.forward("end_reservation.jsp?p_id="+p_id+"&&number="+number+"&&seat_num="+seatData);
	}
	
	
%>
</body>
</html>