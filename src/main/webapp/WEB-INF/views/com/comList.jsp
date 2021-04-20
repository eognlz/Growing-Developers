<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.js.map" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script> -->

</head>
<body>
<jsp:include page="../include/header.jsp"/>
	<br>
	
		<div class="container" align="center">
			<div align="right">
				<div class="col-xs-8">
					<form action="/pet/board/comSearch2" method="get">
					<input id="comtitle" name="com_title" onkeyup="searchfunction()" type="text" size="20">
					<button class="btn btn-primary" onclick="searchfunction()" type="submit">검색</button>
					</form>
				</div>
			</div>
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
 						<th>번호</th>
 						<th>닉네임</th>
 						<th>제목</th>
 						<th>내용</th>
 					<c:if test="${userId == 'aa'}">
						<td>핸드폰</td>
					</c:if>
					</tr>
				</thead>
				<tbody id="ajaxTable">
					<c:forEach var="com" items="${comList}">
					<tr>
						<td>${com.com_num}</td>
						<td>${com.p_nick}</td>
						<td><a href="/pet/board/comView/${com.com_num}">${com.com_title}</a></td>
						<td>${com.com_content}</td>
					<c:if test="${userId == 'aa'}">
						<td>${com.p_phone}</td>
					</c:if>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/pet/board/comInsertPage"><button class="btn btn-primary" type="button">방문 예약 등록</button></a>&nbsp;&nbsp;
		</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function searchfunction(){
		 //echo("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
		//var title = document.getElementById('comtitle').value;
		// var ajaxtitle = decodeURIComponent(title);
		 //URLEncoder.encode(ajaxtitle , "UTF-8");
			//title = escape(title);
		//var title = encodeURIComponent(document.getElementById('comtitle').value, "UTF-8");
		//var title = URLEncoder.encode(document.getElementById('comtitle').value, "UTF-8");
		console.log(document.getElementById('comtitle').value);
		$.ajax({
			url: "/pet/board/comSearch",
			type: "GET",
			//contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
			data: {
				c_title: document.getElementById('comtitle').value
			},
			success: function(data){
				//alert('data 받음');
				console.log('응답 확인');
				let table = document.getElementById('ajaxTable');
				table.innerHTML="";
				//console.log(Object.values(data[0]));
				//tmp = Object.values(data[0]);
				//console.log('tmp[0]: '+tmp[0]);
				console.log('tmp.length: '+Object.values(data[0]).length);
				console.log('data.length: '+data.length);
				console.log('Object.values(data[0]): '+Object.values(data[0]));
				
				//시험
				for(let i=0; i < data.length; i++){
					let row = table.insertRow(i);
					
					var add_data = '';
					add_data += '<td>';
					add_data += data[i].com_num;
					add_data += '</td>';

					add_data += '<td>';
					add_data += data[i].p_nick;
					add_data += '</td>';

					add_data += '<td>';
					add_data += '<a href="/pet/board/comView/'+data[i].com_num+'">';
					add_data += data[i].com_title;
					add_data += '</a></td>';
					
					add_data += '<td>';
					add_data += data[i].com_content;
					add_data += '</td>';
					//}
					//add_data += '</tr>';
					//table.append(add_data);
					row.innerHTML = add_data;
				}
				
				//연습 작동됨!!! 정확하게는 아니지만
           		/* for(let i=0; i < data.length; i++){
           			console.log('111111111');
           			let trl = table.rows.length;
           				let row = table.insertRow(i);
           				//var cell = row.insertCell(i);
           				for(let j=0; j < tmp.length; j++){
           					let cell = row.insertCell(j);
           					cell.innerHTML = '<td>'+tmp[j] + '</td>';
           				var tag;
           				tag = tag + '<td>'+tmp[j] + '</td>';
           				cell.innerHTML = tag;
           				}
           			//cell.append(tag);
           			//cell.innerHTML = '<td>'+tmp[i] + '</td>';
           		} */
                
                
                
				//여기부터 잘못
				/* 	for(var i=0; i < data.length; i++){
						tmp = Object.values(data[i]);
						//console.log('1111111111');
						console.log(table);
						table.innerHTML =  table.innerHTML + '<tr id="tr+'+i+'">';
						 for(var j=0; j < tmp.length; j++){
							//table.append('<tr>')
							var tr = document.getElementById('tr'+i);
							tr.innerHTML = '<td>'+tmp[j] + '</td>';
							 
							//var cell = row.insertCell(j);
							//cell.insertHTML = data[i][j].value;
						}
					table.innerHTML = table.innerHTML + '</tr>';
					} */
				}
			
			//참고
			/* var slag = [];
            for(var i=0; i < data.length; i++)
            {
                var string = JSON.stringify(data[i]);
                var parse = JSON.parse(string)
                slag.push(parse);
            }
            console.log(slag);
			}
			*/
			/* 
				$('#ajaxTable').innerHTML="";
				if(data.readyState == 4 && data.status ==200)
				var objext = eval('('+request.responseText +')');
				var result = object.result;
				for(var i=0; i<result.length; i++){
					var row = 	$('#ajaxTable').insertRow(0);	
					for(var j=0; j<result[i].length; j++){
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j].value;
					}
				}  */
			})
		}
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
</html>