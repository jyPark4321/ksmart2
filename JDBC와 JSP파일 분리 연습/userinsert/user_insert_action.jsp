<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "kr.or.ksmart.dao.Udao" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="u" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="u" property="*"/>
	

<%
	Udao udao = new Udao();
	udao.uInsert(u);
	
	response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
%>