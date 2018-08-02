<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 룸 정보 관리</title>
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
<script src="../js/showDetailAccomodation.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>
.roomsImg {
	margin-top: 20px; padding : 0px;
	width: 100%;
	height: 250px;
	padding: 0px;
}
</style>
</head>
<body>
	<%@ include file="../nav.jspf"%>

	<div id="main" class="row main">
		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-1 font1-medium w3-container" id="left">
		</aside>
		
		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-9 center w3-container" id="center">
			<div class="font1-small container" style="padding:20px auto;top:20px">
				<span> 홈 > 관리 페이지 > 룸 관리 </span>
			</div>
			
<!--  ========================== 룸들 정보 보기 시작 ========================== -->
			
		
			
			<div class="border w3-show container" id="rooms" >
				<!-- 룸 리스트 정보 시작 -->
				<div class="row">
						<div style="width:80%"> </div>
						<input type="button" value="등록하기" class="btn form-control btn-success col-sm-3" id="registerBtn"/>
				</div>
				<div class="border row">
					<!-- 이미지 DIV 시작 -->
					<div id="ImgDiv1" class="container carousel slide col-lg-4"
						data-ride="carousel">
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
					<div class="container font1-medium col-lg-8"
						style="margin: 0px; padding:10px 20px 0 20px">
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
									class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
								<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
							</p>

							<!-- 평점 정보 끝 -->
							<div class="col-lg-2"></div>
							<h4 class="col-lg-4">
								<i class="fa fa-fw fa-won"></i><span id="price">20000</span>
							</h4>

						</div>
						<br />

					<script>
						$("#editBtn").click(function(){
	  						location.href = "<%=request.getContextPath()%>/room/editRoom.jsp";
	  					});
					
					</script>
					<!-- 버튼 폼 시작 -->
					<div class="row">
						<input type="button" value="삭제하기" class="btn form-control btn-success col-sm-3" id="delBtn" />
						<div class="col-sm-1"></div>
						<input type="button" value="수정하기" class="btn form-control btn-success col-sm-3" id="editBtn"/>
						<div class="col-sm-1"></div>
				
					</div>
					<!-- 버튼 폼 끝 -->

					</div>
					<!-- 정보 DIV 끝 -->

					<!-- 리뷰 DIV 시작 -->
					<div style="width: 100%; padding: 10px; background: #e6ffe6;">
						<input type="hidden" id="reviewStatus" value="up" />

						<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
						<div id="showReview" class="font1-medium btn btn-success"
							style="width: 100%; height: 30px" onclick="whenClickReview()">
							<strong><i class='fa fa-caret-down' style='font-size: 20px'></i> 리뷰</strong>
						</div>

						<div class="container input-group" id="review"
							style="display: none; padding-top: 10px">
							<div class="row ">
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-thumbs-o-up"></i> 평점 : </label> <span
										id="grade">★ ★ ★ ★ ★</span>
								</p>
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-user"></i> 아이디 : </label><span id="uid">123456</span>
								</p>
								<p class="col-sm-4 review-p border">
									<label><i class="fa fa-calendar"></i> 날짜 : </label> <span
										id="grade">2018-07-24</span>
								</p>

							</div>

							<label><i class="fa fa-comments"></i> 내용 </label>
							<div class="row">
								<!-- 쓰기는 예약 내역에서 가능 있음. -->
								<p class="col-sm-8 font1-small border review-p" id="content">
									여기 짱 좋아요 ~</p>

								<p class="col-sm-4">
									<img src="../img/accomodation/hotel03.PNG"
										style="width: 100%; height: 150px" class="rounded">
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

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
	<script src="../js/showDetailAccomodation.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=map"></script>
	</body>
</html>