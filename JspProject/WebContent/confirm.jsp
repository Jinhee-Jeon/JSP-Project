<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약 조회/확인</title>
</head>
<body>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@ page import="java.util.Enumeration,java.util.Date"%>
<%@ page
	import="java.util.ArrayList,univ.productEntity,univ.rev,univ.psEntity,univ.reservation,univ.passport,univ.airschedule,univ.reservationInfo,univ.staffEntity,univ.peopleEntity,univ.nationEntity,univ.peopleCP"%>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="staff" class="univ.staffEntity" scope="page" />
<jsp:useBean id="product" class="univ.productEntity" scope="page" />
<jsp:useBean id="airschedule" class="univ.airschedule" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<font size="2" face="맑은 고딕">
<p>
<h5>[예약내역조회]</h5>
<p>
<%
	Enumeration<String> e2 = session.getAttributeNames();

	int[] schedule_id = new int[20];
	String people_id = "";
	int result = 0;
	int[] reservation_id = new int[20];
	String p_name = "";
	String pass = "";
	int i = 0;
	//String order = request.getParameter("order");
	if ((String)session.getAttribute("resultSearch")==null) {
		String reserve_id = request.getParameter("reserve_id");
		reserve_id="67";
		%>
		
		<center>
		<form method=post action="reserve.do?menu=deleteReserve">
		<table width=100% border=1 cellpadding=1>
		<tr>
			<td align=center><b>선택 </b></td>
			<td align=center><b>예약날짜 </b></td>
			<td align=center><b>예약인원수</b></td>
			<td align=center><b>여권번호</b></td>
			<td align=center><b>상품이름</b></td>
			<td align=center><b>항공사</b></td>
			<td align=center><b>좌석번호</b></td>
			<td align=center><b>출발</b></td>
			<td align=center><b>도착</b></td>
			<td align=center><b></b></td>
		</tr>
		
	<%	peopledb.setSQL("select r.*,air.*,p.name,p.cost from airschedule air inner join reservation r on air.product_id = r.product_id "
								+ "inner join product p on p.product_id = air.product_id where r.reserve_id =67 and air.schedule_id= 1");
		ArrayList<reservationInfo> list3 = peopledb.getInfo();
		System.out.println(peopledb.getSQL());
		
		for (reservationInfo ri : list3) {

			p_name = ri.getAirline_name();
			p_name = p_name.concat(".gif");
%>
<tr>
	<td align=center><input type="checkbox" name="reservation_id"
		value="<%=reserve_id%>"></td>
	<td align=center><%=ri.getReserve_date()%></td>
	<td align=center><a
		href="passCheck.jsp?people_id=<%=ri.getPeople_id()%>&&reservation_id=<%=reserve_id%>"><%=ri.getPeople_num()%></a></td>
	<td align=center><a
		href="reserve.do?menu=updateReserve1&&r_id=<%=reserve_id%>"><%=ri.getPassport_num()%></a></td>
	<td align=center><%=ri.getName()%></td>
	<td align=center><img src="jspProject Image/<%=p_name%>"><br>
	</td>
	<td align=center><a
		href="reserve.do?menu=updateReserve2&&r_id=<%=reserve_id%>&number=<%=ri.getSeat()%>"><%=ri.getSeat()%></a></td>
	<td align=center><%=ri.getArrival_date()%> <%=ri.getArrival_time()%></td>
	<td align=center><%=ri.getDeparture_date()%> <%=ri.getDeparture_time()%></td>
</tr>
</table>
</form>
</center>
<%
	}	%>
<%} else {

		while (e2.hasMoreElements()) {
			String name = e2.nextElement();
			if (name.equalsIgnoreCase("id")) {
				String value = (String) session.getAttribute(name);
				people_id = value;
			} else if (name.equalsIgnoreCase("pass")) {
				String value = (String) session.getAttribute(name);
				pass = value;
			} else if (name.equalsIgnoreCase("result")){
				//String value = (String) session.getAttribute(name);
				//schedule_id[i++] = Integer.parseInt(value);
			}
			else if (name.equalsIgnoreCase("result2")){
				//String value = (String) session.getAttribute(name);
				//schedule_id[i++] = Integer.parseInt(value);
			}
			else{
				
				String value = (String) session.getAttribute(name);
				System.out.println("value : " + value + ", name : " + name);
				schedule_id[i++] = Integer.parseInt(value);
			}
		}
	
		i = 0;
		peopledb.setOrd("select");
		peopledb.setSQL("select * from reservation where people_id = '"
				+ people_id + "'");
		ArrayList<reservation> list = peopledb.getReservation();
		for (reservation r : list) {
			reservation_id[i++] = r.getReserve_id();
		}
		result = peopledb.getResult();
		System.out.println("result = " + result);
		System.out.println("i= " + i);
%>

<center>
<form method=post action="deleteReservation.jsp">
<table width=100% border=1 cellpadding=1>
	<tr>
		<td align=center><b>선택 </b></td>
		<td align=center><b>예약날짜 </b></td>
		<td align=center><b>예약인원수</b></td>
		<td align=center><b>여권번호</b></td>
		<td align=center><b>상품이름</b></td>
		<td align=center><b>항공사</b></td>
		<td align=center><b>좌석번호</b></td>
		<td align=center><b>출발</b></td>
		<td align=center><b>도착</b></td>
		<td align=center><b></b></td>
	</tr>

<sql:setDataSource var="ds" dataSource="jdbc/mysql"  />
<sql:query var="rs" dataSource="${ds}" sql="select * from board" />
<!--  
<c:forEach var="brdRow" begin="0" items="${rs.rows}"> 
${brdRow.id}, ${brdRow.name}, ${brdRow.title}, ${brdRow.regdate} <br> 
</c:forEach> 
-->
	<%
		if (result > 1) {
			for (int j = 0; j < i; j++) {
				peopledb
						.setSQL("select r.*,air.*,p.name,p.cost from airschedule air inner join reservation r on air.product_id = r.product_id "
								+ "inner join product p on p.product_id = air.product_id where r.reserve_id = "
								+ reservation_id[j]
								+ " and air.schedule_id = "
								+ schedule_id[j]);
				ArrayList<reservationInfo> list2 = peopledb.getInfo();
				System.out.println(peopledb.getSQL());
	%>
	<%
		for (reservationInfo ri : list2) {

					p_name = ri.getAirline_name();
					p_name = p_name.concat(".gif");
	%>
	<tr>
		<td align=center><input type="checkbox" name="reservation_id"
			value="<%=reservation_id[j]%>"></td>
		<td align=center><%=ri.getReserve_date()%></td>
		<td align=center><a
			href="confirm.jsp?order=insertPass"</a></td>
		<td align=center><a
			href="updatePassport.jsp?reservation_id=<%=reservation_id[j]%>&number=<%=ri.getPeople_num()%> "><%=ri.getPassport_num()%></a></td>
		<td align=center><%=ri.getName()%></td>
		<td align=center><img src="jspProject Image/<%=p_name%>"><br>
		</td>
		<td align=center><a
			href="updateSeat.jsp?reservation_id=<%=reservation_id[j]%>&number=<%=ri.getSeat()%>"><%=ri.getSeat()%></a></td>
		<td align=center><%=ri.getArrival_date()%> <%=ri.getArrival_time()%></td>
		<td align=center><%=ri.getDeparture_date()%> <%=ri.getDeparture_time()%></td>
	</tr>
	<%
		}
			}

		} else { //예약정보가 하나뿐임! 
			System.out.println("reservation_id : " + reservation_id[0] + ", schedule_id : " + schedule_id[0]);
			peopledb
					.setSQL("select r.*,air.*,p.name,p.cost from airschedule air inner join reservation r on air.product_id = r.product_id "
							+ "inner join product p on p.product_id = air.product_id where r.reserve_id = "
							+ reservation_id[0]
							+ " and air.schedule_id = "
							+ schedule_id[0]);
			ArrayList<reservationInfo> list2 = peopledb.getInfo();
	%>
	<%
		for (reservationInfo ri : list2) {
				p_name = ri.getAirline_name();
				p_name = p_name.concat(".gif");
	%>
	<tr>
		<td align=center><input type="checkbox" name="reservation_id"
			value="<%=reservation_id%>"></td>
		<td align=center><%=ri.getReserve_date()%></td>
		<td align=center><a
			href="confirm.jsp?order=insertPass"</a></td>
		<td align=center><a
			href="updatePassport.jsp?reservation_id=<%=reservation_id[0]%>"><%=ri.getPassport_num()%></a></td>
		<td align=center><%=ri.getName()%></td>
		<td align=center><img src="jspProject Image/<%=p_name%>"><br>
		</td>
		<td align=center><a
			href="updateSeat.jsp?reservation_id=<%=reservation_id%>&number=<%=ri.getSeat()%>"><%=ri.getSeat()%></a></td>
		<td align=center><%=ri.getArrival_date()%> <%=ri.getArrival_time()%></td>
		<td align=center><%=ri.getDeparture_date()%> <%=ri.getDeparture_time()%></td>
	</tr>
	<%
		}
		}
}
	%> 
<p><center><input type="submit" value="예약 취소">
</form> &nbsp;
<a href="processLogin.jsp?id=<%=people_id%>&pass=<%=pass%>"> 홈으로
돌아가기 </a></center></font></center>
</body>
</html>