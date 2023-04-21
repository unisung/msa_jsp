<%@ page contentType="text/html; charset=utf-8" %>
<%
   /* 서버에 접속한 정보를 삭제  */ 
   session.invalidate();
   /* addProduct.jsp로 이동 처리 - 이동시 시큐리티에 의해 login.jsp페이지가 나타남. */
    response.sendRedirect("addProduct.jsp");
%>
