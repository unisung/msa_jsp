<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
<%
	request.setCharacterEncoding("utf-8");

    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String name=request.getParameter("name");
    String gender=request.getParameter("gender");
    String year=request.getParameter("birthyy");
    String month=request.getParameter("birthmm").length()<2?"0"+request.getParameter("birthmm"):request.getParameter("birthmm");
    String day=request.getParameter("birthdd").length()<2?"0"+request.getParameter("birthdd"):request.getParameter("birthdd");
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
%>
<%=id%><br>
<%=password%><br>
<%=name%><br>
<%=gender%><br>
<%=year%><br>
<%=month%><br>
<%=day%><br>
<%=mail1%><br>
<%=mail2%><br>
<%=phone%><br>
<%=address%><br>
