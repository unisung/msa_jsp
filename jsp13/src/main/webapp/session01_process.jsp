<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<%
	if(id.equals("admin") & pwd.equals("1234")){
		session.setAttribute("userId", id);
		session.setAttribute("userPW", pwd);
		out.print("세션 설정이 성공했습니다<br>");
        out.print(id+"님 환영합니다.");
	}else{
		out.print("세션 설정이 실패했습니다<br>");
	}
%>
</body>
</html>