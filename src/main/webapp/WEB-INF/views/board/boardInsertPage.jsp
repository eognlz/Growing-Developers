<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD INSERT_PAGE</title>
</head>
<body>
<h2>게시글 입력</h2>						<!-- 아래 파일 받으려면 아래 enctype 필요! -->
<form action="boardinsert" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="cname"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="c_pic"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>
	<a href="board/list"><button>리스트 보기</button></a>
</body>

</html>