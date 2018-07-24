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
	<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->

</head>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
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
		<div class="col-sm-7 center" id="center">

			<div class="w3-container w3-padding-64 w3-center" id="team">
				<h2>OUR TEAM</h2>
				<p>Meet the team - our office rats:</p>

				<div class="w3-row">
					<br>
					<div class="w3-quarter">
						<img src="/w3images/avatar.jpg" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>Johnny Walker</h3>
						<p>Web Designer</p>
					</div>

					<div class="w3-quarter">
						<img src="/w3images/avatar.jpg" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>Rebecca Flex</h3>
						<p>Support</p>
					</div>

					<div class="w3-quarter">
						<img src="/w3images/avatar.jpg" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>Jan Ringo</h3>
						<p>Boss man</p>
					</div>

					<div class="w3-quarter">
						<img src="/w3images/avatar.jpg" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>Kai Ringo</h3>
						<p>Fixer</p>
					</div>

				</div>
			</div>


		</div>
		<div class="w3-content" style="max-width:1532px;">

  <div class="w3-container w3-margin-top" id="rooms">
    <h3>Rooms</h3>
    <p>Make yourself at home is our slogan. We offer the best beds in the industry. Sleep well and rest well.</p>
  </div>
  
  <div class="w3-row-padding">
    <div class="w3-col m3">
      <label><i class="fa fa-calendar-o"></i> Check In</label>
      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
    </div>
    <div class="w3-col m3">
      <label><i class="fa fa-calendar-o"></i> Check Out</label>
      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
    </div>
    <div class="w3-col m2">
      <label><i class="fa fa-male"></i> Adults</label>
      <input class="w3-input w3-border" type="number" placeholder="1">
    </div>
    <div class="w3-col m2">
      <label><i class="fa fa-child"></i> Kids</label>
      <input class="w3-input w3-border" type="number" placeholder="0">
    </div>
    <div class="w3-col m2">
      <label><i class="fa fa-search"></i> Search</label>
      <button class="w3-button w3-block w3-black">Search</button>
    </div>
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