<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("id");//상품id받기
  //상품코드가 전달되지 않았으면 상품리스트페이지로 강제 이동 처리
  if(id == null || id.trim().equals("")){
	  response.sendRedirect("products.jsp");
	  return;
  }
  //싱글톤 객체 얻기
  ProductRepository dao = ProductRepository.getInstance();
  //상품id에 해당하는 상품객체 얻기
  Product product = dao.getProductById(id);
  //상품정보가 없으면 에러 페이지로 이동 처리
  if(product == null){
	  response.sendRedirect("exceptionNoProductId.jsp");
  }
  //상품정보리스트 얻기
  List<Product> goodsList = dao.getAllProducts();
  Product goods = new Product();
  //id에 해당하는 상품정보을 얻으면 반복 중지
  for(int i=0;i<goodsList.size();i++){
	  goods = goodsList.get(i);
	  if(goods.getProductId().equals(id)){
		  break;
	  }
  }
  //세션에 cartlist 얻기
  List<Product> list =(List<Product>)session.getAttribute("cartlist");
  //장바구니가 session에 없으면
  if(list==null){//
	  list = new ArrayList<Product>();
	  session.setAttribute("cartlist", list);//장바구니를 최초로 생성하여 저장
  }
  
  int cnt =0;
  Product goodsQnt = new Product();
  //장바구니에서 반복하면서 상품id에 해당하는 상품 찾아서 장바구니 수량 증가
  for(int i=0;i<list.size();i++){
	  goodsQnt = list.get(i);
	  if(goodsQnt.getProductId().equals(id)){
		  cnt++;
		  int orderQuantity = goodsQnt.getQuantity() +1;//장바구니의 개수에 +1
		  goodsQnt.setQuantity(orderQuantity);//증가된 값으로 장바구니 수 세팅
	  }
  }
  //장바구니에 상품id에 해당하는 상품없는 경우
  if(cnt==0){
	  goods.setQuantity(1);//장바구니 수량1
	  list.add(goods);//수량1인 상품을 장바구니에 저장
  }
  
  //장바구니 저장 작업 완료됬으면 이전에 본 상품상세 페이지로 이동
  response.sendRedirect("product.jsp?id="+id);

%>