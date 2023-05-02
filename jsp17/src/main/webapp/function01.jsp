<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>JSTL functions</title>
</head>
<body>
<p>문자열 검색
<p> Hello, Java Server Pages! => ${fn:contains("Hello, Java Server Pages!","java") }
<p> Hello, Java Server Pages! => ${fn:containsIgnoreCase("Hello, Java Server Pages!","java") }
<p> 문자열 길이 
<p> Hello, Java Server Pages! => ${fn:length("Hello, Java Server Pages!") }
<p> 대문자
<p> Hello, Java Server Pages! => ${fn:toUpperCase("Hello, Java Server Pages!") }
<p> 소문자
<p> Hello, Java Server Pages! => ${fn:toLowerCase("Hello, Java Server Pages!") }
<p> 문자열 자르기
<p> Hello, Java Server Pages! => ${fn:substring("Hello, Java Server Pages!",7,11) }
<p> 문자열 자르기 <!-- -1이면 끝까지  -->
<p> Hello, Java Server Pages! => ${fn:substring("Hello, Java Server Pages!",7,-1) }
<p> 문자열 잘라서 배열로 
<c:set var="s" value="${fn:split('Hello, Java Server Pages!',' ')}"/>
<p>배열의 길이 
<p> ${fn:length(s)}
<p> <c:forEach var="s1" items="${s}">
    ${s1}<br>
 </c:forEach>
<p>배열형태로 출력 
  <c:forEach var="i" begin="0" end="${fn:length(s)-1}">
      <p>text[${i}] = ${s[i]}
  </c:forEach>
<p>배열을 하나의 문자열로 연결하여 출력  
<p><c:out value="${fn:join(s,'-')}"/>  
<p><c:out value="${fn:join(s,' ')}"/>    

</body>
</html>