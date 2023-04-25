<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<%
String shipping_cartId ="";
String shipping_name="";
String shipping_shippingDate="";
String shipping_country="";
String shipping_zipcode="";
String shipping_roadAddress="";
String shipping_jibunAddress="";
String shipping_detailAddress="";
String shipping_extraAddress="";
Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId")){
			shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_name")){
			shipping_name = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_shippingDate")){
			shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_country")){
			shipping_country = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_zipcode")){
			shipping_zipcode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_roadAddress")){
			shipping_roadAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_jibunAddress")){
			shipping_jibunAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_detailAddress")){
			shipping_detailAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_extraAddress")){
			shipping_extraAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
	}
}
%>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				주문 완료
			</h1>
		</div>
	</div>	
	<div class="container">
	   <h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
	   <p> 주문은 <%=shipping_shippingDate %>에 배송될 예정입니다!
	   <p> 주문번호: <%=shipping_cartId %>
	</div>
	<div class="container">
	   <p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
		<hr>
<%
   //장바구니 삭제
   session.invalidate();
  //배송정보 삭제
for (int i = 0; i < cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if (n.equals("Customer_Id"))
		thisCookie.setMaxAge(0);
	if (n.equals("Customer_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Customer_phoneNumber"))
		thisCookie.setMaxAge(0);
	if (n.equals("Customer_country"))
		thisCookie.setMaxAge(0);
	if (n.equals("Customer_zipCode"))
		thisCookie.setMaxAge(0);
	if (n.equals("Customer_addressName"))
		thisCookie.setMaxAge(0);

	if (n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);
	
	response.addCookie(thisCookie);
}

%>		
	<%@ include file="footer.jsp"%>
</body>	
</html>