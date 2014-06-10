package kr.ac.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.mvc.model.SearchBean;

import univ.reservation;
import univ.peopleCP;

public class reserve extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		String p_id ="";
		String r_id ="";
		String number="";
		String id="";
		String password="";
		String people_id="";
		
		if(menu.equals("doReserve")) {
			p_id= request.getParameter("p_id");
			peopleCP p = new peopleCP();
			int cnt =  p.getReservationCnt(Integer.parseInt(p_id));
			request.setAttribute("cnt",cnt+"");
			RequestDispatcher view = request.getRequestDispatcher("reservation.jsp?id="+p_id);
			view.forward(request, response);
		}
		
		else if(menu.equals("selectReserve")) {
			id= request.getParameter("id");
			
			SearchBean sb = new SearchBean(id);
			request.setAttribute("resultSearch", sb.getCheckUser());
			System.out.println("resultSearch : " + sb.getCheckUser());
			
			RequestDispatcher view = request.getRequestDispatcher("confirm.jsp");
			view.forward(request, response);
		}
		
		else if(menu.equals("deleteReserve")) {
			password= request.getParameter("passwd");
			people_id= request.getParameter("people_id");
			r_id= request.getParameter("reservation_id");
			
			peopleCP p = new peopleCP();
			String res=p.isPasswd(people_id, password);
			
			RequestDispatcher view = request.getRequestDispatcher("deleteReservation.jsp?reservation_id="+r_id+"&&res="+res);
			view.forward(request, response);
		}
		
		else if(menu.equals("updateReserve1")) { //passport update
			password= request.getParameter("passwd");
			people_id= request.getParameter("people_id");
			
			r_id= request.getParameter("r_id");
			
			peopleCP p = new peopleCP();
			String res=p.isPasswd(people_id, password);
		
			RequestDispatcher view = request.getRequestDispatcher("updatePassport.jsp?reservation_id="+r_id+"&&res="+res);
			view.forward(request, response);
		}
		else { //seat update
			password= request.getParameter("passwd");
			people_id= request.getParameter("people_id");
			r_id= request.getParameter("r_id");
			number= request.getParameter("number");
	
			peopleCP p = new peopleCP();
			String res=p.isPasswd(people_id, password);
			
			RequestDispatcher view = request.getRequestDispatcher("updateSeat.jsp?reservation_id="+r_id+"&&res="+res);
			view.forward(request, response);
		}
	}

	// POST 요청 역시 doGet()에서 처리하도록 함.
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
