<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키정보 수정</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
    if(cookies !=null && cookies.length>0){
    	for(int i=0;i<cookies.length;i++){
    		if(cookies[i].getName().equals("userId")){//쿠키 존재 확인
    			Cookie cookie = new Cookie("userId","superUser");//존재하면 새로 생성하여
    			response.addCookie(cookie);//응답객체에 실어서 전송
    		}
    	}
    }
%>
</body>
</html>