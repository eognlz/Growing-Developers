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
	<h4 align="center">훈련 게시글 입력</h4>
	<!-- 아래 파일 받으려면 아래 enctype 필요! -->
	<div align="center">
	<form action="/pet/board/trainingUpdate.do" method="post">
		<table border="1" >
			<tr>
				<td>Num</td>
				<td><input type="text" name="t_num" value="${trainView.t_num}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" name="t_title" value="${trainView.t_title}"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea rows="5" cols="30" name="t_content" placeholder="내용을 입력하세요" >${trainView.t_content}</textarea></td>
			</tr>
			<tr>
				<td>Path</td>
				<td><textarea rows="5" cols="30" name="t_path" placeholder="내용을 입력하세요" >${trainView.t_path}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
	<br>
	<a href="/pet/board/trainingList"><button>리스트 보기</button></a>
	</div>
	
</body>
</html>