<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제하기</title>
</head>
<body>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<% request.setCharacterEncoding("euc-kr");
String number = request.getParameter("number");
String product_name = request.getParameter("product_name");
int cost = Integer.parseInt(request.getParameter("cost"));
Enumeration<String> e2 = session.getAttributeNames();
String people_id = "";
out.println("<font size=2 face=맑은 고딕 color=red > 결제정보를 모두 입력해주세요</font>");
if (e2 == null) {
	out.println("세션이 없습니다.");
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
<font size="2" face="맑은 고딕">
	<h5> [결제정보입력] </h5>
<form method=post name=test action="processLogin.jsp" >
<table width=50% border=2 cellpadding=1>
		<tr>
		<td>결제상품</td> <td><%=product_name%></td>
		</tr>
		<tr>
		<td>결제금액</td> <td><%=cost * Integer.parseInt(number) %>원 </td>
		</tr><tr>
		<td>카드회사</td> <td><select name="company">
			<option SELECTED value="0">선택하세요</option>
			<option  value="1">하나카드</option>
			<option value="2">국민카드</option>
			<option value="3">롯데카드</option> 
			<option value="4">삼성카드</option> 
			<option value="5">우리카드</option> 
			</select></td>
		</tr>
		<tr>
		<td>할부선택</td> <td><select name="compare">
			<option SELECTED value="0">선택하세요</option>
			<option  value="1">일시불</option>
			<option value="3">2개월(무이자)</option> 
			<option value="4">3개월</option> 
			<option value="5">4개월</option> 
			<option value="5">5개월</option> 
			<option value="5">6개월</option> 
			<option value="5">7개월</option> 
			<option value="5">8개월</option> 
			<option value="5">9개월</option> 
			<option value="5">10개월</option> 
			<option value="5">11개월</option> 
			<option value="5">12개월</option> 
			
			</select></td>
		</tr>
		<tr><td>카드번호 </td> <td><input type="text" name="card_num"> <br> '-'없이 입력해주세요. </td></tr>
		<tr><td>CVS </td> <td><input type="text" name="cvs"> </td></tr>
		<tr><td>메일주소 </td> <td><input type="text" name="people_id" value="<%=people_id%>"><br>
			<font color=red> * E mail로 결제정보가 발송됩니다. </font> </td></tr>
			</table>
			<p>
	<input type="submit" value="결제완료">
</p>
</form>
</font>
<%
%>
</body>
</html>