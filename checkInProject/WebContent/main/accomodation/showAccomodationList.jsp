<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 숙박 업소 리스트 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="../js/showAccomodationList.js"></script>

<!-- daterangepicker-->
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<link rel="stylesheet" href="../css/showAccomodationList.css">
<!-- navermap api -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ve4ILimYsUbRNnlZeSVm&submodules=geocoder"></script>
<script type="text/javascript" src="../js/filter.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

</style>
<script>
	$(function() {
		//datetimepicker
		$('input[name="checkinout"]').daterangepicker({
			opens : 'bottom auto'
		});
		$('input[name="bottom-checkinout"]').daterangepicker({
			opens : 'top auto'
		});
	});
</script>
</head>
<body>

	<%@ include file="../topnav_member.jspf"%>
	<%@ include file="../locationModal.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left"></aside>

		<div class="col-sm-8 center" id="center">
			<!-- ===================================필터====================================== -->

			<div id="searchFilter">
				<!-- 검색 라벨 -->
				<div class="labels">
					<div class="label-item">숙박유형</div>
					<div class="label-item">지역(시)</div>
					<div class="label-item">체크인 체크아웃</div>
					<div class="label-item">검색</div>
				</div>

				<!-- 검색 필터 ------------------------------->
				<form action="showAccomodationList.jsp" method="get" id="searchForm">
					<!-- ------------숙박유형------------- -->
					<div class="filter-item dropdown">
						<button type="button" id="Atype"
							class="btn btn-light dropdown-toggle" data-toggle="dropdown">숙박유형</button>
						<div class="dropdown-menu border" id="Aitem">
							<a class="dropdown-item droptype-item" href="#">모텔</a> <a
								class="dropdown-item droptype-item" href="#">호텔</a> <a
								class="dropdown-item droptype-item" href="#">게스트하우스</a> <a
								class="dropdown-item droptype-item" href="#">펜션</a>
						</div>

					</div>
					<!-- ------------지역 filter------------- -->
					<div class="filter-item showLocModal" id='selectedLocation'
						name='location'>
						<button id="locationText" class="btn btn-light">
							<i class="fa fa-map-marker"></i> <span class="selectedSido">서울</span>
							<span class="selectedGu">강남구</span> <span class="selectedSubway"></span>
						</button>
					</div>
					<!-- -----------------체크인 체크아웃------------------------- -->
					<div class="filter-item">
						<input type="text" class="w3-border rounded btn btn-default"
							name="checkinout" />
					</div>

					<div class="filter-item">
						<button id="searchButton" class="btn btn-default form-control">
							숙소검색 <i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<!-- ===================================필터 끝 ====================================== -->

			<!-- 정렬 ----------------------------------------------------------->
			<div class="border rounded" id="searchSort">
				<div class="btn-group sort-item">
					<button type="button" class="btn btn-light dropdown-toggle"
						data-toggle="dropdown">기본순</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#searchSort">최저가격순</a> <a
							class="dropdown-item" href="#searchSort">별점순</a> 
							<a class="dropdown-item" href="#searchSort">방문자순</a>
					</div>
				</div>

				<div id="thema" class="sort-item">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="modal" data-target="#themaModal">테마</button>
					<!-- 테마에 대한 정보를 이곳에 hidden 속성으로 숨겨 둔다 -->

				</div>
				<div class="theme-item" id="hiddenOption"
					style="font-family: 'Jua'; font-size: 0.9em; color: #aaa;" /></div>
			</div>

			<!-- 지도 --------------------------------------------------------->
			<div class="border rounded container" id="map"
				style="margin-top: 30px; height: 300px; border: 1px solid black; z-index: 1;">
				<div id="map" class="container" style="width: 100%; height: 280px;">
				</div>

			</div>
			<!-- ----------------------------------- 리스트-------------------------------------------- -->
			<div class="row border list-item rounded">
				<!-- carousel : 업소 사진-->
				<div class="col-lg-5 container">
					<div id="room1" class="carousel slide img-slide"
						data-ride="carousel">

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="../img/accomodation/home1.jpg" class="roomsImg">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/home2.jpg" class="roomsImg">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/home3.jpg" class="roomsImg">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#room1" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#room1" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<!-- 업소 정보 -->
				<div class="col-lg-7 container">
					<div class="row" id="info">
						<div class="col-sm-12" id="info1"><a href="<%=request.getContextPath()%>/main/accomodation/showDetailAccomodation.jsp">업소이름</a></div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">평점</div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">최소인원~최대인원</div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">입실시간 퇴실시간</div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">조건</div>
					</div>
					<hr />
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">가격</div>
					</div>
				</div>

			</div>

			<!-- footer -->
			<footer class="row footer" id="footer">
				<div class="col-sm-12"></div>
			</footer>
		</div>
		<aside class="col-sm-2 right" id="right" style="text-align: right">
			<%@ include file="rightside_nav.jspf"%>
		</aside>
	</div>



	<!-- footer -->
	<footer class="row footer" id="footer">
		<%@ include file="footer_nav.jspf"%>
	</footer>
	<%@ include file="themeModal.jspf"%>
</body>
<script>
	//--------------------------------------- naver map --------------------------------------/
	var map = new naver.maps.Map('map');
	var myaddress = '광양9길';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
	naver.maps.Service
			.geocode(
					{
						address : myaddress
					},
					function(status, response) {
						if (status !== naver.maps.Service.Status.OK) {
							return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
						}
						var result = response.result;
						// 검색 결과 갯수: result.total
						// 첫번째 결과 결과 주소: result.items[0].address
						// 첫번째 검색 결과 좌표: result.items[0].point.y,
						// result.items[0].point.x
						var myaddr = new naver.maps.Point(
								result.items[0].point.x,
								result.items[0].point.y);
						map.setCenter(myaddr); // 검색된 좌표로 지도 이동
						// 마커 표시
						var marker = new naver.maps.Marker({
							position : myaddr,
							map : map
						});
						// 마커 클릭 이벤트 처리
						naver.maps.Event.addListener(marker, "click", function(
								e) {
							if (infowindow.getMap()) {
								infowindow.close();
							} else {
								infowindow.open(map, marker);
							}
						});
						// 마크 클릭시 인포윈도우 오픈
						var infowindow = new naver.maps.InfoWindow(
								{
									content : '<h4> [업소이름]</h4>[평점 : ★★★★★]<br/>[전화번호 : 02-1111-1111]<br/> <img src="../img/accomodation/home1.jpg"></a>'
								});
					});
</script>
</html>