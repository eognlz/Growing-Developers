<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Pet_TraingList</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 <style>
      table, th, td {
        border: 1px solid #bcbcbc;
      }
     .jb-th-1 {
     width: 30px;
  }
  .jb-th-2 {
     width: 30px;
  }
  .jb-th-3 {
     width: 100px;
  }
  .jb-th-4 {
     width: 10px;
  }
  .jb-th-5 {
     width: 10px;
  }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
	<h4 align="center">애견 훈련하는 방법</h4>
	<br>
	<div class="container">
		<div align="right">
			<div class="col-xs-8">
				<form action="/pet/board/trainingSearch" method="get">
					<input name="t_title"  type="text" size="20">
					<button class="btn btn-primary" type="submit">검색</button>
				</form>
			</div>
		</div>
		<div  align="center">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead align="center">
					<tr>
						<th class="jb-th-1"> 글번호</th>
						<th class="jb-th-2"> 닉네임 </th>
						<th class="jb-th-3"> 제목 </th>
						<th class="jb-th-4"> 작성일 </th>
					<c:if test="${userId == 'aa'}">
						<th class="jb-th-5"> 수정 </th>
					</c:if>
					</tr>	
			</thead> 
				<tbody>
					<c:forEach var="list" items="${tList}">
						<tr>
							<td>${list.t_num}</td>
							<td>${list.p_nick}</td>
							<td><a href="/pet/board/trainingView/${list.t_num}">${list.t_title}</a></td>
							<td>${list.t_date}</td>
						<c:if test="${userId == 'aa'}">
							<th class="jb-th-5"><a href="/pet/board/trainingUpdatePage/${list.t_num}" onclick="return confirm('수정 하시겠습니까?')">수정</a>&nbsp;&nbsp;<a href="/pet/board/trainingDelete/${list.t_num}" onclick="return confirm('삭제 하시겠습니까?')">삭제</a></th>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${userId == 'aa'}">
				<a href="/pet/board/trainingInsertPage"><button class="btn btn-primary" type="button">Training 등록</button></a>&nbsp;&nbsp;
			</c:if>
		</div>
	</div>

</body>
</html>