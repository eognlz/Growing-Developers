<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRAINING INSERT_PAGE</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<h4>방문 예약 입력</h4>
	<!-- 아래 파일 받으려면 아래 enctype 필요! -->
	<form action="comInsert.do" method="post">
		<table border="1">
			<tr>
				<td>Title</td>
				<td><input type="text" name="com_title"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea rows="5" cols="30" name="com_content" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
	<a href="/pet/board/comList"><button>리스트 보기</button></a>
	
</body>
</html>