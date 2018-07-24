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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
div>center {
	position: relative;
}
</style>
</head>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
	showMyBookingList - 예약 보 리스트로 보기 - 용세
	예약한 현황, 예약 취소한 현황, 리뷰 쓰기 버튼, 예약취소정	
-->
	<div id="main" class="row main">

		<aside class="left col-sm-3" id="left">

			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top"
				style="z-index: 3; width: 260px" id="mySidebar">
				<div class="w3-container w3-display-container w3-padding-16">
				</div>
			</nav>
			<!-- filter -->
		</aside>
		<div class="col-sm-7 center" id="center" data-spy="scroll"	data-target=".navbar" data-offset="50">

			<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-bottom">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#section1">예약현황</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#section2">예약취소현황</a>
					</li>
				</ul>
			</nav>
			<div id="section1" class="container-fluid bg-success"
				style="padding-top: 70px; padding-bottom: 70px">
				<h1>예약현황</h1><hr/>
				<p></p>
				<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					
			</div>
			<div id="section2" class="container-fluid bg-warning"
				style="padding-top: 70px; padding-bottom: 70px">
				<h1>예약취소현황</h1><hr/>
				<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar
					while scrolling! Try to scroll this section and look at the
					navigation bar while scrolling!</p>
					
			</div>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>