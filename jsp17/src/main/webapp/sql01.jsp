<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>       
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>JSTL sql</title>
</head>
<body>
<!-- DB연결객체 생성 -->
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/jspbookdb"
 driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"  />
 
 <!-- 쿼리문 전달 후 결과 받기 -->
<sql:query var="resultSet" dataSource="${dataSource}">
    select * from member
</sql:query>
<table border="1">
  <tr>
    <c:forEach var="columnName" items="${resultSet.columnNames}">
         <th width="100"><c:out value="${columnName}"/></th>
    </c:forEach>
  </tr>
  <c:forEach var="row" items="${resultSet.rowsByIndex}">
  <tr>
  <c:forEach var="column" items="${row}" varStatus="i">
     <td>
      <c:if test="${column !=null}">
      	<c:out value="${column}" />
      </c:if>
      <c:if test="${column ==null}">
      	  &nbsp;
      </c:if>
     </td>
  </c:forEach>
  </tr>
  </c:forEach>
</table>

</body>
</html>