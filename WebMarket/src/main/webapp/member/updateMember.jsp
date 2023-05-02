<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
<body onload="init()">
	<%@ include file="/menu.jsp"%>
<!-- DB연결객체 생성 -->
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/webmarketdb"
 driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"  />
<!-- sessionId에 해당하는 정보를 DB로 부터 추출하겨 resultSet변수에 저장 -->
<sql:query dataSource="${dataSource}" var="resultSet" >
 select * from member where id=?
 <sql:param value="<%=sessionId %>"/>
</sql:query>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원 수정
			</h1>
		</div>
	</div>
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail}"/>
	<c:set var="mail1" value="${mail.split('@')[0]}"/>
	<c:set var="mail2" value="${mail.split('@')[1]}"/>
	
	<c:set var="birth" value="${row.birth}"/>
	<c:set var="year" value="${birth.split('/')[0]}"/>
	<c:set var="month" value="${birth.split('/')[1]}"/>
	<c:set var="day" value="${birth.split('/')[2]}"/>
		
	<div class="container">
	 <form name="newMember" class="form-horizontal" action="processUpdateMember.jsp"
	        method="post" onsubmit="return checkForm()">
	    <div class="form-group row">
	        <label class="col-sm-2">아이디</label>
	         <div class="col-sm-3">
	         <input name="id" class="form-control" placeholder="id"  value="<c:out value="${row.id}"/>" readonly>
	        </div>
	    </div>
	     <div class="form-group row">
	        <label class="col-sm-2">비밀번호</label>
	         <div class="col-sm-3">
	         <input name="password" type="password" class="form-control" placeholder="password" required value="<c:out value="${row.password}"/>">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">비밀번호 확인</label>
	         <div class="col-sm-3">
	         <input name="password_confirm" type="password" class="form-control" placeholder="password confirm" required>
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">성명</label>
	        <div class="col-sm-3">
	         <input name="name" class="form-control" placeholder="name"  required="required" value="<c:out value="${row.name}"/>" >
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">성별</label>
	        <div class="col-sm-10">
	             <c:set var="gender" value="${row.gender}" />
	            <input type="radio" name="gender" value="남" <c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if>>남
	            <input type="radio" name="gender" value="여" <c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if>>여
	        </div>
	    </div>
	    
	    <div class="form-group row">
	        <label class="col-sm-2">생일</label>
	        <div class="col-sm-4">
	            <input name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="${year}">
	            <select name="birthmm" id="birthmm">
	              <option value="">월</option>
	              <c:forEach var="m" begin="1" end="12">
	                 <option value="${m}" <c:if test="${m==month}">selected</c:if> >${m}</option>
	              </c:forEach>
	            </select>
	            <input name="birthdd" maxlength="2" placeholder="일" size="4" value="${day }">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">이메일</label>
	        <div class="col-sm-10">
	            <input name="mail1" maxlength="50" value="${mail1}">@<select name="mail2" id="mail2" value="${mail2}">
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
	         <input name="phone" class="form-control" placeholder="phone"  required="required" value="<c:out value='${row.phone}'/>">
	        </div>
	    </div>
	    <div class="form-group row">
	        <label class="col-sm-2">주소</label>
	        <div class="col-sm-5">
	         <input name="address" class="form-control" placeholder="address"  required="required" value="<c:out value='${row.address}'/>">
	        </div>
	    </div>
	   </c:forEach>
	     <div class="form-group row">
	        <div class="col-sm-offset-2 col-sm-10">
	         <input type="submit" class="btn btn-primary" value="회원수정">
	         <input type="reset"  class="btn btn-secondary" value="취소" onclick="reset()">
	         <a href="deleteMember.jsp" class="btn btn-danger">회원탈퇴</a>
	        </div>
	    </div>
	 </form>			
		<hr>
	</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>
<script>
function init(){
	setComboMailValue('${mail2}');
	//setComboBirthValue('${month}');
}
function setComboMailValue(val){
	var selectMail = document.getElementById('mail2');
	for(i=0,j=selectMail.length;i<j;i++){
		if(selectMail.options[i].value==val){
			selectMail.options[i].selected = true;
			break;
		}
	}
}
/* function setComboBirthValue(val){
	var selectBirth = document.getElementById('birthmm');
	for(i=0;j<selectBirth.length;i++){
		if(selectBirth.options[i].value==val){
			selectBirth.options[i].selected = true;
			break;
		}
	}
} */


</script>