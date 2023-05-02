<%@ page contentType="text/html; charset=utf-8" %>
<%
   /* 서버에 접속한 정보를 삭제  */ 
   session.invalidate();//로그아웃 처리
   /* welcome.jsp로 이동 처리 - */
    response.sendRedirect("loginMember.jsp");
%>
