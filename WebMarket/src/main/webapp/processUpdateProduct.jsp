<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
<%@ include file="dbconn.jsp" %><!-- DBMS연결 -->
<%
//현재페지이에 맞는 문자셋으로 설정
request.setCharacterEncoding("utf-8");

String filename = "";
String realFolder = "c:\\upload";
int maxSize = 5*1024*1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, 
		                                      realFolder, 
		                                      maxSize, 
		                                      encType, 
		                     new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");
String pname = multi.getParameter("name");
Integer unitPrice =Integer.parseInt(multi.getParameter("unitPrice"));//상품가격
String description =multi.getParameter("description");//상품설명
String manufacturer=multi.getParameter("manufacturer");//제조사
String category=multi.getParameter("category");//분류
long unitsInStock=Long.parseLong(multi.getParameter("unitsInStock"));//재고 수
String condition=multi.getParameter("condition");//상태

//upload파일 정보 얻기
Enumeration files = multi.getFileNames();
String fname = (String)files.nextElement();
String fileName = multi.getFilesystemName(fname);

//PreparedStatemnet객체 생성
String sql="update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?," 
		  + " p_unitsInstock=?, p_condition=?, p_filename=? where p_id=? ";
PreparedStatement pstmt = conn.prepareStatement(sql);

Product  newProduct = new Product();
//setter메소드로 객체에 속성값 설정
newProduct.setProductId(productId);
newProduct.setPname(pname);
newProduct.setUnitPrice(unitPrice);
newProduct.setDescription(description);
newProduct.setCategory(category);
newProduct.setManufacturer(manufacturer);
newProduct.setUnitsInStock(unitsInStock);
newProduct.setCondition(condition);
newProduct.setFilename(fileName);//이미지 파일명 추가

int cnt=0;
//getter메소드로 객체의 속성값 가져와서 pstmt값 설정하기
pstmt.setString(++cnt,newProduct.getPname());
pstmt.setInt(++cnt, newProduct.getUnitPrice());
pstmt.setString(++cnt,newProduct.getDescription());
pstmt.setString(++cnt,newProduct.getManufacturer());
pstmt.setString(++cnt,newProduct.getCategory());
pstmt.setLong(++cnt,newProduct.getUnitsInStock());
pstmt.setString(++cnt,newProduct.getCondition());
pstmt.setString(++cnt,newProduct.getFilename());
pstmt.setString(++cnt,newProduct.getProductId());//key

//sql문 전달
pstmt.executeUpdate();

if(pstmt !=null) pstmt.close();
if(conn !=null) conn.close();

//상품 등록 작어 완료 후 상품 목록으로 이동.
response.sendRedirect("editProduct.jsp?edit=update");//수정페이지로 이동




%>