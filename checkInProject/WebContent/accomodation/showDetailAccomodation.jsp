<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link  rel="stylesheet" href="../css/default.css"/>
<link rel="stylesheet" href="../css/accomodation/showDetailStyle.css">
<!--  body 구성에 적용 되는 스타일시트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- daterangepicker-->
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>
.roomsImg {
	margin-top: 20px; padding : 0px;
	width: 240px;
	height: 250px;
	padding: 0px;
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
	//<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
	function whenClickReview(){
		var upScroll = "<strong><i class='fa fa-caret-down' style='font-size:20px'></i> 리뷰</strong>";
		var downScroll = "<strong><i class='fa fa-caret-up' style='font-size:20px'></i> 리뷰</strong>";
		
		alert($("#reviewStatus").val());
		if($("#reviewStatus").val()=='up'){
			$("#showReview").html(downScroll);
			$("#reviewStatus").val('down');
			$("#review").css("display","block");
		
		}else if($("#reviewStatus").val()=="down"){
			$("#showReview").html(upScroll);
			$("#reviewStatus").val("up");
			$("#review").css("display","none");
			
		}
	}
	
</script>

</head>
<body>
	<%@ include file="../nav.jspf"%>

	<div id="main" class="row main">

		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-3 font1-medium w3-container" id="left">
			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top"
				style="z-index: 3; width: 260px; top: 50px;" id="mySidebar">
				<!-- 정보 -->
				<div class="w3-container w3-display-container w3-padding-16">
					<i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
					
					<!-- 호텔 정보 -->
					<div style="position:relative; top:20px">
						<p class="w3-col font1-large"><strong>호텔 이름</strong></p>
						
						<p>
							<i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM
							</p>
							<p>
								<i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM
							</p>
							<p>
								<i class="fa fa-fw fa-wifi"></i> <i class="fa-fw fa fa-support"></i>
								<i class="fa fa-automobile fa-fw"></i> <i class="material-icons">local_dining</i>
							</p>
							<p>
								<i class="material-icons">call</i><span id=tel>02-6585-7144</span>
							</p>
					<hr />
					<form action="/action_page.php" target="_blank">
						<p>
							<i class="fa fa-calendar-check-o"> <label>일자</label></i>
						</p>
						<input type="text" class="w3-input w3-border" name="checkinout" />
						<br />
						<p>
							<i class="fa fa-male"> <label>인원수</label></i>
						</p>
						<input class="w3-input w3-border" type="number" value="1"
							name="Adults" min="1" max="6"> <br />
						<p>
							<button class="w3-button w3-block w3-green w3-left-align"
								type="submit">
								<i class="fa fa-search w3-margin-right"></i> Search availability
							</button>
						</p>
					</form>
				</div>
				</div>
				
				<!-- 내가 본 상품 -->
				
				<div class="w3-bar-block container">
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
								<img src="../img/accomodation/hotel01.PNG"
									class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel02.PNG"
									class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="../img/accomodation/hotel03.PNG"
									class="roomsImg rounded">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#history" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#history"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
			</nav>
		</aside>
		
		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-8 center w3-container" id="center">
			<!-- 호텔 정보 
			<!-- Push down content on small screens -->
			<!--<div style="margin-top: 30px"></div>
			<!-- 기본 정보 -->
			<!--<div class="input-group">
				<div class="col-sm-8" style="margin: 0px; padding: 10px">
					<div class="w3-row w3-large" style="width: 100%; margin-left: 5px"
						id="space">
						<label class="w3-col"><strong>호텔 이름</strong></label>
						<div class="w3-col s6">
							<p>
								<i class="fa fa-fw fa-wifi"></i> <i class="fa-fw fa fa-support"></i>
								<i class="fa fa-automobile fa-fw"></i> <i class="material-icons">local_dining</i>
							</p>
							<p>
								<i class="material-icons">call</i><span id=tel>02-6585-7144</span>
							</p>
							<p></p>
						</div>
						<div class="w3-col s6">
							<p>
								<i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM
							</p>
							<p>
								<i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM
							</p>
						</div>
					</div>
				</div>
			
				<!-- div class="w3-container col-sm-4 rounded" style="padding: 10px">
					<img src="../img/accomodation/hotel01.JPG" alt="Norway"
						style="width: 230px; height: 200px" />
				</div-->
			<!--</div-->
			<!-- 호텔 정보  끝-->

			<!-- 룸 리스트 정보 시작 -->
			<div class="input-group border" style="top:20px">
				<!-- 이미지 DIV 시작 -->
				<div id="room1" class="carousel slide col-lg-4" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#room1" data-slide-to="0" class="active"></li>
						<li data-target="#room1" data-slide-to="1"></li>
						<li data-target="#room1" data-slide-to="2"></li>
					</ul>

					<!-- The slide show -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../img/accomodation/hotel01.PNG"
								class="roomsImg rounded">
						</div>
						<div class="carousel-item">
							<img src="../img/accomodation/hotel02.PNG"
								class="roomsImg rounded">
						</div>
						<div class="carousel-item">
							<img src="../img/accomodation/hotel03.PNG"
								class="roomsImg rounded">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#room1" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#room1" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
				<!-- 이미지 DIV 끝 -->

				<!-- 정보 DIV 시작 -->
				<div class="col-lg-7 container font1-medium"
					style="margin: 0px; padding: 20px">
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
							<label>평점</label> <i class="fa fa-fw fa-star"></i> <i
								class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i> <i
								class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
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
						<input type="button" value="예약하기"
							class="btn form-control btn-success col-sm-3" />
					</div>
					<!-- 버튼 폼 끝 -->
				</div>
				<!-- 정보 DIV 끝 -->
				
				<!-- 리뷰 DIV 시작 -->
				<div class="container" >
					<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
					<div id ="showReview" class="font1-medium btn btn-success" style="width:100% ;height:30px" onclick="whenClickReview()">
						<strong><i class='fa fa-caret-down' style='font-size:20px'></i> 리뷰</strong>
					</div>
					<input type="hidden" id="reviewStatus" value="up"/>
				<div class="container input-group" id="review" style="display:none;background:#ddd; border-top:solid 1px #ccc">
						<div class="row">
							<p class="col-sm-4">평점 : <span id="grade">★ ★ ★ ★ ★</span></p>
							<p class="col-sm-4">아이디 : <span id="uid">123456</span></p><hr />
							<p class="col-sm-4"><span id="grade">2018-07-24</span></p><hr />
						</div>
						<div class="row">
							<!-- 쓰기는 예약 내역에서 가능 있음. -->
							<p class="col-sm-8">
							<label>내용 :</label>
							<span id="content font1-small" >여기 짱 좋아요 ~</span>
							</p>
							<p  class="col-sm-4"><img src="../img/accomodation/hotel03.PNG" style="width:80%; height:150px"class="rounded"></p>
						</div>
					</div>
				</div>
				<!-- 리뷰 DIV 끝 -->
			</div>
			<!--  -->
		</div>
		<!-- center 끝 -->
	</div>

	<aside class="col-sm-2"></aside>
	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
</html>