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

public class seatFilter implements Filter{

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
							throws IOException, ServletException {
		
        System.out.println("seatFilter : start");        
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        String result2="";
      		
        String p_id = request.getParameter("p_id");
    	String number = request.getParameter("number");
    	String seatData= request.getParameter("seat_num");
    
    	System.out.println("seatData : " + seatData);
    	if(seatData==null) {
    		result2="seatError";
    		
        	session.setAttribute("result2", result2);
             	
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/seat.jsp?p_id="+p_id+"&&number=" + number);
            dispatcher.forward(request, response);
            
    	}
    	else  {
    		result2="sucess";
    		
        	session.setAttribute("result2", result2);
             	
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/seat.jsp?p_id="+p_id+"&&number=" + number+"&&seat_num="+seatData);
            dispatcher.forward(request, response);
            
    	}
    
        System.out.println("seatFilter : exit");
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
