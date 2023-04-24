<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("userId");
    String user_pw = (String)session.getAttribute("userPW");
%>
설정된 세션의 속성 값[1] : <%=user_id %><br>
설정된 세션의 속성 값[2] : <%=user_pw %>
<hr>
<%
	Enumeration en = session.getAttributeNames();
    int i=0;
    while(en.hasMoreElements()){
    	i++;
    	String name = en.nextElement().toString();
    	
    	out.print("설정된 세션의 속성 이름["+i+"] : "+name+"  :  ");
    	out.print("설정된 세션의 속성 값["+i+"] :"+session.getAttribute(name)+"<br>");
    }
%>
<hr>
 
<%
    session.removeAttribute("userId");
%>
<p> 삭제후<br>
<%=session.getAttribute("userId") %>

</body>
</html>