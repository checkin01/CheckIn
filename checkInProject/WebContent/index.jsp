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
<style>
body {
	margin: 0px;
	padding: 0px;
}
div{
	margin:0px;
	padding:0px;

}

.main {
	width: 100%;
	height: 50%;
}

.header {
	margin-top: 55px;
	position: absolute;
	height: 60%;
	background:url('./img/index_bg.png') no-repeat fixed center; 
	width: 100%;
}

.paragrapgh {
	padding-top:3%;
	text-align: center;
	margin-top: 100px;
	height:30%;	
}

.filters{
	margin:0px auto;
	padding:0px;
	text-align: center;
	height:25%;
	width:100%;
}
.filter-child{
	margin:0px;
	padding:0px;
	background:#fff;
	display:inline-block;
	width:19%;
}
label{
	font-size:12px;
	width:100%;
	font-family: 'Gothic A1', sans-serif;
}
.filter-main{
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
}

.filter-item{
	text-align:center; 
	width:100%;
	margin:0;
	padding:0;
	font-size:17px;
	font-family: 'Gothic A1', sans-serif;
}
.pop-item{
	margin:5px;
	border:#ddd solid 1px;
	background:#fff;
	font-size:13px;
	font-family: 'Gothic A1', sans-serif;
}
.pop-main{
	width:100%;
}
</style>
</head>
<body>
	<%@ include file="nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->

	<div class="header">
		<div class="container paragrapgh">
			<h1 class="font1-large w3-animate-left">
				<strong><span style="color:w3-green">Check In</span>에서 빠르고 쉽게 예약하세요 !</strong>
			</h1>
		</div>
		<div class="filters container">
			<!-- 유형 filter -->
			<div class=" border filter-child">
				<div><label for="type">유형</label></div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main" id="type">
					 <button class="w3-button" id ="selectedType"  style="width:100%">
					 <div class="w3-bar-item w3-button filter-item"><i class="material-icons">business</i> 호텔</div>
					 <div>∨</div>
					 </button>
					 <div class="w3-dropdown-content w3-bar-block border" style="width:100%">
					  	<div class="w3-bar-item w3-button filter-item"><i class="material-icons">business</i> 호텔</div>
					  	<div class="w3-bar-item w3-button filter-item"><i class="material-icons">brightness_2</i> 모텔</div>
					  	<div class="w3-bar-item w3-button filter-item"><i class="material-icons">home</i> 펜션</div>
					  	<div class="w3-bar-item w3-button filter-item"><i class="material-icons">card_travel</i> 게스트하우스</div>
					  </div>
				</div>
			</div>
			<!-- 유형 filter 끝 -->
			<!-- 지역 filter -->
			<div class=" border filter-child">
				<div><label for="type">지역</label></div>
				<!-- filter_item 부분 변경 -->
				<div class="filter-main" id="type">
					 <button class="w3-button" id ="selectedLocation"  style="width:100%">
					 <div class="w3-bar-item w3-button filter-item"> 서울</div>
					 <div>∨</div>
					 </button>
					<script>
							$(document).ready(function(){
								var locs = ['서울','경기','인천','강원','제주','대전','충북','충남','부산','울산','경남','대구','경북','광주','전남','전북'];
								
								var locHtml = "<div class='pop-main'>";
								for(var i = 0 ; i < locs.length  ; i++ ){
									locHtml += "<button class='btn pop-item' id='"+locs[i]+"'>"+locs[i]+"</button>";
								}
								locHtml+="</div>";
								$("#selectedLocation").popover({
									titile:"지역",
									html:true,
									trigger:"click",
									placement: "bottom",
									content:locHtml
								});
							});
					</script>
				</div>
			</div>
			<!-- 지역 filter 끝 -->
			<!-- 체크인 filter -->
			<div class=" border filter-child">
				<div><label for="type">체크인</label></div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main" id="type">
					 <button class="w3-button" id ="selectedType"  style="width:100%">
					 <div class=" w3-button"></div>
					 <div>∨</div>
					 </button>
				
				</div>
			</div>
			<!-- 체크인 filter 끝 -->
			<!-- 체크아웃 filter -->
			<div class=" border filter-child">
				<div><label for="type">체크아웃</label></div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main" id="type">
					 <button class="w3-button" id ="selectedCheckOut"  style="width:100%;">
					 <div class="w3-bar-item w3-button filter-item"><i class="material-icons">business</i> 호텔</div>
					 <div>∨</div>
					 </button>
					
				</div>
			</div>
			<!-- 검색 필터 -->
			<div class=" filter-child border">
				<div><label for="type"> 검색 </label></div>
				<div class="filter-main">
					<button class="w3-button" style="width:100%;" >숙소 찾기
					<div class="filter-item"><i class="material-icons">search</i> </div>
					</button>
				</div>
			</div>
		</div>
	</div>

	<div id="main" class="main"></div>
</body>
</html>