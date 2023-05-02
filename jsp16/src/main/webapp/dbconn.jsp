<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
    Connection conn=null;
    //1.드라이버 로딩
	Class.forName("com.mysql.cj.jdbc.Driver");
    //2. 연결객체 맺기
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbookdb?user=root&password=1234");
%>

</body>
</html>