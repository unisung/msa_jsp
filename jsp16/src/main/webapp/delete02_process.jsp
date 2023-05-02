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
//form으로 부터 파라미터 받기 id
 String id=request.getParameter("id");
//쿼리문 작성
 String sql="delete from member where id=?";
//쿼리 전달 객체 생성
 PreparedStatement pstmt = conn.prepareStatement(sql);
//바인딩 변수(?) 값 설정
 pstmt.setString(1,id);
 
//쿼리 실행 및 결과 처리
 int result=pstmt.executeUpdate();
 if(result>0){ %>
  <script>alert('삭제 성공');</script>
 <%
 }else{
%><script>alert('삭제 실패');</script>
<%} %>
</body>
</html>