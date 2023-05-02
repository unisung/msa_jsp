<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 정보</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원 정보
			</h1>
		</div>
	</div>	
	<div class="container">
     <%
     	String msg = request.getParameter("msg");
         /* 0-수정,1-가입완료,2-로그인,삭젠 */
        if(msg !=null){
        	if(msg.equals("0"))
        		out.print("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
        	else if(msg.equals("1"))
        		out.print("<h2 class='alert alert-success'>회원가입을 축하드립니다.</h2>");
        	else if(msg.equals("2")){
        	    String loginId =(String)session.getAttribute("sessionId");	
        		out.print("<h2 class='alert alert-info'>"+loginId+"님 환영합니다.</h2>");
        	}
        }else{
        	out.print("<h2 class='alert alert-warning'>회원정보가 삭제되었습니다.</h2>");
        }
     %>
		<hr>
	</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>