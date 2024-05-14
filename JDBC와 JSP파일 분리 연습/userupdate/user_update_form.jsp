<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String send_id = request.getParameter("send_id");
	
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("SELECT * FROM tb_user AS u WHERE u.u_id = ?");
		pstmt.setString(1, send_id);
		System.out.println(pstmt + " <--pstmt 2");
		
		rs = pstmt.executeQuery();
%>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
	<%@ include file = "/module/top.jsp" %>
	<%@ include file = "/module/left.jsp" %>
<%
		while(rs.next()){
%>
			<form action="<%= request.getContextPath() %>/userupdate/user_update_action.jsp" method="post">
				<table width="50%" border="1">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="user_id" size="20" value=<%= rs.getString("u_id")%> readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="user_pw" size="20" value=<%= rs.getString("u_pw")%>></td>
					</tr>
					<tr>
						<td>권한</td>
						<td><input type="text" name="user_level" size="20" value=<%= rs.getString("u_level")%>></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="user_name" size="20" value=<%= rs.getString("u_name")%>></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="user_email" size="20" value=<%= rs.getString("u_email")%>></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="user_phone" size="20" value=<%= rs.getString("u_phone")%>></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="user_addr" size="20" value=<%= rs.getString("u_addr")%>></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정완료버튼"></td>
					</tr>
				</table>
			</form>
<%
		}
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	} finally{
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}	
	}
%>
<%@ include file = "/module/hadan.jsp" %>
</body>
</html>