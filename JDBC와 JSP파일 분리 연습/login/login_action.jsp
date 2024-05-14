<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>


<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	System.out.println(uid + "<-- uid login_action.jsp");
	System.out.println(upw + "<-- upw login_action.jsp");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String dbid = null;
	String dbpw = null;
	String dblevel = null;
	String dbname = null;
	String dbemail = null;
	String msg = null;
	
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <-- conn");
		
		pstmt = conn.prepareStatement("SELECT u_id,u_pw,u_level,u_name FROM tb_user WHERE u_id=?");
		pstmt.setString(1, uid);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			System.out.println("1-1 아이디 일치 조건");
				dbid = rs.getString("u_id");
				dbpw = rs.getString("u_pw");
				dblevel = rs.getString("u_level");
				dbname = rs.getString("u_name");
				System.out.println(dbid);
				System.out.println(dbpw);
				System.out.println(dblevel);
				System.out.println(dbname);
			if(upw.equals(dbpw)){
				System.out.println("2-1 로그인 성공");
				session.setAttribute("S_ID", dbid);
				session.setAttribute("S_NAME", dbname);
				session.setAttribute("S_LEVEL", dblevel);
				msg = "로그인 성공";
			} else{
				System.out.println("2-2 비번불일치");
				msg = "비번 불일치";
			}
		} else{
			System.out.println("1-2 아이디 불일치 조건");
		}
		
	}catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href='<%=request.getContextPath()%>/index.jsp'
</script>
	