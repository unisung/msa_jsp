<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">
				요청한 페이지를 찾을 수 없습니다.
			</h2>
		</div>
	</div>	
	<div class="container">
		<p><%=request.getRequestURL()%>
		<p><a href="products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>