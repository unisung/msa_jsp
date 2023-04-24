<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<h4> 세션 삭제 전</h4>
<%
	String user_id = (String)session.getAttribute("userId");
    String user_pw = (String)session.getAttribute("userPW");
%>
<%=user_id %>-<%=user_pw %><br>
<hr>
<%
	if(request.isRequestedSessionIdValid() == true){
		out.print("세션이 유효합니다.");
	}else{
		out.print("세션이 유효하지 않습니다.");
	}
    //세션정보 삭제
    session.invalidate();//로그아웃 처리
%>
<h4> 세션 삭제 후</h4>
<%
	if(request.isRequestedSessionIdValid() == true){
		out.print("세션이 유효합니다.");
	}else{
		out.print("세션이 유효하지 않습니다.");
	}
%>
</body>
</html>