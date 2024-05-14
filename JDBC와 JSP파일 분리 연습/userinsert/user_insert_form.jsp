<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
	<%@ include file = "/module/top.jsp" %>
	<%@ include file = "/module/left.jsp" %>
	<form action="<%= request.getContextPath() %>/userinsert/user_insert_action.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" size="20"></td>
			<tr>
			<tr>
				<td>암호</td>
				<td><input type="text" name="user_pw" size="20"></td>
			<tr>
			<tr>
				<td>권한</td>
				<td><input type="text" name="user_level" size="20"></td>
			<tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" size="20"></td>
			<tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="user_email" size="20"></td>
			<tr>
			<tr>
				<td>휴대전화 번호</td>
				<td><input type="text" name="user_phone" size="20"></td>
			<tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="user_addr" size="20"></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="회원가입버튼"></td>
			</tr>
		</table>
	</form>
	<%@ include file = "/module/hadan.jsp" %>
</body>
</html>