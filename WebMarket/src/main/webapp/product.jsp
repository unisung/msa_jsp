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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<title>Product</title>
<script>
 function addToCart(){
	 if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		 document.addForm.submit();//document.form명.submit();
	 }else{
		 document.addForm.reset();
	 }
 }
 function addToCart2(){
	 document.addForm.submit();
 }
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 정보
			</h1>
		</div>
	</div>	
	<%
		String id = request.getParameter("id");
	    Product product = productDAO.getProductById(id);
	%>
	<div class="container">
		<div class="row">
		      <div class="col-md-5">
		         <img src="/resources/images/<%=product.getFilename()%>" style="width: 100%">
		      </div>
               <div class="col-md-6">
                 <h3><%=product.getPname() %></h3>
                 <p><%=product.getDescription() %>
                 <p><b>상품 코드: </b><span class="badge badge-danger"><%=product.getProductId()%></span>
                 <p><b>제조사</b>:<%=product.getManufacturer() %>
                 <p><b>분류</b>:<%=product.getCategory() %>
                 <p><b>재고 수</b>:<%=product.getUnitsInStock() %>
                 <h4><%=product.getUnitPrice() %>원</h4>
                 <p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
                     	<!-- Button trigger modal -->
						<button type="button" class="btn btn-info" data-toggle="modal" 
						              data-target="#addCart">
						 상품 주문&raquo;
						</button>
<!--                      <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>  -->
                     <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
                     <a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
                 </form>
               </div>
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>


<!-- Modal -->
<div class="modal fade" id="addCart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장바구니 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        상품을 장바구니에 추가하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="addToCart2()">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>