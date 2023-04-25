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
		//쿠키 생성
		Cookie cookie_id = new Cookie("userId", id);
		Cookie cookie_pw = new Cookie("userPW", pwd);
		//응답으로 전송
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		
		out.print("쿠키 생성이 성공했습니다<br>");
        out.print(id+"님 환영합니다.");
	}else{
		out.print("쿠키 생성 실패했습니다<br>");
	}
%>
</body>
</html>