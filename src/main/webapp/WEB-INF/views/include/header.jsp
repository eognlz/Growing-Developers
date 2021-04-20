<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to PetWorld</title>
</head>
<body>
<div>
	<h2 align="center"><a href="/pet/user">브랜드</a></h2>
	<hr>
	<div align="center">
	<a href="/pet/board/dogList">강아지</a>
	<a href="/pet/board/catList">고양이</a>
	<a href="/pet/board/trainingList">펫훈련방법</a>
	<a href="/pet/board/comList">방문예약</a>
	<!-- <a href="/pet/board/bunList">분양</a> -->
	<div align="right">
		<c:if test="${userId != null}">
			<a href="/pet/user/loginOut"><button>로그아웃</button></a>
			<a href="/pet/user/updatePage"><button>정보수정</button></a>
		</c:if>
		<c:if test="${userId == null}">
			<a href="/pet/user/loginPage"><button>로그인</button></a>
			<a href="/pet/user/joinPage"><button>회원가입</button></a>
		</c:if>
	</div>
	</div>
	<hr>
</div>
</body>
</html>