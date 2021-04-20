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
		<h4>방문 예약 정보</h4>
		글번호: ${comView.com_num}
		<br>
		<br>
		제목: ${comView.com_title}
		<br>
		<br>
		내용: ${comView.com_content}
		<br>
		<br>

		<a href="/pet/board/comList"><button>리스트 보기</button></a> &nbsp;&nbsp;
		
		<%-- <c:set var="p_nick" value="${comView.p_nick}" /> --%>
		<c:if test="${userNick eq comView.p_nick or userId eq 'aa'}">	
		
			<a href="/pet/board/comUpdatePage/${comView.com_num}"><button>수정하기</button></a> &nbsp;&nbsp;
			<a href="/pet/board/comDelete/${comView.com_num}" onclick="return confirm('삭제하시겠습니까?')"><button>삭제하기</button></a>
		</c:if>
	</div>
</body>
</html>