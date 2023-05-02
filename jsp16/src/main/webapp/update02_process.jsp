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
    String passwd1=request.getParameter("passwd1");
    String passwd2=request.getParameter("passwd2");
    
    String sql="select id, passwd from member where id=? and passwd=?";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1,id);
    pstmt.setString(2,passwd1);
 
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()){
    	sql="update member set passwd=? where id=?";
    	//sql문을 PreparedStatemt에 재 설정
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,passwd2);
    	pstmt.setString(2,id);
        int result = pstmt.executeUpdate();
        
        if(result>0) out.print("수정성공");
        else{
        	out.print("수정실패");
        }
    }else{
    	out.print("아이디나 비번을 확인하세요");
    }
%>

</body>
</html>