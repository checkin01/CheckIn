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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- 
	daterangepicker
	1. less 파일 적용
-->
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<script>
	$(function() {
		$('input[name="daterange"]').daterangepicker(
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

</head><body>
	<%@ include file="../nav.jspf"%>

	<div id="main" class="row main">
	
		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-3 font1-medium" id="left">
			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index: 3; top: 50px; width: 260px" id="mySidebar">
				<!-- 정보 -->
				<div class="w3-container w3-display-container w3-padding-16">
					<i onclick="w3_close()"
						class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
					<hr>
					
					<form action="/action_page.php" target="_blank">
						<p>
							<i class="fa fa-calendar-check-o"> <label>일자</label></i>
						</p>
						<input type="text" class="w3-input w3-border" name="daterange"
							name="reservtime" /> <br />
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
				<div class="w3-bar-block">
					<!-- 본 상품 -->
					<div class="w3-container">
						<a href=#><img src="../img/accomodation/hotel01.PNG" alt="hotel1" style="width: 230px; height: 200px" /></a>
					</div>
				</div>
			</nav>
		</aside>

	<!-- 센터 부분 -->
	<div class="col-lg-8 center w3-container" id="center">
			<!-- Push down content on small screens -->
			<div class="w3-hide-large" style="margin-top: 80px"></div>
			<!-- 기본 정보 -->			
			<div class="input-group border">
					<div class="col-sm-8 w3-container" style="margin:0px; padding: 10px">
						<div class="w3-row w3-large" style="width: 100%; margin-left: 5px"
							id="space">
							<label class="w3-col"><strong>호텔 이름</strong></label>
							<div class="w3-col s6">
								<p>
									<i class="fa fa-fw fa-wifi"></i>
									<i class="fa-fw fa fa-support"></i>
									<i class="fa fa-automobile fa-fw"></i> 
									<i class="material-icons">local_dining</i>
								</p>
								<p><i class="material-icons">call</i><span id=tel>02-6585-7144</span></p>
								<p></p>
							</div>
							<div class="w3-col s6">
								<p><i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM</p>
								<p><i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM</p>
							</div>
						</div>
						
						<div class="w3-row w3-large" style="width: 100%;">
							<div class="w3-col s6">
								<p><i class="fa fa-fw fa-thumbs-o-up"></i>평점 <span id="grade"></span></p>
								<p><i class="fa fa-fw fa-won"></i><span id="price"></span></p>
							</div>
							<div class="w3-col s6">
								
							</div>
						</div>
					</div>
					<div class="w3-container col-sm-4" style="padding: 10px">
						<img src="../img/accomodation/hotel01.JPG" alt="Norway"
							style="width: 230px; height: 200px" />
					</div>
			</div>
			
			<div class="input-group border">
					<!-- carousel -->
					<div class="col-sm-4 carousel slide" data-ride="carousel" id="myCarousel1" style="padding: 10px">
					 <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
						    <li data-target="#myCarousel1" data-slide-to="1"></li>
						    <li data-target="#myCarousel1" data-slide-to="2"></li>
						  </ol>
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner">
						   <div class="item active">
							<img src="../img/accomodation/hotel01.PNG" alt="hotel1" style="width: 230px; height: 200px" />
						   </div>
						   <div class="item">
							<img src="../img/accomodation/hotel02.PNG" alt="hotel2" style="width: 230px; height: 200px" />
						   </div>
						   <div class="item">
							<img src="../img/accomodation/hotel03.PNG" alt="hotel3" style="width: 230px; height: 200px" />
						   </div>
						</div>
						 <!-- Left and right controls -->
						 <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#myCarousel1" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right"></span>
						    <span class="sr-only">Next</span>
						  </a>
					</div>
					
					
					<div class="col-sm-8 w3-container" style="margin:0px; padding: 10px">
						<div class="w3-row w3-large" style="width: 100%; margin-left: 5px"
							id="space">
							<label class="w3-col"><strong>The space</strong></label>
							<div class="w3-col s6">
								<p>
									<i class="fa fa-fw fa-male"></i> Max people: 4
								</p>
								<p>
									<i class="fa fa-fw fa-bath"></i> Bathrooms: 2
								</p>
								<p>
									<i class="fa fa-fw fa-bed"></i> Bedrooms: 1
								</p>
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
						<div class="w3-row w3-large" style="width: 100%; margin-left: 10px">
							<div class="w3-col s6">
								<p>
									<i class="fa fa-fw fa-thumbs-o-up"></i>평점 <span id="grade"></span>
								</p>
								<p>
									<i class="fa fa-fw fa-won"></i><span id="price"></span>
								</p>
							</div>
							<div class="w3-col s6" >
								<input type="button" value="예약하기" class="btn btn-success" /> <input
									type="button" value="리뷰보기" class="btn btn-success" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<aside class="col-sm-1">
	
	</aside>
	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
</html>