<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    //쿠키 생성
	Cookie cookie = new Cookie("name",URLEncoder.encode("홍길동"));
    //응답객체에 실어서 보냄
    response.addCookie(cookie);
%>
<hr>
<!-- 쿠키 정보 출력 -->
<%=cookie.getName() %> 쿠키 값: <%=URLDecoder.decode(cookie.getValue()) %>
</body>
</html>