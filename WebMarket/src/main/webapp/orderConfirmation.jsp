<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<html>
<%
	request.setCharacterEncoding("utf-8");
    String cartId = session.getId();
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
<%
	ProductRepository productDAO = ProductRepository.getInstance();
%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문정보</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				주문 정보
			</h1>
		</div>
	</div>	
	<div class="container col-8 alert alert-info">
	   <div class="text-center">
	       <h1>영수증</h1>
	   </div>
	</div>
	
		<div class="row justify-content-betweeen">
		    <div class="col-4" align="left">
		      <strong>배송 주소</strong><br> 성명 :<% out.print(shipping_name); %><br>
		      우편번호:<%=shipping_zipcode %><br>
		      주소:<%=shipping_roadAddress %> -<%=shipping_detailAddress %><br>
		    </div>
		    <div class="col-4" align="right">
		         <p> <em>배송일:<%=shipping_shippingDate %></em>
		    </div>
		</div>     
        <div>
		    <table class="table table-hover">
		       <tr>
		          <th class="text-center">도서</th>
		          <th class="text-center">#</th>
		          <th class="text-center">가격</th>
		          <th class="text-center">소계</th>
		       </tr>
		       <%
		       	  int sum =0;
		          List<Product> cartlist =(List<Product>)session.getAttribute("cartlist");
		          if(cartlist ==null) cartlist = new ArrayList<Product>();
		          for(int i=0;i<cartlist.size();i++){
		        	  Product product = cartlist.get(i);
		        	  int total = product.getUnitPrice() * product.getQuantity();
		        	  sum = sum+total;
		       %>
		       <tr>
		         <td class="text-center"><em><%=product.getPname() %></em></td>
		         <td class="text-center"><em><%=product.getQuantity() %></em></td>
		         <td class="text-center"><em><%=product.getUnitPrice() %></em></td>
		         <td class="text-center"><em><%=total %>원</em></td>
		       </tr>
		       <%
		          }
		       %>
		       <tr>
		       <td></td>
		       <td></td>
		       <td class="text-right"><strong>총액:</strong></td>
		       <td class="text-center text-danger"><strong><%=sum%></strong></td>
		       </tr>
		    </table>
		   </div>
		    <div style="padding-top:50px">
                 <a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary">이전</a>
                 <a href="./thanksCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
                 <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>