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
<c:if test="${checkOK != null}">
		<script>
			alert("${checkOK}");
		</script>
	</c:if>
	<c:if test="${message != null}">
		<script>
			alert("${message}");
			history.back();
		</script>
	</c:if>
	<c:if test="${join != null}">
		<script>
			alert("${join}");
		</script>
	</c:if>
	
<h2>로그인 페이지</h2>
	<h4>상태: ${userId}</h4><br>
	<jsp:include page="../include/header.jsp"/>
	<form action="userlogin" method="post">
		<table>
			<tr>
				<td><input type="text" name="userId" placeholder="ID 입력"><td><br>
			</tr>
			<tr>
				<td><input type="password" name="userPw" placeholder="PW 입력"><td><br>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<a href="joinPage"><button>회원가입</button></a>
	<a href="passSearchPage"><button>비밀번호 찾기</button></a>
</body>
</html>