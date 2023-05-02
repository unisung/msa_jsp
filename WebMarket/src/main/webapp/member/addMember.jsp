<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원가입</title>
<script>
function checkForm(){
	if(document.newMember.password.value 
		!=document.newMember.password_confirm.value){
		alert("비밀번호를 동일하게 입력하세요");
		document.newMember.password.value="";
		document.newMember.password_confirm.value="";
		document.newMember.password.focus();
		return false;
	}
}
</script>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원 가입
			</h1>
		</div>
	</div>	
	<div class="container">
	 <form name="newMember" class="form-horizontal" action="processAddMember.jsp"
	        method="post" onsubmit="return checkForm()">
	    <div class="form-group row">
	        <label class="col-sm-2">아이디</label>
	         <div class="col-sm-3">
	         <input name="id" class="form-control" placeholder="id" autofocus="autofocus" required="required">
	        </div>
	    </div>
	     <div class="form-group row">
	        <label class="col-sm-2">비밀번호</label>
	         <div class="col-sm-3">
	         <input name="password" type="password" class="form-control" placeholder="password" required="required">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">비밀번호 확인</label>
	         <div class="col-sm-3">
	         <input name="password_confirm" type="password" class="form-control" placeholder="password confirm" required="required">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">성명</label>
	        <div class="col-sm-3">
	         <input name="name" class="form-control" placeholder="name"  required="required">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">성별</label>
	        <div class="col-sm-10">
	            <input type="radio" name="gender" value="남" checked>남
	            <input type="radio" name="gender" value="여">여
	        </div>
	    </div>
	    
	    <div class="form-group row">
	        <label class="col-sm-2">생일</label>
	        <div class="col-sm-4">
	            <input name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
	            <select name="birthmm">
	              <option value="">월</option>
	              <c:forEach var="m" begin="1" end="12">
	                 <option value="${m}">${m}</option>
	              </c:forEach>
	            </select>
	            <input name="birthdd" maxlength="2" placeholder="일" size="4">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">이메일</label>
	        <div class="col-sm-10">
	            <input name="mail1" maxlength="50">@<select name="mail2">
	            <option>naver.com</option>
	            <option>daum.net</option>
	            <option>gmail.com</option>
	            <option>nate.com</option>
	            </select>
	        </div>
	    </div>
	   <div class="form-group row">
	        <label class="col-sm-2">전화번호</label>
	        <div class="col-sm-3">
	         <input name="phone" class="form-control" placeholder="phone"  required="required">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">주소</label>
	        <div class="col-sm-5">
	         <input name="address" class="form-control" placeholder="address"  required="required">
	        </div>
	    </div>
	    
	     <div class="form-group row">
	        <div class="col-sm-offset-2 col-sm-10">
	         <input type="submit" class="btn btn-primary" value="등록">
	         <input type="reset"  class="btn btn-secondary" value="취소" onclick="reset()">
	        </div>
	    </div>
	 </form>	
		
		
		<hr>
	</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>