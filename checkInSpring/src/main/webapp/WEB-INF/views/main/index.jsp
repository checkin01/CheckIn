<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Check in !</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- daterangepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/daterangepicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/daterangepicker.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/filter.js"></script>
<script>
	$(function(){
		$("input[name='daterange']").daterangepicker({
			opens : 'left'
			,locale: {
			      format: 'YYYY-MM-DD'
		    }
		});
	});

</script>
</head>
<body>
	<%@ include file="topnav_member.jspf"%>
	<%@ include file="locationModal.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div class="header" style="position: relative">
		<div class="paragrapgh container text w3-animate-left">
			<strong><span style="color: orange"> <i class="fa fa-check-square-o" style="font-size: 48px; color: orange"></i>Check In
			</span></strong> <span style="font-size: 0.7em;">에서 빠르고 쉽게 예약하세요 !</span>
		</div>
		<div class="filters container rounded w3-animate-left">
			<!-- 유형 filter -->
			<div class="filter-child rounded">
				<div>
					<label>유형</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main">
					<div id="selectedType" style="width: 100%">
						<div class=" filter-item" id="selectedItem">
							<i class="material-icons">business</i> 호텔
						</div>
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</div>
					<div class="w3-dropdown-content w3-bar-block border" style="width: 100%">
						<div class="w3-bar-item w3-button filter-item type-item" style="font-size: 17px;">
							<i class="material-icons">business</i> 호텔
						</div>
						<div class="w3-bar-item w3-button filter-item type-item" style="font-size: 17px;">
							<i class="material-icons">brightness_2</i> 모텔
						</div>
						<div class="w3-bar-item w3-button filter-item type-item" style="font-size: 17px;">
							<i class="material-icons">home</i> 펜션
						</div>
						<div class="w3-bar-item w3-button filter-item type-item" style="font-size: 17px;">
							<i class="material-icons">card_travel</i> 게스트하우스
						</div>
					</div>
				</div>
			</div>
			<!-- 
				모텔 유형 클릭 시 내부 html 변경 됨
			 -->
			<script>
				$(function() {
					$(".type-item").click(function() {
						var html = $(this).html();
						$("#selectedItem").html(html);
					});

				});
			</script>
			<!-- 유형 filter 끝 -->

			<!-- 지역 filter -->
			<div class="filter-child rounded">
				<div>
					<label>지역</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="filter-main showLocModal">
					<div>
						<div class="filter-item" id='selectedLocation'>
							<i class="material-icons"> location_on</i><span class="selectedSido">서울</span> <span class="selectedGu" style="font-size: 0.7em">강남구</span> <span class="selectedSubway" style="font-size: 0.7em"></span>
							<div>
								<i class="material-icons" style="margin: 0; padding: 0">keyboard_arrow_down</i>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- 지역 filter 끝 -->

			<!-- 체크인/체크아웃 filter -->
			<div class="filter-child rounded filter-checkinout">
				<div>
					<label> 날짜</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class=" filter-main">
					<div class="filter-item">
						<i class="material-icons"> calendar_today</i> <input class="rounded" name="daterange" id="checkinout" type="text">
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</div>
				</div>
			</div>
			<!-- 체크인 filter 끝 -->

			<!-- 검색 필터 -->
			<div class="filter-child  w3-green rounded" id="ok">
				<div>
					<label for="type"> 검색 </label>
				</div>
				<div class="filter-main">
					<div class="searchBtn w3-green">
						<div class="filter-item">
							<i class="material-icons">touch_app</i> 숙소 찾기
							<div>
								<i class="material-icons" style="color: green">keyboard_arrow_down</i>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(function(){
			$("#ok").click(function(){
				location.href="<%=request.getContextPath()%>/main/accomodation/showAccomodationList.jsp";
							});
		});
	</script>

	<div id="main" class="main row" style="position: relative;">
		<div class="col-lg-2"></div>
		<div id="center" class="col-lg-8 center" style="position: relative; margin: 50px 0;">

			<!-- 리뷰 등록 순 -->
			<!-- First Photo Grid-->
			<div class="w3-row-padding" style="text-align: center; padding: 10px 0px; font-family: 'Jua'">
				<h2>여기는 어떠세요?</h2>
			</div>
			<br />
			<div class="w3-row-padding" style="text-align: center; padding: 20px;">
				<h5>
					<button class="btn btn-light showLocModal">
						<i class="fa fa-map-marker"></i> <span class="selectedSido">서울</span> <span class="selectedGu">강남구</span> <span class="selectedSubway"></span>
					</button>
					에서 평점이 가장 좋은 곳 이에요.
				</h5>
			</div>
			<div class="w3-row-padding">
				<div class="w3-third w3-container  w3-margin-bottom">
					<img src="<%=request.getContextPath()%>/img/accomodation/home1.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>
						<p class="review">이렇게 꺠끗해도 될까요? 너무 관심이 많아서 후기 보고 예약 했는데....</p>
						<p class="grade">
							평점 : <span id="grade">4.5</span>
						</p>
					</div>
				</div>

				<div class="w3-third w3-container w3-margin-bottom">
					<img src="<%=request.getContextPath()%>/img/accomodation/home1.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>
						<p class="review">이렇게 꺠끗해도 될까요? 너무 관심이 많아서 후기 보고 예약 했는데....</p>
						<p class="grade">
							평점 : <span id="grade">4.5</span>
						</p>
					</div>
				</div>
				<div class="w3-third w3-container">
					<img src="<%=request.getContextPath()%>/img/accomodation/home1.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>
						<p class="review">이렇게 꺠끗해도 될까요? 너무 관심이 많아서 후기 보고 예약 했는데....</p>
						<p class="grade">
							평점 : <span id="grade">4.5</span>
						</p>
					</div>
				</div>
			</div>
			<br />
			<hr />
			<div class="w3-row-padding" style="text-align: center; padding: 20px;">
				<h5>
					<button class="btn btn-light showLocModal">
						<i class="fa fa-map-marker"></i> <span class="selectedSido">서울</span> <span class="selectedGu">강남구</span> <span class="selectedSubway"></span>
					</button>
					에서 예약 수가 가장 많은 곳 이에요.
				</h5>
			</div>
			<!-- 방문자 순 -->
			<!-- Second Photo Grid-->
			<div class="w3-row-padding">
				<div class="w3-third w3-container w3-margin-bottom">
					<img src="<%=request.getContextPath()%>/img/accomodation/home2.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>


					</div>
				</div>
				<div class="w3-third w3-container w3-margin-bottom">
					<img src="<%=request.getContextPath()%>/img/accomodation/home2.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>
					</div>
				</div>
				<div class="w3-third w3-container">
					<img src="<%=request.getContextPath()%>/img/accomodation/home2.jpg" style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white">
						<p class="name">
							<b>리노베이션 펜션</b>
						</p>
						<p class="addr">서울 특별시 강남구</p>
					</div>
				</div>
			</div>

		</div>
		<div class="col-lg-2"></div>
	</div>

	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
		<%@ include file="companyInfo.jspf"%>
	</footer>
</body>
</html>