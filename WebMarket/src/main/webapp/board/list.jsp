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
<title>게시판</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				게시판
			</h1>
		</div>
	</div>	
	<div class="container">
      <form action="<c:url value="./BoardListAction.do" />" method="post">
         <div>
           <div class="text-right">
           	 <span class="badge badge-success">전체 ${total_record}건</span>
           </div>
         </div>
         <div style="padding-top:50px">
             <table class="table table-hover">
                 <tr>
                    <th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th>
                 </tr>
                 <c:forEach var="notice" items="${boardlist}">
                   <tr>
                     <td>${notice.num }</td>
                     <td><a href="./BoardViewAction.do?num=${notice.num }&pageNum=${pageNum}">${notice.subject }</a></td>
                     <td>${notice.regist_day }</td>
                     <td>${notice.hit }</td>
                     <td>${notice.name }</td>
                   </tr>                
                 </c:forEach>
             </table>
         </div><!--  게시글 출력.  -->

         <div align="center">
           <c:set var="pageNum" value="${pageNum}"/>
		 <nav aria-label="...">
           <ul class="pagination">
            <c:if test="${startPage==1}">
             <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			 </li>
			</c:if>
            <c:if test="${startPage!=1}">
             <li class="page-item">
			      <a class="page-link">Previous</a>
			 </li>
			</c:if>
           <c:forEach var="i" begin="1" end="10" >
              <li class="page-item">
                <c:choose>
                  <c:when test="${pageNum==i}">
                    <li class="page-item active" aria-current="page">
                    <a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">${i}
                    </a>
                  </c:when>
                  <c:otherwise>
                     <a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">${i}
                    </a>
                  </c:otherwise>
                </c:choose>
              </li>
           </c:forEach>
                 <c:if test="${endPage==total_page}">
            <li class="page-item disabled">
                 <a class="page-link" >Next</a>
            </li>     
                 </c:if>
                 
                 <c:if test="${endPage<total_page}">
                 <li class="page-item">
			      <a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${endPage+1}&items=${items}&text=${text}&startPage=${startPage}"/>">Next</a>
			      </li>
			      </c:if>
			 </li>
           </ul>
           
           </nav>
         </div><!-- page navigation -->
         <div align="center">
            <table>
              <tr>
                <td width="100%" align="left">&nbsp;&nbsp;
                <select name="items" class="text">
                   <option value="subject">제목에서</option>
                   <option value="content">내용에서</option>
                   <option value="name">글쓴이에서</option>
                </select>
                <input name="text" >
                <input type="submit" id="btnAdd" class="btn btn-primary btn-sm" value="검색">
                </td>
                <td width="100%" align="right" >
                  <a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
                </td>
              </tr>
            </table>
         </div>
         
      </form>
		<hr>
	</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>