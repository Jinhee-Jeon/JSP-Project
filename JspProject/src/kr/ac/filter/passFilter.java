package kr.ac.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import univ.*;


public class passFilter implements Filter{

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
							throws IOException, ServletException {
		String[] arr = new String[3];
        System.out.println("checkFilter : start");        
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        String result="";
      		
        String name = request.getParameter("name1");
    	String eng_name = request.getParameter("eng_name1");
    	String pass_num = request.getParameter("pass_num1");
    	String p_id = request.getParameter("p_id");
    	String number = request.getParameter("number");
    	
    	arr[0] = name;
    	arr[1] = eng_name;
    	arr[2] = pass_num;
    	
    	int i=0;
    	for(i=0; i<3; i++) {
    		System.out.println("arr : " + arr[i]);
    		if(arr[i].equals("")) {
    			result = "passportError";
    			break;
    		}
    	}
    	if(i==3) result="sucess";
    	
    	session.setAttribute("result", result);
         	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/passport.jsp?p_id="+p_id+"&&number=" + number);
        dispatcher.forward(request, response);
        
        System.out.println("checkFilter : exit");
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
