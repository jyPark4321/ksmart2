<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "kr.or.ksmart.dao.Udao" %>

<%
	
	String send_id = request.getParameter("send_id");
	Udao udao = new Udao();
	udao.uDelete(send_id);
	
	
	
	response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
%>