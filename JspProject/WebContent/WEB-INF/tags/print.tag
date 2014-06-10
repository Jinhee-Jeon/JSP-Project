<%@ tag body-content="scriptless" pageEncoding="euc-kr" 
		description="���̺� student ���ڵ� ����±�"
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
       <td align=center><b>���೯¥ </b></td>
	    <td align=center><b>�����ο���</b></td>
       <td align=center><b>���ǹ�ȣ</b></td>
        <td align=center><b>����</b></td>
       <td align=center><b>��ǰ�̸�</b></td>
       <td align=center><b>����</b></td>
       <td align=center><b>�¼���ȣ</b></td>
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
		
