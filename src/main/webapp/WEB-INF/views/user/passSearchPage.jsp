<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${pass != null}">
		<script>
			alert("${pass}"+" 입니다.");
			location.href="loginPage";
		</script>
	</c:if>
	<c:if test="${message != null}">
		<script>
			alert("${message}");
			history.back();
		</script>
	</c:if>
	
	<h3>message: ${message}</h3>
	<form action="passSearch" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" placeholder="ID입력"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" name="userPhone" placeholder="핸드폰번호"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>