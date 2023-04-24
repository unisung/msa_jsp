<%@page import="java.util.List"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<html>
<%
	ProductRepository productDAO = ProductRepository.getInstance();
%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>장바구니</title>
<% String cartId= session.getId(); %>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				장바구니
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="row">
		    <table width="100%">
		       <tr>
		          <td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" 
		             class="btn btn-danger">삭제하기</a></td>
		          <td align="right"><a href="#" class="btn btn-success">주문하기</a></td>
		       </tr>
		    </table>
		   </div>
		    <div style="padding-top:50px">
		        <table class="table table-hover">
		             <tr>
		              <th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th>
		             </tr>
		        <%
		        	int sum =0;
		            List<Product> cartlist = ( List<Product>)session.getAttribute("cartlist");
		            if(cartlist == null){
		            	cartlist = new ArrayList<Product>();
		            }
		            for(int i=0;i<cartlist.size();i++){
		            		Product product = cartlist.get(i);
		            		int total = product.getUnitPrice()*product.getQuantity();//단가*수량 = 판매가
		            				sum = sum+total;
		            		
		         %><tr>
		            <td><%=product.getProductId() %> - <%=product.getPname() %></td>   		
		            <td><%=product.getUnitPrice() %></td> 		
		            <td><%=product.getQuantity() %></td>
		            <td><%=total%></td>
		            <td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" 
		                         class="badge badge-danger">삭제</a></td>	
		            </tr>             
		         <%                
		            	}
		        %>
		        <tr>
		         <th></th>
		         <th></th>
		         <th>총액</th>
		         <th><%=sum %></th>
		         <th></th>
		        </tr>
		        </table>
                 <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>