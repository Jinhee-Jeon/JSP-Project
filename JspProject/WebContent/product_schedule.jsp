<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ����ȸ</title>

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
<center>	<h5> [��ǰ����ȸ] </h5>
<% request.setCharacterEncoding("euc-kr"); %>
<%
Enumeration<String> e2 = session.getAttributeNames();
String id="";
String pass="";

int product_id = 0;
String p_id = request.getParameter("id"); 
String staff_name="";

peopledb.setSQL("select * from product_schedule where product_id = " + p_id);
ArrayList<psEntity> list = peopledb.getPsList();


peopledb.setOrd("select");
peopledb.setSQL("select * from product where product_id =" + p_id);
ArrayList<productEntity> list2 = peopledb.getProductList(); 

%>
<center>
<font size="2" face="���� ���">
<table width=80% border=1 cellpadding=1>
<tr>

    <td align=center><b>����</b></td>
   <td align=center><b>������</b></td>
   </tr>
 <%  
for( productEntity p : list2 ) {
	int staff_id = p.getStaff();
	System.out.println("staff_id = " + staff_id);
	peopledb.setSQL("select * from staff where staff_id =" + staff_id);
	ArrayList<staffEntity> list3 = peopledb.getStaffList(); 
	for( staffEntity s : list3 ) {
		staff_name = s.getName();
		break;
	}
	
	product_id = p.getProduct_id();
	System.out.println("product_id =" + product_id);
	%>
	<tr> 
       <td align=center><img src="jspProject Image/<%=p.getPicture()%>"></td>
       <td align=center><%=p.getName() %><br> 
      	 ���� : <%=p.getCost() %><br>
      	 ���ϸ��� : <%=p.getCost()*0.01 %>�� ���� <br>
      	 ����Ⱓ : <%=list.size()-1%>�� <%=list.size()%>�� <br>
      	 �μ��� : <a href="staffInfo.jsp?staff_id=<%=staff_id%>&product_id=<%=product_id%>"><%=staff_name%></a> ���� �����մϴ�. 
      	 
      	 </td>
       
       </tr>
	
<%}
%>

</table>
</font>


<%
if(p_id!=null && list.size()!=0) {%>

<center>
<font size="2" face="���� ���">
<table width=80% border=1 cellpadding=1>
<tr>
   <td align=center><b>Day</b></td>
    <td align=center><b>��������</b></td>
   </tr>
 <%  
for( psEntity p : list ) {
	%>
	<tr> 
     	<td align=center><%=p.getDay() %>��</td>
       <td align=center> <br><font color=purple size = "3" ><%=p.getName() %> <br></font><br>
       <img src="jspProject Image/<%=p.getPicture()%>"><br>
       <%=p.getContents() %></td>
       </tr>
	
<%}
}
%>
</table>
<center>
<font size="2" face="���� ���">
<table width=80% border=1 cellpadding=1>
<tr>

    <td align=center><b>��/�����ð�</b></td>
     <td align=center><b>�װ�</b></td>
      <td align=center><b>�������</b></td>
   </tr>
  
    <%
	peopledb.setSQL("select * from airschedule where product_id=" + product_id);
	ArrayList<airschedule> slist = peopledb.getAirschedule(); 
	String p_name="";
	int schedule_id = 0;
	
	
	

	for( airschedule a : slist ) { 
		p_name =a.getAirline_name();
		p_name = p_name.concat(".gif");
		schedule_id = a.getSchedule_id();
		session.setAttribute(schedule_id+"", schedule_id+"");
		
		System.out.println("p_name = " + p_name);%>
		<tr> 
       <td align=center> <font color=blue><%=a.getDeparture_date() %> <%=a.getDeparture_time() %>��� <br>
       <font color=hotpink><%=a.getArrival_date() %> <%=a.getArrival_time() %>���� </font></td>
       <td align=center> <img src="jspProject Image/<%=p_name%>"><br> </td>
       <td align=center> <a href="reserve.do?menu=doReserve&&p_id=<%=product_id%>">�����ϱ� </a></td>
       </tr>
	<%}
	
	if (e2 == null) {
		out.println("�α����� ���ּ���.");
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

    %></table>
<a href="processLogin.jsp?id=<%=id%>&pass=<%=pass %>"> Ȩ���� ���ư��� </a>
</center>
</font>


</body>
</html>