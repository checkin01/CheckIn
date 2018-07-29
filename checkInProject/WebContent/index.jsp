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
<style>
body {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 100%;
	height: 50%;
}

.header {
	margin-top: 55px;
	position: absolute;
	height: 60%;
	background: red;
	width: 100%;
}

.paragrapgh {
	text-align: center;
	margin-top: 100px;
	height: 30%;
	background: yellow;
}
</style>
</head>
<body>
	<%@ include file="nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->

	<div class="header">
		<div class="container paragrapgh">
			<h1 class="font1-large">
				<strong>Check In에서 빠르고 쉽게 예약하세요 !</strong>
			</h1>
		</div>
		<div class="filter row container">
			<div class="col-lg-3">
				<label for="type">유형</label>
				<div id="type" class="dropdown">
					
				</div>
			</div>

		</div>
	</div>

	<div id="main" class="main"></div>
</body>
</html>