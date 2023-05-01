<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
<%@ include file="dbconn.jsp" %><!-- DBMS연결 -->
<%
 String id = request.getParameter("id");

//PreparedStatemnet객체 생성
String sql="delete from product where p_id=?";
conn.setAutoCommit(false);//수동 커밋
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,id);

//sql문 전달
pstmt.executeUpdate();

conn.commit();//db반영
if(pstmt !=null) pstmt.close();
if(conn !=null) conn.close();

conn.setAutoCommit(true);//자동 커밋으로 되돌리기

//상품 등록 작어 완료 후 상품 목록으로 이동.
response.sendRedirect("editProduct.jsp?edit=delete");




%>