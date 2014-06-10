<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 인증</title>
</head>
<body>
<%String reservation_id = request.getParameter("reservation_id"); %>
<%String people_id = request.getParameter("people_id"); %>
<font size="2" face="맑은 고딕"><p>

<form method=post action="reserve.do?menu=updateReserve1">
<font color=red>  
         	비밀번호 인증 후 수정, 삭제 가능합니다.</font><p>
 비밀번호 : <input type=password name=passwd size=20 maxlength=15><p>
         	<input type=hidden name="r_id" value="<%=reservation_id%>">
         	<input type=hidden name="people_id" value="<%=people_id%>">
         	<input type="submit" value="비밀번호 확인">
	</form><p><p>
	</p></font>
</body>
</html>