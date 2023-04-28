<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");

  try{
   String sql="select userid, userpassword from users where userid=? and userpassword=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,id);
   pstmt.setString(2,pwd);
   
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()){//아이디나 비번 중 하나이상 오류
   String dbId = rs.getString(1);
   String dbPwd = rs.getString(2);

	if((dbId!=null) &&(dbPwd!=null) && id.equals(dbId) & pwd.equals(dbPwd)){
		session.setAttribute("userId", id);
		session.setAttribute("userPW", pwd2);
		%>
		<script>
		 alert('비번이 변경되었습니다.');
		/*  history.back(); */
		history.go(-1);
		</script>
       <!--  out.print("<script>alert('비번이 변경되었습니다.');");
        out.print("history.back();</script>"); -->
        <%
	 }
    }else{
    	out.print("아이디 혹은 비번을 확인하세요.");
    }
  }catch(Exception e){
	  System.out.println("오류발생:"+e.getMessage());
  }
%>
</body>
</html>