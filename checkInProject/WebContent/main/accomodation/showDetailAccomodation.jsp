<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 룸 상세 정보 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" href="../css/default.css" />
<link rel="stylesheet" href="../css/showDetailStyle.css">
<!--  body 구성에 적용 되는 스타일시트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- daterangepicker-->
<!-- navermap api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ve4ILimYsUbRNnlZeSVm&submodules=geocoder"></script>

<script src="../js/daterangepicker.js"></script>
<script src="../js/showDetailAccomodation.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>
.historyImg {
	width: 100%;
	height: 200px;
	padding: 0px;
}

.review-p {
	background: #fff;
}

label {
	font-size: 0.7;
}

#rooms {
	margin: 0;
	paddint: 0;
}

/* background:#34A853; */
.roomsImg {
	margin-top: 20px;
	width: 100%;
	height: 250px;
	padding: 0px;
}

.block {
	height: 20px;
}
</style>
</head>
<body>
	<%@ include file="../topnav_member.jspf"%>

	<div id="main" class="row main" style="top: 80px">

		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-3 font1-medium w3-container" id="left">
			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index: 3; width: 290px; margin-top: 80px; padding: 10px;" id="mySidebar">
				<!-- 정보 -->
				<div class="w3-container w3-display-container w3-padding-16">
					<i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>

					<!-- 호텔 정보 -->
					<div style="position: relative; top: 20px">
						<p class="w3-col font2-medium">테라스 펜션</p>

						<p>
							<i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM
						</p>
						<p>
							<i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM
						</p>
						<p>
							<i class="fa fa-fw fa-wifi"></i> <i class="fa-fw fa fa-support"></i> <i class="fa fa-automobile fa-fw"></i> <i class="material-icons">local_dining</i>
						</p>
						<p>
							<i class="material-icons">call</i><span id=tel>02-6585-7144</span>
						</p>
						<hr />
						<form action="/action_page.php" target="_blank">
							<p>
								<i class="fa fa-calendar-check-o"> <label>일자</label></i>
							</p>
							<input type="text" class="w3-input w3-border" name="checkinout" /> <br />
							<p>
								<i class="fa fa-male"> <label>인원수</label></i>
							</p>
							<input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6"> <br />
							<p>
								<button class="w3-button w3-block w3-green w3-left-align" type="submit">
									<i class="fa fa-search w3-margin-right"></i> Search availability
								</button>
							</p>
						</form>
					</div>
				</div>

				<!-- 내가 본 상품 -->

				<div class="w3-bar-block ">
					<label>이전에 본 상품</label>
					<div id="history" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#history" data-slide-to="0" class="active"></li>
							<li data-target="#history" data-slide-to="1"></li>
							<li data-target="#history" data-slide-to="2"></li>
						</ul>

						<!-- The slide show -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="../img/accomodation/hotel01.PNG" class="historyImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel02.PNG" class="historyImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel03.PNG" class="historyImg rounded">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#history" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#history" data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<div class="block"></div>
			</nav>
		</aside>
		<!------------------------------ 필터 끝 ---------------------------------------------->

		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-8 center w3-container" id="center" style="padding-top: 30px">
			<!--========================== info ==================================-->
			<button onclick="whenClickAccor('ainfo')" class="w3-button w3-block w3-left-align w3-deep-orange  font1-medium">
				<strong>숙소 주의 사항</strong>
			</button>
			<div id="ainfo" class="border w3-show" data-ride="carousel" style="padding: 20px">
				<!-- 아이콘들 -->
				<div></div>

				<!-- 주의사항 -->
				<div>
					<p id="notice">가평에 위치한 테라스 펜션은 무료 Wi-Fi 등 시설이 완비된 객실을 제공하며, 남이섬에서 7km 떨어져 있습니다. 모든 객실에는 발코니가 마련되어 있으며, 샤워 시설을 갖춘 전용 욕실이 있습니다. 주방에는 전자레인지, 냉장고와 주전자가 구비되어 있습니다. 펜션에서 쁘띠 프랑스는 11km, 아침고요수목원은 12km
						떨어져 있습니다. 원주공항까지의 거리는 61km입니다. 가평읍 지역은 음식, 로맨틱 휴가, 로맨틱 테마 여행을 원하시는 분께 강력 추천하는 지역입니다. 고객님의 언어로도 지원됩니다!</p>
				</div>
			</div>

			<!--=================================== 지도 보기  =========================================-->
			<button onclick="whenClickAccor('map')" class="w3-button w3-block w3-left-align w3-light-blue font1-medium">
				<strong>숙소 위치 보기</strong>
			</button>
			<div id="map" class="border w3-show" style="width: 100%; height: 300px;">
				<script>
					var map1 = new naver.maps.Map('map');
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

										map1.setCenter(myaddr); // 검색된 좌표로 지도 이동

										// 마커 표시
										var marker = new naver.maps.Marker({
											position : myaddr,
											map : map1
										});

										// 마커 클릭 이벤트 처리
										naver.maps.Event.addListener(marker,
												"click", function(e) {
													if (infowindow.getMap()) {
														infowindow.close();
													} else {
														infowindow.open(map1,
																marker);
													}
												});
										var contentString = [
												'<div>',
												'    <h3 style="text-align:center">[업소이름]</h3>',
												'    <div style="text-align:center">[전화번호 : 02-1111-1111]</div>',
												'    <div style="text-align:center">[별점 : ★★★★☆]</div>',
												'    <img src="../img/accomodation/home1.jpg" width="200" height="100" style="padding:5px"/>',
												'</div>'

										].join('');
										// 마크 클릭시 인포윈도우 오픈
										var infowindow = new naver.maps.InfoWindow(
												{
													content : contentString,
													maxWidth : 200,
													backgroundColor : "#eee",
													borderColor : "#2db400",
													borderWidth : 5,
													anchorSize : new naver.maps.Size(
															30, 30),
													anchorSkew : true,
													anchorColor : "#eee",
													pixelOffset : new naver.maps.Point(
															20, -20)
												});
									});
				</script>
			</div>


			<!--  ========================== 룸들 정보 보기 시작 ========================== -->
			<button onclick="whenClickAccor('rooms')" class="w3-button w3-block w3-left-align w3-green font1-medium">

				<strong>방 정보 보기</strong>
			</button>
			<div class="border w3-show" id="rooms" style="padding: 20px">
				<!-- 룸 리스트 정보 시작 -->
				<div class="border row rounded">
					<!-- 이미지 DIV 시작 -->
					<div id="ImgDiv1" class="container carousel slide col-lg-4" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

						<!-- The slide show -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="../img/accomodation/hotel01.PNG" class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel02.PNG" class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel03.PNG" class="roomsImg rounded">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#room1" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#room1" data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
					<!-- 이미지 DIV 끝 -->

					<!-- 정보 DIV 시작 -->
					<div class="container font1-medium col-lg-8" style="margin: 0px; padding: 10px 20px 0 20px">
						<h3 class="row">
							<span id="rname"><strong>Standard</strong></span>
						</h3>
						<h6 class="row">
							기준 <span id="min">2</span>명 (최대 <span id="max">2</span>명)
						</h6>
						<br />
						<div class="row">
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bed"></i><span id="bedroom">2</span>
							</p>
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bath"></i><span id="bathroom">1</span>
							</p>
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bath"></i><span id="bathroom">1</span>
							</p>
						</div>
						<hr />
						<div class="row">
							<!-- 평점 정보 시작 -->
							<p class="col-lg-6">
								<label>평점</label> <i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
							</p>

							<!-- 평점 정보 끝 -->
							<div class="col-lg-2"></div>
							<h4 class="col-lg-4">
								<i class="fa fa-fw fa-won"></i><span id="price">20000</span>
							</h4>

						</div>
						<br />

						<!-- 버튼 폼 시작 -->
						<div class="row">
							<div class="col-sm-5"></div>

							<div class="col-sm-4"></div>
							<input type="button" value="예약하기" class="btn form-control col-sm-3 btn-success" />
						</div>
						<!-- 버튼 폼 끝 -->

					</div>
					<!-- 정보 DIV 끝 -->

					<!-- 리뷰 DIV 시작 -->
					<div style="width: 100%; padding: 10px; background: #e6ffe6;">
						<input type="hidden" id="reviewStatus" value="up" />

						<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
						<div id="showReview" class="font1-medium btn btn-success" style="width: 100%; height: 30px" onclick="whenClickReview()">
							<strong><i class='fa fa-caret-down' style='font-size: 20px'></i> 리뷰</strong>
						</div>

						<div class="container input-group" id="review" style="display: none; padding-top: 10px">
							<div class="row ">
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-thumbs-o-up"></i> 평점 : </label> <span id="grade">★ ★ ★ ★ ★</span>
								</p>
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-user"></i> 아이디 : </label><span id="uid">123456</span>
								</p>
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-calendar"></i> 날짜 : </label> <span id="grade">2018-07-24</span>
								</p>
							</div>
							<label><i class="fa fa-comments"></i> 내용 </label>
							<div class="row">
								<!-- 쓰기는 예약 내역에서 가능 있음. -->
								<p class="col-sm-8 font1-small border review-p" id="content">여기 짱 좋아요 ~</p>

								<p class="col-sm-4">
									<img src="../img/accomodation/hotel03.PNG" style="width: 100%; height: 150px" class="rounded">
								</p>
							</div>
						</div>
					</div>
					<!-- 리뷰 DIV 끝 -->
				</div>
				<!--  -->
			</div>
			<!-- center 끝 -->
			<footer class="row footer" id="footer">
				<div></div>
			</footer>
		</div>
	</div>
	<aside class="col-sm-2"></aside>


	<script src="../js/showDetailAccomodation.js"></script>

</body>
</html>