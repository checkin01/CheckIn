<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 예약 관리</title>
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
<link rel="stylesheet" href="../css/default.css">
<!-- 구글 차트 -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="../js/gchart_combo.js"></script>
<script src="../js/gchart_cal.js"></script>
<!-- body 구성에 적용 되는 스타일 시트 -->
<!-- daterangepicker-->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>
body{
	font-size:1em;
	
}
.pagination {
	margin: 10px auto;
}

.page-link {
	
}
#bookingList button{
	width:100%;
	height:100%;
	font-size:100%;
	display:inline-block;
}



#bookListTop>div>div {
	font-size: 1em;
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
		$('.enter').click(function(){
			var html = $(this).html().trim();
			if(html == '미입실'){
				$(this).removeClass('w3-light-blue').addClass('w3-grey');
				html = '입실';
			}else{
				$(this).addClass('w3-light-blue').removeClass('w3-grey');
				html = '미입실';
			}
			alert(html + " 상태로 바뀌었습니다.");
			$(this).html(html);
			
		});
	});
	
</script>
</head>
<body>
	<%@ include file="../topnav_master.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom:100px">

		<aside class="left col-sm-2" id="left">
			<%@ include file="../leftside_nav.jspf"%>
		</aside>

		<!-- center -->
		<div class="col-sm-9 center" id="center">
			<!------------------------------ google chart ---------------------------------------->
			<div id="calendar_basic" style="width: 1000px; height: 350px;"></div>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>

			<!------------------------------ google chart ---------------------------------------->
			<hr />
			<div class="row" style="margin-left: 1px">
				<h2>[업소이름] 실시간 예약 현황</h2>
			</div>
			<div class="row" style="margin-left: 1px">
				<p>홈>업소이름>예약현황</p>
			</div>
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

			<!-- Team 끝 -->
			<!-- style ="속성:속성값 ; 속성:속성값 " -->
			<!-- Room 시작 -->
			<div class="row" style="margin-left:1px">
				<div class="col-md-2 w3-panel"
					style="margin: 0px; padding: 0px; text-align: center">
					<label><i class="fa fa-calendar-o"></i> 날짜</label> <input
						class="w3-input w3-border" type="text" name="checkinout"
						placeholder="DD MM YYYY" style="text-align: center" />
				</div>
				<div class="col-md-1" style="padding: 10px 0px 10px 15px">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="customRadio1"
							name="customRadio"> <label class="custom-control-label"
							for="customRadio1">Check-In</label>
					</div>
				</div>
				<div class="col-md-1" style="padding:10px 0px 10px 15px">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="customRadio2"
							name="customRadio"> <label class="custom-control-label"
							for="customRadio2">Check-Out</label>
					</div>
				</div>
				<div class="col-md-2">
					<button class="fa fa-search w3-button w3-green rounded"
						style="margin:0px; width: 100%; height:50%; font-size:0.7em">
						Search</button>
				</div>
			</div>
			<div class="list-group" style="margin-top: 20px ; font-size:0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop"
					style="text-align: center">
					<div class="row">
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
		
				<!-- 예약내역 한개 -->
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
						<div class="col-md-1">201</div>
						<div class="col-md-1">김길동</div>
						<div class="col-md-1">2명</div>
						<div class="col-md-2">010-1111-1111</div>
						<div class="col-md-2">2018-07-21</div>
						<div class="col-md-2">2018-07-23</div>
						<div class="col-md-2">2018-07-15</div>
						<div class="col-md-1"><button class="btn w3-light-blue enter">미입실</button></div>
					</div>
				</div>
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
						<div class="col-md-1">201</div>
						<div class="col-md-1">김길동</div>
						<div class="col-md-1">2명</div>
						<div class="col-md-2">010-1111-1111</div>
						<div class="col-md-2">2018-07-21</div>
						<div class="col-md-2">2018-07-23</div>
						<div class="col-md-2">2018-07-15</div>
						<div class="col-md-1"><button class="btn w3-light-blue enter">미입실</button></div>
					</div>
				</div>
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
						<div class="col-md-1">201</div>
						<div class="col-md-1">김길동</div>
						<div class="col-md-1">2명</div>
						<div class="col-md-2">010-1111-1111</div>
						<div class="col-md-2">2018-07-21</div>
						<div class="col-md-2">2018-07-23</div>
						<div class="col-md-2">2018-07-15</div>
						<div class="col-md-1"><button class="btn w3-grey enter">입실완료</button></div>
					</div>
				</div>
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
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
			</div>
			<!-- listGroup -->
			<!-- paging -->

			<ul class="pagination pagination-md" style="padding-left: 650px" id="pagination">
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
		</div>
		<!-- 여기 안에 모두 담자 -->
		
	<!-- right -->
	<aside class="col-sm-1 right" id="right">
		<%@ include file="../rightside_nav.jspf"%>
	</aside>
	


</div>


</body>
</html>