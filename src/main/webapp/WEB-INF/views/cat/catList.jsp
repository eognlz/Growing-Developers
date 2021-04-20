<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../include/header.jsp" />
	<div class="col-xs-8" align="center">
	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		
		<tr>	 <!-- a href="/pet/board/d_search?title=Beagle" -->
			<td><a href="/pet/board/catList">전체</a></td>
			<td><a href="/pet/board/c_search?title=British Short Hair">브리티쉬숏헤어</a></td>
			<td><a href="/pet/board/c_search?title=Munchkin">먼치킨</a></td>
		</tr>
		<tr>
			<td><a href="/pet/board/c_search?title=Norwegian Forest">노르웨이숲</a></td>
			<td><a href="/pet/board/c_search?title=Persian">페르시안</a></td>
			<td><a href="/pet/board/c_search?title=Rekdol">렉돌</a></td>
		</tr>
		<tr>
			<td><a href="/pet/board/c_search?title=Russian Blue">러시안블루</a></td>
		</tr>
		
	</table>
	</div>
	
	<div>
		<c:forEach varStatus="i" var="pic" items="${list}">
		<div style="border: 1px solid gold; float: left; padding: 10px; background-size: cover;">
				<a href="/pet/board/catView/${pic.c_num}"><img style="width:265px; height: 265px;" src="/pet/board/cpic/${pic.c_num}" ></a><br>
			<div>
				<c:if test="${userId != null}">
   				<button><img src='/pet/resources/images/like/like_no.jpeg' style="width:20px; height: 20px; " id="like_img${pic.c_num}" onclick="clike_update('${pic.c_num}')"></button>
  						<%-- <h5 id="cat_count${pic.c_num}">${c_count}</h5> --%>
  				 &nbsp;<span id="rec_count${pic.c_num}"> </span>
  				 </c:if>
  				 <c:if test="${userId == null}">
   				<button><img src='/pet/resources/images/like/like_no.jpeg' style="width:20px; height: 20px; " id="like_img${pic.c_num}" onclick="like_IdNull()"></button>
  						<%-- <h5 id="cat_count${pic.c_num}">${c_count}</h5> --%>
  				 &nbsp;<span id="rec_count${pic.c_num}"> </span>
  				 </c:if>
				&nbsp;&nbsp;${pic.c_title} <%-- ${userId} --%>
			</div>
		</div>
		</c:forEach>
	</div>
	<div align="center">
	<br>
	<br>
		<c:if test="${userId == 'aa'}">
			<a href="/pet/board/catInsertPage"><button>게시글 등록</button></a>&nbsp;&nbsp;
		</c:if>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
<script>
function like_IdNull(){
	alert("로그인 후 사용이 가능합니다.");
}

function like_func_var(c_num){
	 $.ajax({
		url: "/pet/board/c_count",
   		type: "GET",
  		data: {
   				c_num: c_num
		},
		
   		success: function (responseData) {
   			$('#rec_count'+c_num).html(responseData);
   		}
	}) 
} 

function like_func(){
	<c:forEach var="pic" items="${list}">
	//like_func_var();
	 $.ajax({
		url: "/pet/board/c_count",
        type: "GET",
        data: {
        	c_num: ${pic.c_num}
			},
			
        success: function (responseData) {
        	$("#rec_count${pic.c_num}").html(responseData);
        }
	}) 
	</c:forEach>
}like_func();

function likeCheck(){
	<c:forEach varStatus="i" var="pic" items="${list}">
	$.ajax({
		url: "/pet/board/CL_Check",
		type: "POST",
		data: {
			c_num: ${pic.c_num},
			p_user: '${userId}'
		},
		success: function (c_Check){
			var like_img='';
			
			if(c_Check == 0){
				like_img = "/pet/resources/images/like/like_no.jpeg";
			}else{
				like_img = "/pet/resources/images/like/like_ok.jpeg";
			}
		$('#like_img${pic.c_num}').attr('src', like_img);
		}
	})
	
	</c:forEach>
}
likeCheck();


function clike_update(c_num){
	$.ajax({
		url: "/pet/board/clikeUpdate",
		type: "POST",
		data: {
			c_num: c_num,
			p_user: '${userId}'
		},
		success: function(responeceDate){
			var like_img = '';
			
			if(responeceDate == 0){
				 like_img = "/pet/resources/images/like/like_no.jpeg";
			}else{
				 like_img = "/pet/resources/images/like/like_ok.jpeg";
			}
			$('#like_img'+c_num).attr('src', like_img);
			like_func_var(c_num);
		}
	})
}

</script>

</html>