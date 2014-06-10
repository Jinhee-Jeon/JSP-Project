<%@ tag body-content="scriptless" pageEncoding="euc-kr" 
		description="구구단(multiplication table) 출력태그"%>
<%@ attribute name="begin" %>
<%@ attribute name="end" %>
<%@ attribute name="bgcolor" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${empty(begin)}" var="bool">
		<c:set var="begin" value="2" />
	</c:if>
	
	<c:if test="${empty(end)}" var="bool">
		<c:set var="end" value="9" />
	</c:if>
	
	<c:if test="${empty(begin)}" var="bool">
		<c:set var="bgcolor" value="white" />
	</c:if>
	<center>
	<H2><jsp:doBody /></H2>
    <table width=100% border=1 cellpadding=1 bgcolor="${bgcolor}" >
	<c:forEach var="i" begin="${begin}" end="${end}" >
    	<tr align="center" >
		<c:forEach var="j" begin="1" end="9" >
       		<td>${i} * ${j} = ${i * j}</td>
		</c:forEach>
    	</tr>
	</c:forEach>
	</table>
	</center>
	<p><hr>