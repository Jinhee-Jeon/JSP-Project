<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품조회결과</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%@ page import="java.util.ArrayList,univ.productEntity, univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<% String id = request.getParameter("city_id");  
Enumeration<String> e2 = session.getAttributeNames();
String people_id="";
String pass="";


	int p_id=0;
	String name="";
	int cost=0;
	
	peopledb.setOrd("select");
	peopledb.setSQL("select * from product where city_id =" + id);
	ArrayList<productEntity> list = peopledb.getProductList(); 
	
	if(id!=null && list.size()!=0) {%>
		
		<center>
		<h5> [조회결과] </h5>
		<table width=80% border=1 cellpadding=1>
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
	}

	if (e2 == null) {
		out.println("로그인을 해주세요.");
	} 
	else {
		
		while(e2.hasMoreElements()) { 
			name = e2.nextElement();
		
			if(name.equalsIgnoreCase("id")) {
				String value = (String) session.getAttribute(name); 
				people_id = value;
			}
			else if(name.equalsIgnoreCase("pass")){
				String value = (String)session.getAttribute(name); 
				pass=value;
			}
		}
	}


		%>
       </table>
  <a href="processLogin.jsp?id=<%=people_id%>&pass=<%=pass %>"> 홈으로 돌아가기 </a> 
</center>

</body>
</html>