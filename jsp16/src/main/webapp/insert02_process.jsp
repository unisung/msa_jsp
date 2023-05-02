<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<!DOCTYPE html><html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    
    String id=request.getParameter("id");
    String passwd=request.getParameter("passwd");
    String name=request.getParameter("name");
    
    String sql="insert into member values(?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    pstmt.setString(2,name);
    pstmt.setString(3,passwd);
    
    int result = pstmt.executeUpdate();
    
    if(result>0) out.print("입력성공");
    else{
    	out.print("입력실패");
    }
%>

</body>
</html>