package tw.sure;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebFilter(filterName="/CorsFilter",urlPatterns="/pages/forgetPassword.jsp")
public class CorsFilter extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

//		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		
//		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		
		
//		httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
//		httpServletResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:8080");
		
//		chain.doFilter(request, response);
		
//		System.out.println("filter is running...");
		
//		Object member = httpServletRequest.getSession().getAttribute("member");
		
//		if(member == null) {
//			
//			httpServletRequest.getRequestDispatcher("/pages/login.jsp").forward(request, response);
//		} else {
//			
//			chain.doFilter(request, response);
//		}
		
	}

}
