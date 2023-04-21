﻿<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<% ProductRepository productDAO = ProductRepository.getInstance(); %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품목록
			</h1>
		</div>
	</div>	
	<%
		ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
              <%
              	for(int i=0;i<listOfProducts.size();i++){
              		Product product = listOfProducts.get(i);
               %>
               <div class="col-md-4">
                 <img src="/resources/images/<%=product.getFilename()%>" style="width:100%">
                 <h3><%=product.getPname() %></h3>
                 <p><%=product.getDescription() %>
                 <p><%=product.getUnitPrice() %>원
                 <p><a href="./product.jsp?id=<%=product.getProductId()%>" 
                                              class="btn btn-secondary" role="button">상세정보 &raquo;></a>
               </div>
               <%		
              	}
              %>
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>