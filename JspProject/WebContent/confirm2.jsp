<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resultSearch" value="${requestScope.resultSearch}" />
<c:choose> 
  <c:when test="${resultSearch=='noUser'}" > 
	<center><font size="2" face="맑은 고딕"><p>
	<h5>[예약내역조회]</h5><p>
	<form method=post action="confirm.jsp">
	예약 번호 입력 : <input id ="reserve_id" name=reserve_id  type="text"/>
	<input type="submit" value="예약 조회">
	</form><p><p>
	<a href="project.html"> 홈으로 돌아가기 </a>
	</center>
  </c:when> 
  <c:otherwise> 
	<jsp:include page="confirm.jsp" />
  </c:otherwise> 
</c:choose> 

</body>
</html>