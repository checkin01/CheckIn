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
<link rel="stylesheet" href="../css/default.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- daterangepicker-->
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<!-- navermap api -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ve4ILimYsUbRNnlZeSVm&submodules=geocoder"></script>
<script type="text/javascript" src="../js/filter.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.list {
	font-family: 'Gothic A1', sans-serif;
}

img {
	border-radius: 5px;
}

.roomsImg {
	margin: 10px 10px;
	width: 300px;
	height: 250px;
}

#info1 {
	line-height: 60px;
	height: 60px;
	font-size: 30px;
	font-family: 'Gothic A1', sans-serif;
}

#info2 {
	line-height: 40px;
	height: 40px;
	font-size: 16px;
	font-family: 'Gothic A1', sans-serif;
}

#manageFrm {
	margin-top: 30px;
	padding: 10px 10px;
	font-family: 'Gothic A1', sans-serif;
}

#manage {
	text-align: center;
	font-family: 'Gothic A1', sans-serif;
}

#searchLabel {
	background: green;
	border: 1px solid black;
	color: white;
}

#searchLabel div {
	text-align: center;
	font-size: 0.9em;
	font-family: 'Gothic A1', sans-serif;
}

.dropdown-item {
	font-size: 1.5em;
}

.showLocModal:hover {
	cursor: pointer;
}

