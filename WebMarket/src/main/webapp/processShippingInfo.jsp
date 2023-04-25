<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //현재 페이지에 맞도록 문자셋 설정
	request.setCharacterEncoding("utf-8");
    
    Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
    Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
    Cookie shippingDate = 
    		   new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
    Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
    Cookie zipcode = new Cookie("Shipping_zipcode",URLEncoder.encode(request.getParameter("zipcode"),"utf-8"));
    Cookie roadAddress = 
    		 new Cookie("Shipping_roadAddress",URLEncoder.encode(request.getParameter("roadAddress"),"utf-8"));
    Cookie jibunAddress = 
    		 new Cookie("Shipping_jibunAddress",URLEncoder.encode(request.getParameter("jibunAddress"),"utf-8"));
    Cookie detailAddress = 
    		 new Cookie("Shipping_detailAddress",URLEncoder.encode(request.getParameter("detailAddress"),"utf-8"));
    Cookie extraAddress = 
    		new Cookie("Shipping_extraAddress",URLEncoder.encode(request.getParameter("extraAddress"),"utf-8"));
    
    //유지 기간 설정
    cartId.setMaxAge(24*60*60);
    name.setMaxAge(24*60*60);
    shippingDate.setMaxAge(24*60*60);
    country.setMaxAge(24*60*60);
    zipcode.setMaxAge(24*60*60);
    roadAddress.setMaxAge(24*60*60);
    jibunAddress.setMaxAge(24*60*60);
    detailAddress.setMaxAge(24*60*60);
    extraAddress.setMaxAge(24*60*60);
    
    //브라우저에 저장
    response.addCookie(cartId);
    response.addCookie(name);
    response.addCookie(shippingDate);
    response.addCookie(country);
    response.addCookie(zipcode);
    response.addCookie(roadAddress);
    response.addCookie(jibunAddress);
    response.addCookie(detailAddress);
    response.addCookie(extraAddress);
    
    //주문확정페이지로 이동
    response.sendRedirect("orderConfirmation.jsp");
    
    
%>        
