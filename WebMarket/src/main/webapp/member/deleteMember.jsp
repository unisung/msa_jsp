<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
<%
	request.setCharacterEncoding("utf-8");

    String id=(String)session.getAttribute("sessionId");
    
%>
<!-- DB연결객체 생성 -->
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/webmarketdb"
 driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"  />
                    
<sql:update dataSource="${dataSource}" var="result" >
  delete from member  where id=?
  <sql:param  value="<%=id %>"/>
</sql:update>

<c:if test="${result>=1}">
  <c:import var="url" url="logoutMember.jsp"/>
  <c:redirect  url="resultMember.jsp"/>
</c:if>


<%-- <%=id%><br>
<%=password%><br>
<%=name%><br>
<%=gender%><br>
<%=year%><br>
<%=month%><br>
<%=day%><br>
<%=mail1%><br>
<%=mail2%><br>
<%=phone%><br>
<%=address%><br> --%>