#searchSort {
	margin-top: 10px;
	border: 1px solid black";
}
</style>
<script>
	$(function() {
		//datetimepicker
		$('input[name="checkinout"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
	});
</script>
</head>
<body>

	<%@ include file="../nav.jspf"%>
	<%@ include file="../locationModal.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center">
			<!-- 필터 -->
			<!-- 검색 라벨 -->
			<div class="row border rounded" id="searchLabel">
				<div class="col-md-10">
					<div class="row rounded" style="margin: 5px">
						<div class="col-md-3">숙박유형</div>
						<div class="col-md-5">지역(시)</div>
						<div class="col-md-4">체크인 체크아웃</div>
					</div>

					<!-- 검색 필터 ------------------------------->
					<form action="showAccomodationList.jsp" method="get"
						id="searchFilter">
						<!-- 숙박유형 -->
						<div class="row" style="margin-top: 5px">
							<div class="col-md-3 dropdown">
								<button type="button" id="Atype"
									class="btn btn-light dropdown-toggle" data-toggle="dropdown">숙박유형</button>

								<div class="dropdown-menu border" id="Aitem">
									<script>
										$(function() {

											$(".dropdown-item")
													.click(
															function() {
																var Atype = $(
																		"#Atype")
																		.html();
																$("#Atype")
																		.html(
																				$(
																						this)
																						.html());

															});
										});
									</script>
									<a class="dropdown-item" href="#">모텔</a> <a
										class="dropdown-item" href="#">호텔</a> <a class="dropdown-item"
										href="#">게스트하우스</a> <a class="dropdown-item" href="#">펜션</a>
								</div>
							</div>

							<!-- 지역 filter -->
							<div class="rounded col-md-5 btn-group">
								<!-- filter_item 부분 변경 -->
								<div class="showLocModal" style="margin: 0 auto; width: 300px">
									<div>
										<div class="filter-item" id='selectedLocation' name='location'
											style="width: 300px; font-size: 15px">
											<span class="selectedSido">서울</span> <span class="selectedGu">강남구</span>
											<span class="selectedSubway"></span> <i
												class="material-icons">keyboard_arrow_down</i>
										</div>
									</div>
								</div>
							</div>
							<!-- 지역 filter 끝 -->

							<!-- 체크인 체크아웃 -->
							<div class="col-md-4" style="float: left">
								<input type="text" class="w3-input w3-border rounded"
									name="checkinout"
									style="margin: 5px; width: 190px; font-size: 1.3em; text-align: center;" />
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-2">
					<input type="submit" value="숙소검색"
						class="btn btn-warning form-control"
						style="margin: 3px; height: 68px">
				</div>
			</div>

			<!-- 정렬 ----------------------------------------------------------->
			<div class="row border rounded" id="searchSort">
				<div class="col-md-12">
					<div class="btn-group btn-group-md">
						<div class="btn-group">
							<button type="button" class="btn btn-light dropdown-toggle"
								data-toggle="dropdown">기본순</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">최저가격순</a> <a
									class="dropdown-item" href="#">별점순</a> <a class="dropdown-item"
									href="#">방문자순</a>
							</div>
						</div>
						<div>
							<button type="button" class="btn btn-light"
								data-toggle="collapse" data-target="#acco"
								style="margin-left: 10px">테마</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 지도 --------------------------------------------------------->
			<div class="row border rounded" id="map"
				style="margin-top: 30px; height: 300px; border: 1px solid black">
				<div id="map" class="container" style="width: 100%; height: 280px;">
				</div>
				<script>
					var map = new naver.maps.Map('map');
					var myaddress = '광양9길';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
					naver.maps.Service
							.geocode(
									{
										address : myaddress
									},
									function(status, response) {
										if (status !== naver.maps.Service.Status.OK) {
											return alert(myaddress
													+ '의 검색 결과가 없거나 기타 네트워크 에러');
										}
										var result = response.result;
										// 검색 결과 갯수: result.total
										// 첫번째 결과 결과 주소: result.items[0].address
										// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
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
										naver.maps.Event.addListener(marker,
												"click", function(e) {
													if (infowindow.getMap()) {
														infowindow.close();
													} else {
														infowindow.open(map,
																marker);
													}
												});
										// 마크 클릭시 인포윈도우 오픈
										var infowindow = new naver.maps.InfoWindow(
												{
													content : '<h4> [업소이름]</h4>[평점 : ★★★★★]<br/>[전화번호 : 02-1111-1111]<br/> <img src="../img/accomodation/home1.jpg"></a>'
												});
									});
				</script>
			</div>
			<script>
				// 보여주기식 이동 처리함. 이미지 클릭하면 룸 보는 페이지로 이동
				$(function(){
					$("#room1").click(function(){
						location.href="<%=request.getContextPath()%>/accomodation/showDetailAccomodation.jsp";
					})
					
				});
			
			</script>
			<!-- 리스트 -->
			<div class="row border list rounded"
				style="margin-top: 30px; height: 280px; border: 1px solid black">
				<!-- carousel : 업소 사진-->
				<div class="col-lg-5">
					<div id="room1" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

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
				<div class="col-lg-7">
					<div class="row" id="info">
						<div class="col-sm-12" id="info1">업소이름</div>
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
				</div>

			</div>
			<!-- 리스트 -->
			<div class="row border list rounded"
				style="margin-top: 30px; height: 280px; border: 1px solid black">
				<!-- carousel : 업소 사진-->
				<div class="col-lg-5">
					<div id="room1" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

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
				<div class="col-lg-7">
					<div class="row" id="info">
						<div class="col-sm-12" id="info1">업소이름</div>
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
				</div>

			</div>
			<!-- 리스트 -->
			<div class="row border list rounded"
				style="margin-top: 30px; height: 280px; border: 1px solid black">
				<!-- carousel : 업소 사진-->
				<div class="col-lg-5">
					<div id="room1" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

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
				<div class="col-lg-7">
					<div class="row" id="info">
						<div class="col-sm-12" id="info1">업소이름</div>
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
				</div>

			</div>
			<!-- footer -->
		<footer class="row footer" id="footer">
			<div class="col-sm-12"> </div>
		</footer>
		</div>

		<aside class="col-sm-2 right" id="right" style="text-align: right">
			<%@ include file="sidenav.jspf"%>
		</aside>

		<!-- footer -->
		<footer class="row footer" id="footer">
			<%@ include file="footernav.jspf"%>
		</footer>

	</div>

</body>
</html>