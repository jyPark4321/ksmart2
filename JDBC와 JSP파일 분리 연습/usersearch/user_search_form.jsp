<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath()%>/usersearch/user_search_list.jsp" method="post">
		<select name="sk">
			<option value="u_id" selected>아이디</option>
			<option value="u_level">권한</option>
			<option value="u_name">이름</option>
			<option value="u_email">이메일</option>
		</select>
		<input type="text" name="search_data">
		<input type="submit" value="검색버튼">
	</form>

</body>
</html>