<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2 align="center">정보 수정</h2>
<hr>
	<h3>회원 정보 수정</h3>
	<form action="userUpdate" method="post" >
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" value="${vo.userName}"></td>
			</tr>
			
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="userNick" value="${vo.userNick}"></td>
			</tr>

			<tr>
				<td>핸드폰</td><!-- 정규표현식 : pattern=^[0][1][0-9](-\s)\d{4}(-\s)\d{4}-->
				<td><input type="text" name="userPhone" value="${vo.userPhone}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="정보수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>