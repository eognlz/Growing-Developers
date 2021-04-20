<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD INSERT_PAGE</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<h2>강아지 게시글 입력</h2>
	<!-- 아래 파일 받으려면 아래 enctype 필요! -->
		<div style="border: 1px solid gold; float: left; padding: 10px; background-size: cover;">
			<img style="width:265px; height: 265px;" src="/pet/board/pic/${info.d_num}" >
		</div>
	<form action="${pageContext.request.contextPath}/board/dogUpdate?d_num=${info.d_num}" method="post" enctype="multipart/form-data">
		
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="d_title" value="${info.d_title}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="d_name" value="${info.d_name}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" name="d_content">${info.d_content}</textarea></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
	<a href="/pet/board/dogList"><button>리스트 보기</button></a>
</body>
</html>