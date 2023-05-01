<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 편집</title>
<script>
  function deleteConfirm(id){
	  if(confirm("해당 상품을 삭제합니다!!") ==true){
		  location.href='./deleteProduct.jsp?id=' +id;
	  }else{
			  return;
	   }
  }
</script>
<%
	String edit =request.getParameter("edit");
%>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 편집
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="row" align="center">
		      <%@ include file="dbconn.jsp" %><!-- DB연결객체 생성  -->
              <%
              	PreparedStatement pstmt = conn.prepareStatement("select * from product");
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
               %>
               <div class="col-md-4">
                 <img src="/resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
                 <h3><%=rs.getString("p_name")%></h3>
                 <p><%=rs.getString("p_description") %>
                 <p><%=rs.getString("p_unitPrice") %>원
                  <%
                  	if(edit.equals("update")){
                  %>  
                 
                 <p><a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" 
                                              class="btn btn-success" role="button">수정 &raquo;></a>
                  <%
                  	}else if(edit.equals("delete")){
                  	%>
                 <p><a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" 
                                              class="btn btn-danger" role="button">삭제 &raquo;></a>	
                  	<%	
                  	}
                  %>
               
               </div>
               <%		
              	}
              %>
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>