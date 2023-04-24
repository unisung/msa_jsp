<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //cart.jsp페이지에서 deleteCart.jsp?cartId=세션아이디 로 넘어온 값 얻기 
  String id = request.getParameter("cartId");
//cartId정보가 없으면 장바구니 페이지로 이동처리
  if(id==null || id.trim().equals("")){
	  response.sendRedirect("cart.jsp");
	  return;
  }
  //세션에 저장된 모든 정보 삭제
  session.invalidate();
  //장바구니페이지에서 확인
  response.sendRedirect("cart.jsp");
%>