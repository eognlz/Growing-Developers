<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<!-- 로그아웃 처리 해야함 <c:if test="${userId != null}">
		<script>
			document.
			history.back();
		</script>
	</c:if> -->

 <h4>session : ${userId}</h4> 
<jsp:include page="../include/header.jsp"/>
	<h2>강아지</h2>
<div align="center"><!-- 전체 div -->
	<div class="col-xs-8">	<!-- 강아지 div -->
	
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Beagle"><img src="/pet/resources/images/dog/dog_Beagle.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">비글</em>
				" Beagle "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Chihuahua"><img src="/pet/resources/images/dog/dog_Chihuahua.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">치와와</em>
				" Chihuahua "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Corgi"><img src="/pet/resources/images/dog/dog_Corgi.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">웰시코기</em>
				" Welsh Corgi "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Maltese"><img src="/pet/resources/images/dog/dog_Maltese.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">말티즈</em>
				" Maltese "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Shiba"><img src="/pet/resources/images/dog/dog_Shiba.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">시바견</em>
				" Shiba "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/d_search?title=Speech"><img src="/pet/resources/images/dog/dog_Speech.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">스피치</em>
				" Speech "
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="col-xs-8"> <!-- 고양이 div -->
	<h2>고양이</h2>
							<!-- 테두리선 레드 -->
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_British Short Hair.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">브리티쉬숏헤어</em>
				" British Short Hair "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_Munchkin.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">먼치킨</em>
				" Munchkin "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_Norwegian Forest.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">노르웨이 숲</em>
				" Norwegian Forest "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_Persian.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">페르시안</em>
				" Persian "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_Rekdol.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">렉돌</em>
				" Rekdol "
			</div>
		</div>
		
		<div style="border: 1px solid gold; float: left; padding:10px; background-size: cover;">
			<div>
				<a href="/pet/board/search?select=a"><img src="/pet/resources/images/cat/cat_Russian Blue.jpeg" style="width:265px; height: 265px;"></a>
			</div>
			<div>
				<em style="padding-right:5px;color:#605757;display: ">러시안 블루</em>
				" Russian Blue "
			</div>
		</div>
		
	</div>
</div>
	
	
	<!-- <div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			첫번째 영역
		</div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			두번째 영역
		</div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			세번째 영역
		</div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			네번째 영역
		</div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			다섯번째 영역
		</div>
		<div style="border: 1px solid gold; float: left; width: 30%; padding:10px;">
			여섯번째 영역
		</div>
	</div> -->
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
<div align="center">
<a href="/pet/user/joinPage"><button>회원가입 페이지</button></a>
<a href="/pet/user/address">주소</a>&nbsp;&nbsp;
<a href="/pet/user/header">헤더</a>&nbsp;&nbsp;
</div>
</body>
<!-- <script> 메인 페이지는 디비에서 정보를 가지고 오는게 아니기때문에 관리가 어렵다 
				그렇기때문에 강아지 테이블에 좋아요 기능 구현 !
	
	$(function(){
	//좋아요 클릭시(추가 또는 제거)
	$("#rec_update").click(function(){
		$.ajax({
			url: "/user/like_update",
			type: "POST",
			data: {
				id: '${id}'
			},
			success: function(){
				recCount();
			},
		})
	})
	})
</script>  -->
</html>