<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> HANA * TOUR!</title>
	<script type="text/javascript">
	function selectChange() {
		var f=document.sForm;
		f.action = "processLogin.jsp";
		f.submit();
	}
	</script>
</head>
<body>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.util.ArrayList, univ.peopleEntity,univ.nationEntity, univ.peopleCP" %>
<jsp:useBean id="people" class="univ.peopleEntity" scope="page" />
<jsp:useBean id="nation" class="univ.nationEntity" scope="page" />
<jsp:useBean id="peopledb" class="univ.peopleCP" scope="page" />
<%  request.setCharacterEncoding("euc-kr");%>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<%  
	Enumeration<String> e = request.getParameterNames();
	String id = request.getParameter("id");  
	String cond = request.getParameter("continent");  
	String s_nation = request.getParameter("nation");
	String cvs = request.getParameter("cvs");
	int[] nId = new int[10];
	int id2=1;
	int[] cId= new int[10];
	String city = request.getParameter("city");
	String pass = request.getParameter("pass");  
	String gid="";
	String gpass="";
	int i=0;
	int k=0;
	String[] na=new String[10];
	String[] ci=new String[10];
	System.out.println("id = " + id);
	System.out.println("cond = " + cond);
	System.out.println("nation = " + s_nation);
	System.out.println("city = " + city);
	

	if(cvs!=null) {%>
		<script>alert("결제가 완료되었습니다^ㅇ^");</script>
		
	<%
		
	}
	else {
		if(cond==null) {
			if (id.equals("") || pass.equals("") ) {
				%><script> history.go(-1);</script>
			<%}
			else {
				peopledb.setOrd("select");
				peopledb.setSQL("select * from people");
				ArrayList<peopleEntity> list = peopledb.getPeopleList();
				for( peopleEntity p : list ) {
					gid = p.getId();
					if(id.equals(gid)) {
						gpass = p.getPasswd();
						peopledb.setOrd("select");
						peopledb.setSQL("select * from people where people_id='" + id+"'");
						ArrayList<peopleEntity> list2 = peopledb.getPeopleList();
						if(list2.size()==0) { %>
							<script>alert("없는 아이디입니다."); history.go(-1);</script>
						<%}
					
						session.setAttribute("id", id);
						session.setAttribute("pass", pass);
						break;
					}
				}	
				if(pass.equals(gpass)==false) { %>
					<script>alert("비밀번호가 다릅니다."); history.go(-1);</script>
			<%	}
			}
	 	}
	}

	
	%>
	<center>
	<table>
	<tr>
	 <td align="right"><a href="reserve.do?menu=selectReserve?id=<%=id%>"><font size="2"/>예약조회/확인</a> &nbsp;
	    <td align="right"><a href="join.jsp?id=<%=id%>&Ord=update"><font size="2"/>회원정보수정 </a>
	    <% if(id!=null) { %>
	       <td align="right"><a href="project.html"><font size="2"/>로그아웃 </a>
	       <%}
	   		else {%>
	   		 <td align="right"><a href="project.html"><font size="2"/>로그아웃
	   		 <%} %>
	 </tr>
	 </table>
	 </center>
	 <p>
<center>
<font size="2" face="맑은 고딕"> * 패키지상품 조회   <br>

