<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:import url="http://media.daum.net/"
           charEncoding="euc-kr"
           var="daumNews"
           scope="request"  
            >
         
  <%-- <c:param name="_top_G" value="news"/> --%>
 </c:import>
</body>
</html>