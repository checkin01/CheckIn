<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in!</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- daterangepicker-->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="./js/daterangepicker.js"></script>
<link rel="stylesheet" href="./css/daterangepicker.css">

<style>
body {
	margin: 0px;
	padding: 0px;
}

nav {
	background: #fff;
}

div {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 100%;
	height: 50%;
}

.header {
	margin-top: 55px;
	position: absolute;
	height: 60%;
	width: 100%;
	background: url('./img/4.png') no-repeat fixed center;
	background-size: 100% 100%;
}

.paragrapgh {
	padding-top: 3%;
	text-align: center;
	margin-top: 2%;
	color: #fff;
	height: 30%;
	font-family: 'Gothic A1', sans-serif;
}

.filters {
	padding: 0px;
	text-align: center;
	height: 30%;
	width: 90%;
}

.filter-child {
	margin: 0px;
	padding: 0px;
	display: inline-block;
	width: 20%;
	border: solid grey 1px;
	height: 100%;
	background: #fff;
}

label {
	font-size: 1em;
	color: #333;
	width: 100%;
	height: 20%;
	margin: 0px;
	padding: 0px;
	font-family: 'Gothic A1', sans-serif;
}

.filter-main {
	width: 100%;
	height: 80%;
	margin: 0px;
	padding: 0px;
	padding-top: 10px;
}

.filter-item {
	boreder-top: 1px solid #ddd;
	text-align: center;
	width: 100%;
	margin: 0;
	padding: 0;
	font-size: 1.5em;
	font-family: 'Gothic A1', sans-serif;
}

.pop-item {
	margin: 5px;
	border: #ddd solid 1px;
	background: #fff;
	font-size: 13px;
	font-family: 'Gothic A1', sans-serif;
}

.pop-main {
	width: 100%;
}
</style>
<script>
$(function(){
	$('input[name="daterange"]').daterangepicker({
		opens : 'left'
		,locale: {
		      format: 'YYYY-MM-DD'
	    }
	,
	function(start, end, label) {
		
		console.log("A new date selection was made: "
				+ start.format('YYYY-MM-DD') + ' to '
				+ end.format('YYYY-MM-DD'));
		}
	});
	
});




</script>
</head>
<body>
	<%@ include file="nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->

	<div class="header">
		<div class="paragrapgh container">
			<span class="w3-animate-left"
				style="font-family: 'Gothic A1', sans-serif; font-size: 30px; text-align: left">
				<strong>Check In 빠르고 쉽게 예약하세요 !</strong>
			</span>
		</div>
		<div class="filters container">
			<!-- 유형 filter -->
			<div class="filter-child">
				<div>
					<label for="type">유형</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main" id="type">
					<button class="w3-button" id="selectedType" style="width: 100%">
						<div class="w3-bar-item w3-button filter-item">
							<i class="material-icons">business</i> 호텔
						</div>
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</button>
					<div class="w3-dropdown-content w3-bar-block border"
						style="width: 100%">
						<div class="w3-bar-item w3-button filter-item"
							style="font-size: 17px;">
							<i class="material-icons">business</i> 호텔
						</div>
						<div class="w3-bar-item w3-button filter-item"
							style="font-size: 17px;">
							<i class="material-icons">brightness_2</i> 모텔
						</div>
						<div class="w3-bar-item w3-button filter-item"
							style="font-size: 17px;">
							<i class="material-icons">home</i> 펜션
						</div>
						<div class="w3-bar-item w3-button filter-item"
							style="font-size: 17px;">
							<i class="material-icons">card_travel</i> 게스트하우스
						</div>
					</div>
				</div>
			</div>
			<!-- 유형 filter 끝 -->
			<!-- 지역 filter -->
			<div class=" filter-child">
				<div>
					<label for="type">지역</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="filter-main" id="location">
					<button class="w3-button" style="width: 100%">
						<div class="w3-bar-item w3-button filter-item"
							id='selectedLocation'>서울</div>
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</button>
					<script>
						var locs = ['서울','경기','인천','강원','제주','대전','충북','충남','부산','울산','경남','대구','경북','광주','전남','전북'];
			            $(document).ready(function(){
			               var locHtml = "<div class='pop-main'>";
			               for(var i = 0 ; i < locs.length  ; i++ ){
			                  locHtml += "<button class='btn pop-item' id='"+locs[i]+"' onclick='whenSelectedLoc("+i+")'>"+locs[i]+"</button>";
			               }
			               locHtml+="</div>";
			               
			               $("#location").popover({
			                  titile:"지역",
			                  html:true,
			                  trigger:"focus",
			                  placement: "bottom",
			                  content:locHtml
			               });
			               
			            });
			            function whenSelectedLoc(i){
			               $("#selectedLocation").html(" "+locs[i]);
			               
			            }
					</script>
				</div>
			</div>
			<!-- 지역 filter 끝 -->
			

			<!-- 체크인/체크아웃 filter -->
			<div class="filter-child">
				<div>
					<label for="type"> 날짜</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main" id="checkinout">
					<div class="w3-button" style="width: 100%">
						<input class="rounded" name="daterange" type="text"
							style="border: #ddd solid 1px; font-size: 1.45em">
						<div>
							<i class="material-icons"> keyboard_arrow_down </i>
						</div>
					</div>

				</div>
			</div>
			<!-- 체크인 filter 끝 -->

			<!-- 검색 필터 -->
			<div class="filter-child  w3-green">
				<div>
					<label for="type"> 검색 </label>
				</div>
				<div class="filter-main">
					<button class="w3-button" style="width: 100%; font-size: 20px;">
						<strong>숙소 찾기</strong>
						<div class="filter-item">
							<i class="material-icons">search</i>
						</div>
					</button>
				</div>
			</div>
			
		</div>
	</div>

	<div id="main" class="main"></div>
</body>
</html>