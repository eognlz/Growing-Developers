<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Training View</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div align="center">
		<h4>트레이닝 정보</h4>
		
		Nick : ${trainView.p_nick}
		<br><br>
		Title : ${trainView.t_title}
		<br><br>
		Content : ${trainView.t_content}
		<br><br>
		 ${trainView.t_path}
		<br>
		
		<a href="/pet/board/trainingList"><button class="btn btn-primary" type="button">리스트 보기</button></a> &nbsp;&nbsp;
		<c:if test="${trainView.p_user == 'aa'}">	<!-- 아이디가 aa일때만 수정 가능! -->
			<!-- 기능 구현 해야함    -->
			<a href="/pet/board/trainingUpdatePage/${trainView.t_num}" onclick="return confirm('수정 하시겠습니까?')"><button class="btn btn-primary" type="button">수정하기</button></a> &nbsp;&nbsp;
			<a href="/pet/board/trainingDelete/${trainView.t_num}" onclick="return confirm('삭제 하시겠습니까?')"><button class="btn btn-primary" type="button">삭제하기</button></a>
		</c:if>
	</div>
</body>
</html>