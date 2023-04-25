<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    //요청객체로 부터 쿠키정보 얻기
	Cookie[] cookies = request.getCookies();
  	for(int i=0;i<cookies.length;i++){
  		//쿠키 유지기간 설정 setMaxAge(0)
	   cookies[i].setMaxAge(0);//브라우저에 도달하면서 쿠키 정보 삭제
	   //브라우저로 전달
	   response.addCookie(cookies[i]);
  	}
  	//다른 페이지에서 확인
  	response.sendRedirect("getCookies01.jsp");
%>
</body>
</html>