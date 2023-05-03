package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.LoginBean;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// webapp -> / 
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		    // 결과페이지 생성
		   response.setContentType("text/html; charset=utf-8");
		   String id = request.getParameter("id");
		   String password =request.getParameter("passwd");
		   //요청에 대한 작업
		   LoginBean bean = new LoginBean();
		   bean.setId(id);
		   bean.setPasswd(password);
		   
		   boolean status = bean.validate();
		   //작업 결과에 따라 이동할 페이지 설정
		   String view="";
		   if(status) {
			   view = "mvc_success.jsp";
		   }else {
			   view ="mvc_error.jsp";
		   }

		//결과 이동 처리
		request.setAttribute("bean", bean);
		RequestDispatcher dispather 
		     = request.getRequestDispatcher(view);// /view.jsp
		dispather.forward(request, response);
	}

}
