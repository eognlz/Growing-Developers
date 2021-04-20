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
	<h2>리스트</h2>
	<jsp:include page="../include/header.jsp"/>
		
	<div>
		<c:forEach var="pic" items="${list}" >
		<div style="border: 1px solid gold; float: left; width: 20%; padding:10px;">
			<img src="/pet/board/pic/${pic.cname}">
			<div>
				${pic.cname}
			</div>
		</div>
		
		<%-- <td style="width: 33%;"><img src="/pet/board/pic/${pic.cname}"></td> --%>
		</c:forEach>
	</div>
	<br>
	<form action="search">
		<input type="text" name="select" placeholder="입력">	
		<input type="submit" value="확인">
	</form>
	<a href="/pet/board/boardInsertPage">게시글 등록</a>&nbsp;&nbsp;
	
</body>
</html>