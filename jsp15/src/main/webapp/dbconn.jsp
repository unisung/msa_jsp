<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<%
	// JDBC드라이버를 STATIC메모리에 로딩하기
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 연결객체(Connection) 얻기
	// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "java", "oracle");
%>