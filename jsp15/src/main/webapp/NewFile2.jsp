<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>	
<%
 String sql ="select bno, btitle, bfilename, bfiledata from boards where bno=?";
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setInt(1, 1);
 ResultSet rs = pstmt.executeQuery();
 rs.next();
 
response.setHeader("Content-Type", "image/png");
String filename2 = new String(rs.getString(3).getBytes("8859_1"), "euc-kr");

byte b[] = new byte[1024];

response.setHeader("Content-Disposition", 
		           "attachement:filename=" + new String(rs.getString(3).getBytes("euc-kr")) + ";");

  Blob blob = rs.getBlob(4);
 //DB로 부터 추출한 Blob객체를 읽어들이는 스트림 경로 생성
	BufferedInputStream fin = new BufferedInputStream(blob.getBinaryStream());
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	int read = 0;
	while ((read = fin.read(b)) != -1) {
		outs.write(b, 0, read);
	}
	outs.close();
	fin.close();
%>