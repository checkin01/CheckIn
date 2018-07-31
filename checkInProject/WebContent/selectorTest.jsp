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
button {
	width: 70px;
	hieght: 10px;
	margin: 5px;
	border: none;
	background: #fff;
	border-radius: 5px;
	font-size: 12px;
	font-family: 'Gothic A1', sans-serif;
}

.panel-body {
	padding: 10px;
	width: 490px;
	border: 1px #ddd solid;
}
</style>
</head>
<body class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#location_pannel"> <span
						id="sido" name="sido">서울</span> <span id="dong" name="dong">강남구</span>
					</a>

				</h4>
			</div>
			<div id="location_pannel" class="panel-collapse collapse">
				<!--------- panel body ------------>
				<div class="panel-body">
					<div class="row container" id="sido_panel">
						<button class=''>서울</button>
					</div>

					<hr />
					<input type="button" class="btn-success" id="searchMethod1"
						value="주소로 검색하기" onClick="whenClickSearchOption(1)"> <input
						type="button" class="btn-success" id="searchMethod2"
						value="인근 지하철로 검색하기" onClick="whenClickSearchOption(2)">
					<div class="row" id="gu_panel1" style="width: 500px; padding: 10px; display:block" >
						<button class="">강남구</button><button class="">강동구</button> <button class="">강북구</button> <button class="">강서구</button> <button class="">관악구</button>
	           			<button class="">광진구</button><button class="">구로구</button> <button class="">금천구</button> <button class="">노원구</button> <button class="">도봉구</button>
	           			<button class="">동대문구</button><button class="">동작구</button> <button class="">마포구</button> <button class="">서대문구</button> <button class="">서초구</button>
	           			<button class="">성동구</button><button class="">성북구</button> <button class="">송파구</button> <button class="">양천구</button> <button class="">영등포구</button>
	           			<button class="">용산구</button><button class="">은평구</button> <button class="">종로구</button> <button class="">중구</button> <button class="">중랑구</button>
           
					</div>
					<div class="row" id="gu_panel2" style="width: 500px; padding: 10px; display:none">
						 <button class="">강남역/역삼역/삼성역/논현역</button><button class="">서초역/신사역/방배역</button> <button class="">논현역</button> <button class="">강서구</button> <button class="">관악구</button>
	           			<button class="">역삼역</button><button class="">구로구</button> <button class="">금천구</button> <button class="">노원구</button> <button class="">도봉구</button>
	           			<button class="">동대문구</button><button class="">동작구</button> <button class="">마포구</button> <button class="">서대문구</button> <button class="">서초구</button>
	           			<button class="">성동구</button><button class="">성북구</button> <button class="">송파구</button> <button class="">양천구</button> <button class="">영등포구</button>
	           			<button class="">용산구</button><button class="">은평구</button> <button class="">종로구</button> <button class="">중구</button> <button class="">중랑구</button>
           
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  -->
	<script>
		var locs2 = [ '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금청구',
				'노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구',
				'성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구' ];

		function whenClickSearchOption(i) {
			var searchMethod1 = $("#searchMethod1");
			var searchMethod2 = $("#searchMethod2");
			if (i == 1) {
				$("#gu_panel1").css("display", "block");
				$("#gu_panel2").css("display", "none");
			} else if (i == 2) {
				$("#gu_panel1").css("display", "none");
				$("#gu_panel2").css("display", "block");

			}
		}
		function whenSelectedSido(i) {
			$("#sido").val(locs[i] + " ");
		}
	</script>

</body>
</html>