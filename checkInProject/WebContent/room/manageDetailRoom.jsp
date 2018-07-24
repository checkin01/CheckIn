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

	<div id="main" class="row main">
		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-1 font1-medium w3-container" id="left">
		</aside>
		
		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-9 center w3-container" id="center">

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
					<div class="row">
						<h3><span id="rname"><strong>Standard</strong></span></h3>
						<span class="col-sm-5"></span>
						<h6 style="color:#aaa">쓴날짜 :<span id="writedate" >2018-09-01</span></h6>
					</div>
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
						<input type="button" value="삭제하기" class="btn form-control btn-success col-sm-3" />
						<div class="col-sm-1"></div>
						<input type="button" value="수정하기" class="btn form-control btn-success col-sm-3" />
						<div class="col-sm-1"></div>
						<input type="button" value="예약하기" class="btn form-control btn-success col-sm-3" />
					</div>
					<!-- 버튼 폼 끝 -->
				</div>
				<!-- 정보 DIV 끝 -->
				
				<!-- 리뷰 DIV 시작 -->
				<div class="container">
				<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
				<strong class="font1-medium"><i class="fa fa-caret-down" style="font-size:20px"></i> 리뷰</strong>
					<div class="container input-group" style="background:#ddd; border-top:solid 1px #ccc">
						<div class="col-sm-8">
							<p>평점 : <span id="grade">★ ★ ★ ★ ★</span></p>
							<p><label>내용 :</label>
							<span id="content font1-small">여기 짱 좋아요 ~</span></p>
							<!-- 쓰기는 예약 내역에서 가능 있음. -->
							<p><img src="../img/accomodation/hotel03.PNG" style="width:100px; height:100px"class="rounded"></p>
						</div>
						<div class="col-sm-4 font1-small" style="color:grey">
							<p>아이디 : <span id="uid">아이디아이디</span></p><hr />
							<p>작성일 : <span id="grade">2018-07-24</span></p><hr />
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