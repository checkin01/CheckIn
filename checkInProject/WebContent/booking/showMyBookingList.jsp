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
	<div id="main" class="row main"
		style="position: relative; margin-top: 80px">

		<aside class="left col-sm-2" id="left">


			<!-- filter -->
		</aside>
		<!-- 예약 현황 리스트 시작 -->
		<div class="col-sm-8 center" id="center">
			<h1>예약현황</h1>
			<hr />
			<!-- 예약 현황 1 시작 -->
			<div class="input-group border">
				<div class="input-group-item col-lg-3">
					<img src="../img/h01.PNG" style="width: 100%; height: 100%" />
				</div>
				<div class="container input-group-item col-lg-9">
					<table class="table">
						<thead>
							<tr>
								<th>예약날짜</th>
								<th>체크인</th>
								<th>체크아웃</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2018-07-22</td>
								<td>2018-07-21</td>
								<td>2018-07-22</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th>숙박업소</th>
								<th>룸번호(이름)</th>
								<th>연락처</th>
								<th>인원수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>고추잠자리</td>
								<td>302호</td>
								<td>032-531-7549</td>
								<td>2</td>
							</tr>
						</tbody>

					</table>
					<div>
						<button type="button" class="btn btn-danger" style="width:100%">예약취소</button>
					</div>
				</div>
			</div>
			<!-- 예약 현황 1 끝 -->
		</div>
		<!-- 예약 현황 리스트 끝 -->
		<aside class="col-s-2 right" id="right"></aside>		
	</div>
	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>