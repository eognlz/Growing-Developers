<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입 페이지</h2>
	<jsp:include page="../include/header.jsp"/>
	<div align="center">				<!-- 아래 파일 받으려면 아래 enctype 필요! = post뒤에 enctype="multipart/form-data" -->
	<form action="/pet/user/userjoin" method="post" >
		<table border="1" >
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId"><!-- <button type="button" id="userck">중복 검사</button></td> -->
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="userNick"></td>
			</tr>

			<tr>
				<td>핸드폰</td><!-- 정규표현식 : pattern=^[0][1][0-9](-\s)\d{4}(-\s)\d{4}-->
				<td><input type="text" name="userPhone"></td>
			</tr>
			
			<tr>
				<td>email</td>
				<td><input type="text" name="userEmail"></td>
			</tr>
	
			<tr>
				<td><input type="text" id="sample4_postcode" name="userAddnum" placeholder="우편번호"></td>
				<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
			</tr>
			<tr>
				<td><input type="text" id="sample4_roadAddress" name="userAddress" placeholder="도로명주소"></td>
				<!-- <td><input type="text" id="sample4_jibunAddress" placeholder="지번주소"></td> -->
				<td><span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" name="userDetails" placeholder="상세주소"></td>
				<!-- <td><input type="text" id="sample4_extraAddress" placeholder="참고항목"></td> -->
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>

		</table>
		<!-- 이미지 처리 <div id="lodingImage">
			<img src="/web2/resources/images/loding.gif">
		</div> -->
	</form>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //if(extraRoadAddr !== ''){
                //    extraRoadAddr = ' (' + extraRoadAddr + ')';
                //}

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                //if(roadAddr !== ''){
                //    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                //} else {
                //    document.getElementById("sample4_extraAddress").value = '';
                // }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>