<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
	   <%@ include file="dbconn.jsp" %>
		<%
			String productId = request.getParameter("id");
		    String sql="select * from product where p_id=?";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1,productId);
		    ResultSet rs = pstmt.executeQuery();
		    if(rs.next()){
		    	System.out.println(rs.getString("p_condition"));
		%>
	<div class="row">
	     <div class="col-md-5">  
		   <img src="/resources/images/<%=rs.getString("p_filename")%>" alt="image" style="width:100%">
		  </div>
		<div class="col-md-7">
		<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" 
		             method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId"  name="productId"  class="form-control"  value='<%=rs.getString("p_id")%>' readonly="readonly">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name"  name="name" class="form-control"  value='<%=rs.getString("p_name")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice"  name="unitPrice" class="form-control"  value='<%=rs.getInt("p_unitPrice")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description") %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value='<%=rs.getString("p_manufacturer")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value='<%=rs.getString("p_category")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value='<%=rs.getLong("p_unitsInstock")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New " <%=rs.getString("p_condition").equals("New ")?"checked":"" %> >신규제품 
					<input type="radio" name="condition" value="Old" <%=rs.getString("p_condition").equals("Old")?"checked":"" %>  >중고 제품
					<input type="radio" name="condition" value="Refurbished" <%=rs.getString("p_condition").equals("Refurbished")?"checked":"" %> >재생 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file"  name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	</div>
</div>	
	<%} %>
	<%@ include file="footer.jsp"%>
</body>
</html>