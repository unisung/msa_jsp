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
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;

@WebFilter(
		urlPatterns = { "/filter02_process.jsp" }, 
		initParams = { 
				@WebInitParam(name = "param1", value = "admin"), 
				@WebInitParam(name = "param2", value = "1234")
		})
public class InitParamFilter extends HttpFilter implements Filter {
	//필드 추가
	private FilterConfig  filterConfig = null;
	
	public void destroy() {System.out.println("Filter02 해제...");}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Filter02 수행...");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String param1 = filterConfig.getInitParameter("param1");//"admin"
		String param2 = filterConfig.getInitParameter("param2");//"1234"
		
		String message;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && passwd.equals(param2))// id=="admin", passwd=="1234"
			message = "로그인 성공";
		else
			message = "로그인 실패";
		
		writer.print(message);
		
		chain.doFilter(request, response);//doFilter전의 처리 내용
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02 초기화....");
		this.filterConfig = fConfig;
	}

}
