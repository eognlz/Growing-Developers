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
	<jsp:include page="../include/header.jsp" />
	<div>
		<h2>강아지 정보</h2>
		<div align="center" style="border: 1px solid gold; float: left; padding: 10px; background-size: cover;">
			<img style="width:265px; height: 265px;" src="/pet/board/pic/${info.d_num}" >
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		이름: ${info.d_name}
		<br>
		<br>
		내용: ${info.d_content}
		<br>
		<br>
		<a href="/pet/board/dogList"><button>리스트 보기</button></a> &nbsp;&nbsp;
		<c:set var="userId" value="${userId}"/>
		<c:if test="${userId == 'aa'}">	<!-- 아이디가 aa일때만 수정 가능! -->
			<a href="/pet/board/updatePage/${info.d_num}"><button>수정하기</button></a> &nbsp;&nbsp;
			<a href="/pet/board/dogDelete/${info.d_num}" onclick="return confirm('삭제하시겠습니까?')"><button>삭제하기</button></a>
		</c:if>
	</div>
</body>
</html>