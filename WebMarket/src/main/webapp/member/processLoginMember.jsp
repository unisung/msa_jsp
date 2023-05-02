<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String password=request.getParameter("password");
%>
<!-- DB연결객체 생성 -->
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/webmarketdb"
 driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"  />
<sql:query dataSource="${dataSource}" var="resultSet" >
 select * from member where id=? and password=?
 <sql:param value="<%=id %>"/>
 <sql:param value="<%=password %>"/>
</sql:query>

<!-- id/password가 다 맞으면 로그인 처리후 결과페이지로 이동처리 -->
<c:forEach var="row" items="${resultSet.rows}">
  <%
  	 session.setAttribute("sessionId", id);
  %>
  <c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>
<!-- id나 비번이 틀린경우 다시 로그인 페이지로이동 error코드를 1로 가져감 -->
<c:redirect url="loginMember.jsp?error=1"/> 
        

        