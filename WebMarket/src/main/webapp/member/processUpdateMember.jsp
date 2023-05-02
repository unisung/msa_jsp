<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
<%
	request.setCharacterEncoding("utf-8");

    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String name=request.getParameter("name");
    String gender=request.getParameter("gender");
    String year=request.getParameter("birthyy");
    String month=request.getParameter("birthmm").length()<2?"0"+request.getParameter("birthmm"):request.getParameter("birthmm");
    String day=request.getParameter("birthdd").length()<2?"0"+request.getParameter("birthdd"):request.getParameter("birthdd");
    String birthYmd =year+"/"+month+"/"+day;
    
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    String mail = mail1+"@"+mail2;
    
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    Date currentDateTime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDateTime.getTime());
    Timestamp timestamp = new Timestamp(currentDateTime.getTime());
%>
<!-- DB연결객체 생성 -->
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/webmarketdb"
 driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"  />
                    
<sql:update dataSource="${dataSource}" var="result" >
  update member 
     set password=?,
         name=?,
         gender=?,
         birth=?,
         mail=?,
         phone=?,
         address=?,
         regist_day=?
   where id=?
  <sql:param  value="<%=password %>"/>
  <sql:param  value="<%=name %>"/>
  <sql:param  value="<%=gender %>"/>
  <sql:param  value="<%=birthYmd %>"/>
  <sql:param  value="<%=mail %>"/>
  <sql:param  value="<%=phone %>"/>
  <sql:param  value="<%=address %>"/>
  <sql:param  value="<%=timestamp %>"/>
  <sql:param  value="<%=id %>"/>
</sql:update>

<c:if test="${result>=1}">
 <c:redirect  url="resultMember.jsp?msg=0"/>
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
