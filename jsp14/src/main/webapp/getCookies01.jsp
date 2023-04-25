<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키 정보 얻기</title>
</head>
<body>
<%
     //클라이언트의 요청으로 부터 쿠키 정보 얻기
	 Cookie[] cookies = request.getCookies();
     //얻은 쿠키 정보가 있으면
      if(cookies !=null && cookies.length >0 ){
    	  for(int i=0;i<cookies.length;i++){
      %>
      	  <%=cookies[i].getName() %> =<%=URLDecoder.decode(cookies[i].getValue()) %><br>
      <%		  	  
    	  }
      }else {
    	%>
    	<b>쿠키정보가 없습니다.</b>
    	<%  
      }
%>
<hr>
<b>sessionId:<%=session.getId() %></b>
</body>
</html>