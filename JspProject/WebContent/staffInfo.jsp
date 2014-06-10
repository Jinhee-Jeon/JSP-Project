<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인솔자정보조회</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity,univ.psEntity, univ.airschedule,univ.staffEntity ,univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
String staff_id = request.getParameter("staff_id");  
String product_id = request.getParameter("product_id");  
System.out.println("staff_id = " + staff_id);
System.out.println("product_id = " + product_id);
String click = request.getParameter("click");  
Enumeration<String> e2 = session.getAttributeNames();
String id="";
String pass="";
peopledb.setSQL("select * from staff where staff_id =" +staff_id);
ArrayList<staffEntity> list3 = peopledb.getStaffList(); 
System.out.println("click = " + click);
%>

 <%
 if(click==null) {

	for( staffEntity s : list3 ) { %>
	<center>
	<h5> [인솔자 정보 조회] </h5>
	<font size="2" face="맑은 고딕">
		<table width=30% border=1 cellpadding=1>
			<tr><td>이름</td> <td><input type="text" size=10 name="name" value=<%=s.getName() %>></td></tr>
			<tr><td>전화번호</td> <td><input type="text" size=10 value=<%=s.getPhone() %>></td></tr>
			<tr><td>경력</td> <td><input type="text" size=10 value=<%=s.getCareer() %>>year</td></tr>
			<tr><td>나이</td> <td><input type="text" size=10 value=<%=s.getAge() %>></td></tr>
			<tr>
			
				<% if(s.getGender().equals("f")) {%>
					<td>성별 </td> <td> <input type="radio" name="gender" value="f" checked> 여자
									<input type="radio" name="gender" value="m"> 남자 </td>
				<%}
				else {%>
				<td>성별 </td> <td> <input type="radio" name="gender" value="f"> 여자
									<input type="radio" name="gender" value="m"  checked> 남자 </td></tr>
				<%} %>
		</table> 
		</font>
		<form method=post name=test action="staffInfo.jsp" >
		<input type=hidden name="click" value="true">
		<input type=hidden name="product_id" value=<%=product_id%>>
		<input type=hidden name="staff_id" value=<%=staff_id%>>
		 <input type="submit" value="인솔상품 내역 조회"> 
		</form>
			</center>
	<%} 
	}
	else if(click.equals("true")) {
		for( staffEntity s : list3 ) { %>
	<p>
	<center>
	<font size="2" face="맑은 고딕"> <h5> [인솔자 정보 조회] </h5>
		<table width=30% border=1 cellpadding=1>
			<tr><td>이름</td> <td><input type="text" size=10 name="name" value=<%=s.getName() %>></td></tr>
			<tr><td>전화번호</td> <td><input type="text" size=10 value=<%=s.getPhone() %>></td></tr>
			<tr><td>경력</td> <td><input type="text" size=10 value=<%=s.getCareer() %>>year</td></tr>
			<tr><td>나이</td> <td><input type="text" size=10 value=<%=s.getAge() %>></td></tr>
			<tr>
			
				<% if(s.getGender().equals("f")) {%>
					<td>성별 </td> <td> <input type="radio" name="gender" value="f" checked> 여자
									<input type="radio" name="gender" value="m"> 남자 </td>
				<%}
				else {%>
				<td>성별 </td> <td> <input type="radio" name="gender" value="f"> 여자
									<input type="radio" name="gender" value="m"  checked> 남자 </td></tr>
				<%} %>
		</table> 
		</font>
		</center>
<%		} 

	peopledb.setSQL("select * from product where staff_id =" +staff_id);
	ArrayList<productEntity> list = peopledb.getProductList(); 
	%>
		<center>
		<font size="2" face="맑은 고딕">
		<table width=50% border=1 cellpadding=1>
		<tr>
		   <td align=center><b>상품번호</b></td>
		    <td align=center><b>사진</b></td>
	       <td align=center><b>이름</b></td>
	       <td align=center><b>가격</b></td>
	       </tr>
	     <%  
		for( productEntity p : list ) {
			%>
			<tr> 
		       <td align=center><a href="product_schedule.jsp?id=<%=p.getId()%>"><%= p.getId()%></a></td>
		       <td align=center><img src="jspProject Image/<%=p.getPicture()%>"></td>
		       <td align=center><a href="product_schedule.jsp?id=<%=p.getId()%>"><%=p.getName() %></td>
		       <td align=center><%=p.getCost() %></td>
		       </tr>
		<%}
	     %>
	     </table>
	   </font>
	     </center>
	<%
}
 if (e2 == null) {
 	out.println("로그인을 해주세요.");
 } 
 else {
 	while(e2.hasMoreElements()) { 
 		String name = e2.nextElement();
 	
 		if(name.equalsIgnoreCase("id")) {
 			String value = (String) session.getAttribute(name); 
 			id = value;
 		}
 		else if(name.equalsIgnoreCase("pass")){
 			String value = (String)session.getAttribute(name); 
 			pass=value;
 		}
 	}
 }

%>
<center>
<font size="2" face="맑은 고딕">
	<a href="product_schedule.jsp?id=<%=product_id%>&staff_id=<%=staff_id%>"> 이전화면 </a> &nbsp;
		<a href="processLogin.jsp?id=<%=id %>&pass=<%=pass%>"> 홈으로 돌아가기 </a> 
	
	</font>
	</center>



</body>
</html>