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
  /* db에 자동 반영 처리를 수동모드로 변경   */
  conn.setAutoCommit(false);
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
 if(result>0){ 
    conn.commit();//DB에 삭제 반영 처리
    %>
  <script>alert('삭제 성공');</script>
 <%  
 }else{
	conn.rollback();//이전상태로 되돌리기
%><script>alert('삭제 실패');</script>
<%} 
  //자동커밋 모드로 되돌리기
  conn.setAutoCommit(true);
%>
</body>
</html>