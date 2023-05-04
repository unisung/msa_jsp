<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>Board</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 상세페이지</h1>
		</div>
	</div>
	<div class="container">
		<form name="newUpdate" action="./BoardUpdateAction.do" class="form-horizontal" 
		       method="post">
		     <input type="hidden"  name="id" value="${sessionId}">
		     <input type="hidden"  name="pageNum" value="${pageNum}">
		     <input type="hidden"  name="num" value="${board.num}">  
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name"  name="name"  class="form-control" value="${board.name}"  readonly required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" id="subject"  name="subject" class="form-control" value="${board.subject}" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-5">
					<textarea name="content" cols="50" rows="5" class="form-control"  required>${board.content}</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				   <c:set var="userId" value="${board.id}"/><!-- 작성자 id -->
				    <c:if test="${sessionId==userId}">
				     <p>
				     <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">삭제</button>					
					<input type="submit" class="btn btn-primary" value="수정" >
					<input type="reset" class="btn btn-secondary" value="취소" >
					</c:if>
					<a href="./BoardListAction.do?pageNum=${pageNum}" class ="btn btn-success">목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ${board.num }번 글을 삭제할까요?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-warning" onclick="deleteBoard()">삭제</button>
      </div>
    </div>
  </div>
</div>
<script>
function deleteBoard(){
    location.href="./BoardDeleteAction.do?num="+${board.num}+"&pageNum="+${pageNum};
}
</script>

