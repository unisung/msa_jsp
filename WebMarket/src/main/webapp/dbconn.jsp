<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>  
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
    Connection conn=null;
    //1.드라이버 로딩
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    //2. 연결객체 맺기
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmarketdb?user=root&password=1234");
}catch(Exception e){
	out.print("데이타베이스 연결이 실패했습니다.<br>");
	out.print("SQLException: "+e.getMessage());
}
%>

</body>
</html>