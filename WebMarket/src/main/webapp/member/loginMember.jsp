<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
<%=request.getParameter("location") %>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
                로그인
			</h1>
		</div>
	</div>	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");//로그인시 오류가 발새하여 다시 되돌아오면
			    if(error !=null){
			    	out.print("<div class='alert alert-danger'>"+"아이디와 비밀번호를 확인해주세요"+"</div>");
			    }
			%>
		<form name="loginForm" action="processLoginMember.jsp" method = "post" class="form-signin">
           <div class="form-group">
             <label for="inputUserName" class="sr-only">User Name</label>
               <input type="hidden" name="location" value="<%=request.getParameter("location") %>" >
               <input name="id" id="inputUserName" class="from-control"
                          placeholder="ID" required autofocus>
           </div>
           <div class="form-group">
             <label for="inputPassword" class="sr-only">Password</label>
               <input name="password" id="inputPassword" class="from-control" type="password"
                           placeholder="Password" required>
           </div>
           <button class="btn btn-success btn-lg btn-block" type="submit">로그인</button>
       </form>
			
		</div>
		<hr>
	</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>