<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
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

ProductRepository dao = ProductRepository.getInstance();

Product  newProduct = new Product();
newProduct.setProductId(productId);
newProduct.setPname(pname);
newProduct.setUnitPrice(unitPrice);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInStock(unitsInStock);
newProduct.setCondition(condition);
newProduct.setDescription(description);
newProduct.setFilename(fileName);//이미지 파일명 추가

dao.addProduct(newProduct);

//상품 등록 작어 완료 후 상품 목록으로 이동.
response.sendRedirect("products.jsp");




%>