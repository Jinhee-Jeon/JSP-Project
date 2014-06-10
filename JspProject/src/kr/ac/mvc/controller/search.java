package kr.ac.mvc.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.mvc.model.SearchBean;

public class search extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session= request.getSession(true);
		
		String s = (String) session.getAttribute("id");
		
		SearchBean sb = new SearchBean(s);
		request.setAttribute("resultSearch", sb.getCheckUser());
		System.out.println("resultSearch : " + sb.getCheckUser());

		// 처리 결과가 저장된 request를 전송하며 동시에 뷰인 confirm2.jsp로 제어 이동
		RequestDispatcher view = request.getRequestDispatcher("confirm2.jsp");
		view.forward(request, response);
	}

	// POST 요청 역시 doGet()에서 처리하도록 함.
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
