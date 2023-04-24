<%@page import="dto.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>       
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4> 세션 유효 시간 변경 전</h4>
<%
	int time = session.getMaxInactiveInterval()/60;
    out.print("세션 유효기간 : " + time+"분<br>");
%>
<h4> 세션 유효 시간 변경 후</h4>
<%
	//세션 유지 시간 변경 처리
    session.setMaxInactiveInterval( 60 * 60);
	
    time = session.getMaxInactiveInterval()/60;
	out.print("세션 유효기간 : " + time+"분<br>");
%>
<hr><hr>
세션 아이디:<%=session.getId()%><br>
요청 마지막시간:<%=session.getLastAccessedTime() %><br>
요청 시각:<%=session.getCreationTime() %><br>
웹 경과 시간 :<%= (session.getLastAccessedTime() - session.getCreationTime()) %><br>

<hr><hr>
<%
	session.setAttribute("id", "hong");
    session.setAttribute("pwd", "1234");
    session.setAttribute("name", "홍길동");
    session.setAttribute("tel", "010-1234-5678");
%>
<hr><hr>
<%
    // 속성들을 하나로 묶어서 session에 저장하기
	 Member member = new Member();
     member.setId("hong");
     member.setName("홍길동");
     member.setPwd("1234");
     member.setTel("010-1234-5678");
     
     session.setAttribute("member", member);
%>
${member.id}<br>
${member.name}<br>
${member.pwd }<br>
${member.tel }<br>
</body>
</html>