<form name="sForm" method="post">
<table width=60% border=1 cellpadding=1>
<tr>

			<td><font size="2" face="맑은 고딕">	대륙:

			<%if(cond!=null) {
				if( Integer.parseInt(cond)==1) { %>
			
				<select name="continent" onchange="selectChange()";>
					<option value="0">선택하세요</option>
					<option SELECTED value="1">동남아</option>
					<option value="2">유럽</option>
					<option value="3">남태평양</option> 
					<option value="4">미주</option> 
					<option value="5">아시아</option> 
					</select>
			 <% }
			  else if( Integer.parseInt(cond)==2) { %>
			  <select name="continent" onchange="selectChange()";>
					<option value="0">선택하세요</option>
					<option value="1">동남아</option>
					<option SELECTED value="2">유럽</option>
					<option value="3">남태평양</option> 
					<option value="4">미주</option> 
					<option value="5">아시아</option> 
					</select>
			 <% }
			   else if(Integer.parseInt(cond)==3) { %>
			   <select name="continent" onchange="selectChange()";>
					<option value="0">선택하세요</option>
					<option value="1">동남아</option>
					<option  value="2">유럽</option>
					<option SELECTED value="3">남태평양</option> 
					<option value="4">미주</option> 
					<option value="5">아시아</option> 
					</select>
			 <% }
			 	  else if(Integer.parseInt(cond)==4) { %>
			 	  <select name="continent" onchange="selectChange()";>
					<option value="0">선택하세요</option>
					<option value="1">동남아</option>
					<option  value="2">유럽</option>
					<option  value="3">남태평양</option> 
					<option SELECTED value="4">미주</option> 
					<option value="5">아시아</option> 
					</select>
			 <% }
			 
			 	else if(Integer.parseInt(cond)==5) { %>
			 	<select name="continent" onchange="selectChange()";>
					<option value="0">선택하세요</option>
					<option value="1">동남아</option>
					<option  value="2">유럽</option>
					<option  value="3">남태평양</option> 
					<option  value="4">미주</option> 
					<option SELECTED value="5">아시아</option> 
					</select>
			 <% } 
				peopledb.setTableName("nation");
				peopledb.setSQL("select * from nation where cont_id = " + cond);
				ArrayList<nationEntity> list = peopledb.getNationList();
				for( nationEntity n : list ) {
					System.out.println("n:"+n.getName() + "nId:" + n.getId());
					na[i++] = n.getName();
					nId[k++] = n.getId();
				}	
		}
		 else{ %>
		 	<select name="continent" onchange="selectChange()";>
				<option SELECTED  value="0">선택하세요</option>
				<option value="1">동남아</option>
				<option  value="2">유럽</option>
				<option  value="3">남태평양</option> 
				<option  value="4">미주</option> 
				<option value="5">아시아</option> 
				</select>
		 <%} %>
		 > 
		 국가 : <select name="nation" onchange="selectChange()";>
				<option SELECTED value="0">선택하세요</option>
			<%if(s_nation==null || Integer.parseInt(s_nation)==0) { %>
				<%for(int j=0; j<i; j++) {%>
				<option value="<%=j+1%>"><%=na[j]%></option>
			<%	}
			}
			
			else {
				k=0;
				for(int j=1; j<=i; j++) {
					if(Integer.parseInt(s_nation)==j) {
						id2=j-1;
					%>
						<option SELECTED value="<%=j%>"><%=na[j-1]%></option>
					<%}
					else { %>
						<option value="<%=j%>"><%=na[j-1]%></option>
			<%		}
				}
				i=0;
				peopledb.setTableName("city");
				peopledb.setSQL("select * from city where nation_id = " + nId[id2]);
				ArrayList<nationEntity> list = peopledb.getNationList();
				for( nationEntity c : list ) {
					System.out.println("c:"+c.getName() + "cId:" + c.getId());
					ci[i++] = c.getName();
					cId[k] = c.getId();
					k++;
				}	
			
			}%>
		  </select>
		 
		>  
	 도시 : <select name="city" onchange="selectChange()";>
				<option SELECTED value="0">선택하세요</option>
			<%if(city==null) { %>
				<%for(int j=0; j<i; j++) {%>
				<option value="<%=j+1%>"><%=ci[j]%></option>
			<%	}
			}
			
			else {
				for(int j=1; j<=i; j++) {
					if(Integer.parseInt(city)==j) { 
						id2=j;
							%>
						<option SELECTED value="<%=j%>"><%=ci[j-1]%></option>
					<%}
					else { %>
						<option value="<%=j%>"><%=ci[j-1]%></option>
			<%		}
				}
			
			}%>
		  </select>
			
		<form method=post action="select_product.jsp">
		<input type="submit" value="검색">
		<input type=hidden name="id" value="<%=id%>">
		<input type=hidden name="city_id" value="<%=cId[id2-1] %>">
		</form>
		</td></tr>
		</center>
		</table>
	

	</p>
</form>


 <% if(city!=null) {%>	
		<jsp:include page="select_product.jsp" />
 <%} %>
	</font>
</body>
</html>