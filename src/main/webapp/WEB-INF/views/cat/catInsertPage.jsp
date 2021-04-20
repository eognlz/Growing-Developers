<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD INSERT_PAGE</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<h2>고양이 게시글 입력</h2>
	<!-- 아래 파일 받으려면 아래 enctype 필요! -->
	<form action="catInsert.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="c_title"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="c_name"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" name="c_content"></textarea></td>
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
	<a href="board/catList"><button>리스트 보기</button></a>
</body>
</html>