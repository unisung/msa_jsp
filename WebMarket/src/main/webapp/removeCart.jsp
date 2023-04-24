<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<%
//<a href="">로 넘어오 파라미터 id값 얻기(상품코드)
  String id = request.getParameter("id");
  if(id == null || id.trim().equals("")){
	  response.sendRedirect("products.jsp");
	  return;
  }
  //싱글톤 객체 얻기
  ProductRepository dao = ProductRepository.getInstance();
  //상품코드에 해당하는 상품정보 얻기
  Product product = dao.getProductById(id);
   if(product == null){
	   response.sendRedirect("exceptionNoProductId.jsp");
   }
   
   //세션으로 부터 장바구니객체 얻기
   List<Product> cartlist =(List<Product>)session.getAttribute("cartlist");
   
   Product goodsQnt = new Product();
   
   //전달된 id에 해당하는 상품 정보 얻어서 삭제 list.remove(객체);
   for(int i=0;i<cartlist.size();i++){
	   goodsQnt = cartlist.get(i);
	   if(goodsQnt.getProductId().equals(id)){
		   cartlist.remove(goodsQnt);
	   }
   }
   //장바구니에 삭제 결과 보여주기
   response.sendRedirect("cart.jsp");
   
%>