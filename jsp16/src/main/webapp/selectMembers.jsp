<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
   String sql="select * from member";
   PreparedStatement pstmt 
     = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
   
   while(rs.next()){
	   out.print(rs.getString(1)
			   +" : "+rs.getString(2) 
			   + " : " + rs.getString(3)+"<br>");
   }
%>

</body>
</html>