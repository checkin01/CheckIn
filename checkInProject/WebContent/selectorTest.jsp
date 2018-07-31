<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
.gu ,.subway {
	hieght: 10px;
	margin: 5px;
	border: none;
	background: #fff;
	
	font-size: 12px;
	font-family: 'Gothic A1', sans-serif;
}
.searchOption{
	border: none;
	margin: 5px;
	height:30px;
	background: #fff;
	font-size: 15px;
	font-family: 'Gothic A1', sans-serif;
	border-radius: 5px;
}
.panel-body {
	padding: 10px;
	width: 490px;
	border: 1px #ddd solid;
}
</style>
</head>
<body>
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#location_pannel"> 
					<span id="sido">서울</span> 
					<span id="gu">강남구</span>
					<span id ="subway"></span>
					</a>

				</h4>
			</div>
			<div id="location_pannel" class="panel-collapse collapse">
				<!--------- panel body ------------>
				<div class="panel-body">
					<div class="row container" id="sido_panel">
						<button style="font-size:15px; border:none">서울</button>
					</div>

					<hr />
					<input type="button" class="searchOption" id="searchMethod1" style="background:green;"
						value="주소로 검색하기" onClick="whenClickSearchOption(1)"> 
					<input
						type="button" id="searchMethod2" class="searchOption" style="background:#ddd"
						value="인근 지하철로 검색하기" onClick="whenClickSearchOption(2)">
					<div class="row" id="gu_panel1" style="width: 500px; padding: 10px; display:block" >
						<button class="gu">강남구</button><button class="gu">강동구</button> <button class="gu">강북구</button> <button class="gu">강서구</button> <button class="gu">관악구</button>
	           			<button class="gu">광진구</button><button class="gu">구로구</button> <button class="gu">금천구</button> <button class="gu">노원구</button> <button class="gu">도봉구</button>
	           			<button class="gu">동대문구</button><button class="gu">동작구</button> <button class="gu">마포구</button> <button class="gu">서대문구</button> <button class="gu">서초구</button>
	           			<button class="gu">성동구</button><button class="gu">성북구</button> <button class="gu">송파구</button> <button class="gu">양천구</button> <button class="gu">영등포구</button>
	           			<button class="gu">용산구</button><button class="gu">은평구</button> <button class="gu">종로구</button> <button class="gu">중구</button> <button class="gu">중랑구</button>
           
					</div>
					<div class="row" id="gu_panel2" style="width: 500px; padding: 10px; display:none">
							 <button class="subway">강남/역삼/삼성/논현</button><button class="subway">서초/신사/방배역</button> <button class="subway">동묘/신설동/청량리/회기</button> <button class="subway">장안동/답십리</button> <button class="subway">신림/서울대/사당/금천/동작</button>
	          				<button class="subway">신촌/홍대/합정</button><button class="subway">강서/화곡/까치산/양천</button> <button class="subway">수유/미아</button> <button class="subway">잠실/신천</button> <button class="subway">신촌/홍대/합정</button>
							<button class="subway">동묘/신설동/청량리/회기</button><button class="subway">연신내/불광/응암</button> <button class="subway">상봉/중랑/면목</button> <button class="subway">태릉/노원/도봉/창동</button> <button class="subway">종로(3,5가)/혜화</button>
	           				<button class="subway">동대문/충무로/신당/약수/금호</button><button class="subway">성신여대/성북/월곡</button> <button class="subway">왕십리/성수/강변</button> <button class="subway">건대/군자/구의</button> <button class="subway">이태원/삼각지/용산/서울/명동/회현</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		
		$(function(){
			$(".subway").click(function(){
				var addr2 = $(this).text();
				$("#gu").text('');
				$("#subway").text(addr2);
			});
			$(".gu").click(function(){
				var addr2 = $(this).text();
				$("#gu").text(addr2);
				$("#subway").text("");
			});
		});
		
		function whenClickSearchOption(i) {
			var searchMethod1 = $("#searchMethod1");
			var searchMethod2 = $("#searchMethod2");
			if (i == 1) {
				$("#gu_panel1").css("display", "block");
				$("#searchMethod1").css("background", "green");
				$("#searchMethod2").css("background", "#ddd");
				$("#gu_panel2").css("display", "none");
			} else if (i == 2) {
				$("#gu_panel1").css("display", "none");
				$("#gu_panel2").css("display", "block");
				$("#searchMethod2").css("background", "green");
				$("#searchMethod1").css("background", "#ddd");
			}
		}
		function whenSelectedSido(i) {
			$("#sido").val(locs[i] + " ");
		}
	</script>
</body>
</html>