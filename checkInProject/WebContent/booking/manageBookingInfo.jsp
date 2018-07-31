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
<!-- daterangepicker-->
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>
#page>div{margin-top:10px;border:1px solid black}
#bookListTop{border:1px solid red; height:50px; margin-top:20px; font-size:1.5em;}
#bookListTop>div{border:1px solid black; text-align:center}
#bookList{border:1px solid red; height:50px; font-size:1.3em}
#bookList>div{border:1px solid black; text-align:center;}
.page-link{color:black}

#paging{margin:10px auto}

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
</script>
</head>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main" style="position: relative; top: 80px">

		<aside class="left col-sm-2" id="left">

			<!-- filter -->
		</aside>
		<div class="col-sm-8 center " id="center">
			<div class="w3-container w3-center" id="team">
				<h2>CHECKIN</h2>
				<p>홈>예약현황</p>

				<!--  <div class="w3-row">
					<br>
					<div class="w3-quarter">
						<img src="../img/home.png" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>홈</h3>
					</div>

					<div class="w3-quarter ">
						<img src="../img/1541.png" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>예약현황 보기</h3>
						
					</div>

					<div class="w3-quarter">
						<img src="../img/1542.png" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>숙박업소 관리</h3>
						
					</div>

					<div class="w3-quarter">
						<img src="../img/logout1.png" alt="Boss" style="width: 45%"
							class="w3-circle w3-hover-opacity">
						<h3>로그아웃</h3> -->
						
			</div>
		</div>
	</div>
	<!-- Team 끝 -->
	<!-- style ="속성:속성값 ; 속성:속성값 " -->
	<!-- Room 시작 -->
	<div class="w3-container w3-center w3-black"
		style="positon: relative; margin-top: 80px" id="rooms">
		<h3>실시간 예약현황</h3>
				

		<div class="row">
			<div class="col-sm-5 ">
				<label><i class="fa fa-calendar-o"></i> 날짜</label> 
				<input class="w3-input w3-border" type="text" name ="checkinout" placeholder="DD MM YYYY"/>
			</div>

			<div class="col-sm-5">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input"
						id="customRadio1" name="customRadio"> 
						<label class="custom-control-label" for="customRadio1">Check-In</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input"
						id="customRadio2" name="customRadio"> 
						<label class="custom-control-label" for="customRadio2">Check-Out</label>
				</div>
			</div>
			<div class="col-sm-2">

				<button class="fa fa-search w3-button w3-block w3-white">Search</button>
			</div>
					
	</div>
	</div>
	<!-- BookingList ------------------------------------ -->	
	<div class="list-group" style="margin:10px 50px">
		<div class="list-group-item">
			<div class="row border" id="bookListTop">				
				<div class="col-md-1">호실</div>
				<div class="col-md-1">예약자이름</div>
				<div class="col-md-1">인원수</div>
				<div class="col-md-2">연락처</div>
				<div class="col-md-2">체크인</div>
				<div class="col-md-2">체크아웃</div>
				<div class="col-md-2">예약날짜</div>
				<div class="col-md-1">입실여부</div>							
			</div>
		</div>
		<div class="list-group-item">						
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
						
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
			<div class="row border" id="bookList">
				<div class="col-md-1">201</div>
				<div class="col-md-1">김길동</div>
				<div class="col-md-1">2명</div>
				<div class="col-md-2">010-1111-1111</div>
				<div class="col-md-2">2018-07-21</div>
				<div class="col-md-2">2018-07-23</div>
				<div class="col-md-2">2018-07-15</div>
				<div class="col-md-1">X</div>
			</div>
		</div>
		<!-- 페이징 ----------------------------------------------------------->
		<div class="list-group-item" id="paging">
			<ul class="pagination pagination-md">
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Prev</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">1</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">2</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">3</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">4</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">5</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Next</a></li>
			</ul>			
		</div>
	</div>	

	<aside class="col-sm-2 right" id="right"></aside>
	

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
		
		
		
	</footer>
</body>
</html>