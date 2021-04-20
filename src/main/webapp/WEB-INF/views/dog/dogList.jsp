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
			<td><a href="/pet/board/dogList">전체</a></td>
			<td><a href="/pet/board/d_search?title=Beagle">비글</a></td>
			<td><a href="/pet/board/d_search?title=Chihuahua">치와와</a></td>
		</tr>
		<tr>
			<td><a href="/pet/board/d_search?title=Corgi">웰시코기</a></td>
			<td><a href="/pet/board/d_search?title=Maltese">말티즈</a></td>
			<td><a href="/pet/board/d_search?title=Shiba">시바견</a></td>
		</tr>
		<tr>
			<td><a href="/pet/board/d_search?title=Speech">스피치</a></td>
		</tr>
	</table>
</div>

<!--  style="border: 1px solid gold; float: left; padding: 10px; background-size: cover;" -->
	<div>
		<c:forEach varStatus="i" var="pic" items="${list}">
		<div style="border: 1px solid gold; float: left; padding: 10px; background-size: cover;">
				<!-- <a href="/pet/board/updatePage/${pic.d_num}"><img style="width:265px; height: 265px;" src="/pet/board/pic/${pic.d_num}" ></a> -->
				<a href="/pet/board/dogView/${pic.d_num}"><img style="width:265px; height: 265px;" src="/pet/board/pic/${pic.d_num}" ></a><br>
			<div>
			<!--<c:if test="${userId != null}">
				<c:if test="${count != 0 }">
				
				 	<a href='javascript: like_func();'><img src="/pet/resourc/images/like/like_ok.jpeg"></a>
				 	
					 추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>	 
					
				</c:if>
				
				<c:if test="${count != 0 }">
					<button class="w3-button w3-black w3-round" id="rec_update${i.count}">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				</c:if>
			</c:if>-->
			<!--  <c:if test="${userId == null}">
				<script>
					alert("${message}");
					history.back();
				</script>
			</c:if>  -->
				 
   						  <!-- <a href='javascript: like_Idcheck();'><img src='/pet/resourc/images/like/like_ok.jpeg' ></a> -->
   						<c:if test="${userId != null}">
   						<button><img src='/pet/resources/images/like/like_no.jpeg' style="width:20px; height: 20px; " id="like_img${pic.d_num}" onclick="like_update('${pic.d_num}')"></button>
  						<%-- <span src="/pet/board/likeCount/${pic.d_num}">${count}</span> --%>
  						&nbsp;<span id="rec_count${pic.d_num}"> </span>
  						</c:if>
  						<c:if test="${userId == null}">
   						<button><img src='/pet/resources/images/like/like_no.jpeg' style="width:20px; height: 20px; " id="like_img${pic.d_num}" onclick="like_IdNull()"></button>
  						<%-- <span src="/pet/board/likeCount/${pic.d_num}">${count}</span> --%>
  						&nbsp;<span id="rec_count${pic.d_num}"> </span>
  						</c:if>
				&nbsp;&nbsp;${pic.d_title} <%-- ${userId} --%>
			</div>
		</div>
			<%-- <td style="width: 33%;"><img src="/pet/board/pic/${pic.cname}"></td> --%>
		</c:forEach>
	</div>
	
	
	<div align="center">
	<br>
	<!-- <form action="search">
		<input type="text" name="select" placeholder="입력"> <input
			type="submit" value="확인">
	</form> -->
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br>
		<c:if test="${userId == 'aa'}">
			<a href="/pet/board/dogInsertPage"><button>게시글 등록</button></a>&nbsp;&nbsp;
		</c:if>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
</body>

<script>
function like_IdNull(){
	alert("로그인후 사용 가능합니다.");
}

function like_func_var(d_num){
	 $.ajax({
	url: "/pet/board/likeCount",
    type: "GET",
    data: {
    	d_num: d_num
		},
		
    success: function (responseData) {
    	$('#rec_count'+d_num).html(responseData);
    }
}) 
} 

function like_func(){
	<c:forEach varStatus="i" var="pic" items="${list}">
	//like_func_var();
	 $.ajax({
		url: "/pet/board/likeCount",
        type: "GET",
        data: {
        	d_num: ${pic.d_num}
			},
			
        success: function (responseData) {
        	$("#rec_count${pic.d_num}").html(responseData);
        }
	}) 
	</c:forEach>
}like_func();

function likeCheck() {
	<c:forEach varStatus="i" var="pic" items="${list}">
	$.ajax({
		url: "/pet/board/likeCheck",
		type: "POST",
		data: {
			d_num: ${pic.d_num},
			p_user: '${userId}'
		},
		success: function (likeCheck) {
		var like_img ='';
	
	if(likeCheck == 0){
        like_img = "/pet/resources/images/like/like_no.jpeg";
      } else {
        like_img = "/pet/resources/images/like/like_ok.jpeg";
      }      
      $('#like_img${pic.d_num}').attr('src', like_img);
	
		}
	})
      </c:forEach>
} likeCheck();


function like_update(d_num){
	$.ajax({
		url: "/pet/board/likeUpdate",
		type: "POST",
		data: {
			d_num: d_num,
			p_user: '${userId}'
		},
		success: function (likeCheck) {
			
        	var like_img ='';
        	
        	if(likeCheck == 1){
                like_img = "/pet/resources/images/like/like_no.jpeg";
              } else {
                like_img = "/pet/resources/images/like/like_ok.jpeg";
              }      
              $('#like_img'+d_num).attr('src', like_img);
              like_func_var(d_num);
        }
		
	});
	
}
/* 	$.get(
		'./board/likeCount',
		data: {
			d_num: ${pic.d_num},
			p_user: '${userId}'
		}, success: function (data) {
        	$(".rec_count").html(data);
        });
		
	}  */
	
/* --기본틀
function calByAjax(){
	$.get(
		'./doPlus',
		{
			num1: 5,
			num: 10
		},function (data){
			alert(data);
		},
		'html'
		);
	} 
	
	
/* function like(d_num){
	if('${userId}' == null){
		alert("로그인 후 이용 가능합니다.");
		return false;
	}else{
	$.ajax({
		url: "/board/likeUpdate",
        type: "POST",
        data: {
            c_num: 0,
        	d_num: ${pic.d_num},
            p_user: '${userId}'},
        success: function () {
	        recCount(d_num);
        },
	}); 

}*/
	// 게시글 추천수
   /* function recCount() {
	
}
	<c:forEach varStatus="i" var="pic" items="${list}">
	$.ajax(
			{
			url: "/board/likeCount",
            type: "POST",
            data: {
                
            	d_num: ${pic.d_num},
				p_user: '${userId}'
            },
            success: function (data) {
            	$(".rec_count").html(count);
            },
			})
		</c:forEach>
    }
   	recCount(); 
     // 처음 시작했을 때 실행되도록 해당 함수 호출
	<c:forEach varStatus="i" var="pic" items="${list}">
		$(function(){	//#rec_update=id,  .rec_count=class
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
			$("#rec_update${i.count}").click(like(${pic.d_num}));
		}
	</c:forEach> */
</script>

</html>