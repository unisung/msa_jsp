<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>Welcome</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" 
		       method="post">
		     <input type="hidden"  name="id" value="${sessionId}">  
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name"  name="name"  class="form-control" value="${name}"  readonly required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" id="subject"  name="subject" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-5">
					<textarea name="content" cols="50" rows="5" class="form-control" required></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록" >
					<input type="reset" class="btn btn-secondary" value="취소" >
				</div>
			</div>
		</form>
		<hr>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>