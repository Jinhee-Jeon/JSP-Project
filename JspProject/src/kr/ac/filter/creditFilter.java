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

public class creditFilter implements Filter{

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
							throws IOException, ServletException {
		String[] arr = new String[2];
        System.out.println("creditFilter : start");        
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        String result3="";
      		
        String cvs = request.getParameter("cvs");
        String card_num = request.getParameter("card_num");
    	arr[0] = cvs;
    	arr[1] = card_num;
    
    	
    	int i=0;
    	for(i=0; i<2; i++) {
    		System.out.println("arr : " + arr[i]);
    		if(arr[i].equals("")) {
    			result3 = "creditError";
    			break;
    		}
    	}
    	if(i==2) result3="sucess";
    	
    	session.setAttribute("result3", result3);
         	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/credit.jsp?cvs="+cvs);
        dispatcher.forward(request, response);
        
        System.out.println("creditFilter : exit");
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}
