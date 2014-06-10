<%@ tag body-content="scriptless" pageEncoding="euc-kr" 
		description="테이블 student 레코드 출력태그"
		import="java.util.ArrayList" %>

<%@ attribute name="bgcolor" required="true" %>
<%@ attribute name="border" required="true" %>
<%@ attribute name="list" required="true" type="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="count" value="<%= list.size() %>" />
<c:if test="${count > 0}" var="bool" >

	<center>
	<H2><jsp:doBody /></H2>
    <table width=100% border="${border}" cellpadding=1>
    <tr bgcolor="${bgcolor}">
       <td align=center><b>예약날짜 </b></td>
	    <td align=center><b>예약인원수</b></td>
       <td align=center><b>여권번호</b></td>
        <td align=center><b>사진</b></td>
       <td align=center><b>상품이름</b></td>
       <td align=center><b>가격</b></td>
       <td align=center><b>좌석번호</b></td>
       </tr>

	<c:forEach var="r" items="${list}" >
    <tr>
       <td align=center>${r.reserve_data}</td>
       <td align=center>${r.people_num}</td>
       <td align=center>${r.passport_num}</td>
       <td align=center><img src="jspProject Image/${r.product_id}.jpg"></td>
       <td align=center>${r.product_name}</td>
       <td align=center>${r.cost}</td>
       <td align=center>${r.seat}</td>
    </tr>
 
	</c:forEach>
	</table>
	</center>

</c:if>
		
