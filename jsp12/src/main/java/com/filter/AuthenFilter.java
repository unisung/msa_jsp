package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


public class AuthenFilter extends HttpFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter01 실행...");
	}
	public void destroy() {System.out.println("Filter01 해제...");}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			    throws IOException, ServletException {
		System.out.println("Filter01.jsp 초기화...");
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");

		if (name == null || name.equals("")) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			String message = "입력된 name 값은 null입니다.";
			writer.println(message);
			return;
		}
		
		
		chain.doFilter(request, response);
	}

}
