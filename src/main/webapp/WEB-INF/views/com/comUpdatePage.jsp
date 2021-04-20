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
	<div align="center">
		<h4>방문 예약 정보</h4>
		<form action="/pet/board/comUpdatePage.do" method="post">
			<table>
				<tr>
					<td>글번호</td>
					<td><input type="text" name="com_num" value="${comView.com_num}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="com_title" value="${comView.com_title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="30" name="com_content" placeholder="내용을 입력하세요">${comView.com_content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
		<br>
		<a href="/pet/board/comList"><button>리스트 보기</button></a> &nbsp;&nbsp;
		
	<%-- 	<c:set var="p_nick" value="${comView.p_nick}" />
		<c:if test="${userNick eq p_nick}">	<!-- 아이디가 aa일때만 수정 가능! -->
		<c:if test="${userId == 'aa'}">
			<a href="/pet/board/comUpdatePage/${comView.com_num}"><button>수정하기</button></a> &nbsp;&nbsp;
			<a href="/pet/board/comDelete/${comView.com_num}" onclick="return confirm('삭제하시겠습니까?')"><button>삭제하기</button></a>
		</c:if> --%>
	</div>
</body>
</html>