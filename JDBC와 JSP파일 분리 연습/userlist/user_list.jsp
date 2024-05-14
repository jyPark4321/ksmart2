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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
	<%@ include file = "/module/top.jsp" %>
	<%@ include file = "/module/left.jsp" %>
	<h3 style="text-align : center">회원 리스트</h3> <br>
	<table width="100%" border="1">
		<tr>
			<th>아이디</th><th>비번</th><th>권한</th><th>이름</th><th>이메일</th><th>휴대전화 번호</th><th>주소</th><th>수정</th><th>삭제</th>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			pstmt = conn.prepareStatement("SELECT * FROM tb_user");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
				<tr>
					<td><%= rs.getString("u_id") %></td>
					<td><%= rs.getString("u_pw") %></td>
					<td><%= rs.getString("u_level") %></td>
					<td><%= rs.getString("u_name") %></td>
					<td><%= rs.getString("u_email") %></td>
					<td><%= rs.getString("u_phone") %></td>
					<td><%= rs.getString("u_addr") %></td>
					<td><a href = "<%= request.getContextPath()%>/userupdate/user_update_form.jsp?send_id=<%= rs.getString("u_id")%>">수정버튼</a></td>
					<td><a href = "<%= request.getContextPath()%>/userdelete/user_delete_action.jsp?send_id=<%= rs.getString("u_id")%>">삭제버튼</a></td>
				</tr>
	<%
			}
			
		}catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 사용한 Statement 종료
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			
			// 7. 커넥션 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	
	</table>
	
	
	<%@ include file = "/usersearch/user_search_form.jsp" %>
	<%@ include file = "/module/hadan.jsp" %>
</body>
</html>

