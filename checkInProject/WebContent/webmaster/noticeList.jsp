<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
#pagination{
	margin-top:50px;
	margin-left:40%;
}

</style>
<head>
<meta charset="UTF-8">
<title>웹 관리 페이지</title>
</head>
<body>
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">
		<aside class="left col-sm-1" id="left"> </aside>
		<div class="col-sm-10 center container" id="center" style="text-align:center">
			<div class="btn-group">
				 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#writeModal">새 공지 추가</button>
			</div>
			
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">번호</div>
						<div class="col-md-2">아이디</div>
						<div class="col-md-5">제목</div>
						<div class="col-md-2">시작날짜</div>
						<div class="col-md-2">끝날짜</div>
					</div>
				</div>
			
			<div class="list-group-item" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">1</div>
						<div class="col-md-2">webmaster</div>
						<div class="col-md-5">제목</div>
						<div class="col-md-2">20180806</div>
						<div class="col-md-2">20180809</div>
					</div>
				</div>
				<div class="list-group-item" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">2</div>
						<div class="col-md-2">webmaster</div>
						<div class="col-md-5">연휴 관련 공지</div>
						<div class="col-md-2">20180806</div>
						<div class="col-md-2">20180808</div>
					</div>
				</div>
				
			</div>
			
			<ul class="pagination pagination-md" id="pagination">
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">Prev</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">1</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">2</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">3</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">4</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">5</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp"
					class="page-link">Next</a></li>
			</ul>
		
		<!-- 여기 안에 모두 담자 -->

	</div>
	<aside class="col-sm-1 right" id="right">
	
	</aside>

</div>

</body>
</html>