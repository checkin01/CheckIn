<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkin-관리자페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../js/gchart_accomodation.js"></script>
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="../css/manageAccomodation.css">
<!-- body 구성에 적용 되는 스타일 시트 -->

<!-- filter -->
<script>
  			//버튼 누르면 페이지 이동 효과
 $(function(){
  		$("#roomManageBtn").click(function(){
  		location.href = "<%=request.getContextPath()%>/room/manageDetailRoom.jsp";
  		});
  		$("#bookingBtn").click(function(){
  		location.href = "<%=request.getContextPath()%>/master/manageBookingInfo.jsp";
  		});
  		$("#infoEditBtn").click(function(){
  			location.href = "<%=request.getContextPath()%>/master/editAccomodation.jsp";
	});
	});
</script>
</head>
<body>
	<%@ include file="../nav_master.jspf"%>
	<!-- 본문은 left center right으로 나뉜다.-->
	<div id="main" class="row main">

		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center">
			<!-- 관리 현황 페이지 google chart -->
			<div class="gchart">
				<div id="columnchart_material" style="width: 800px; height: 400px;"></div>
			</div>

			<div id="main-info" class="list-group border">
				<div class=" row">
					<div class="col-lg-5" id="img-info">
						<div class="btn-group list-group-horizontal row">
							<div class="btn btn-success btn-sm col-lg-3" id="roomManageBtn">객실관리</div>
							<div class="btn btn-primary  btn-sm col-lg-3" id="bookingBtn">예약현황</div>
							<div class="btn btn-primary btn-sm col-lg-3" id="infoEditBtn">정보수정</div>
							<div class="btn btn-danger btn-sm col-lg-3" id="deleteBtn">삭제</div>
						</div>
					
						<!-- carousel : 업소 사진-->
						<div class="border list-group row" style="background: white">
							<div id="room1" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ul class="carousel-indicators">
									<li data-target="#room1" data-slide-to="0" class="active"></li>
									<li data-target="#room1" data-slide-to="1"></li>
									<li data-target="#room1" data-slide-to="2"></li>
								</ul>

								<!-- The slideshow -->
								<div class="carousel-inner" >
									<div class="carousel-item active">
										<img src="../img/accomodation/home1.jpg" class="roomsImg">
									</div>
									<div class="carousel-item">
										<img src="../img/accomodation/home2.jpg" class="roomsImg">
									</div>
									<div class="carousel-item">
										<img src="../img/accomodation/home3.jpg" class="roomsImg">
									</div>
								</div>

								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#room1" data-slide="prev">
									<span class="carousel-control-prev-icon"></span>
								</a> <a class="carousel-control-next" href="#room1"
									data-slide="next"> <span class="carousel-control-next-icon"></span>
								</a>
							</div>
						</div>
						<div class="form-group row">
							<label for="thema">테마</label>
							<div id="thema">주차, 풀, 복층</div>
						</div>
			
					</div>
					<div class="col-lg-1"> </div>
					<div class="col-lg-6" id="text-info">
						<div class="form-group">
							<label for="aname">업소 이름</label>
							<div id="aname">금강 호텔</div>
						</div>
						<div class="form-group">
							<label for="type">업소 유형</label>
							<div id="type">호텔</div>
						</div>
						<div class="form-group">
							<label for="tel">전화번호</label>
							<div id="tel">031-9999-8888</div>
						</div>
						<div class="form-group">
							<label for="in">입실시간 :</label>
							<div id="in">13:00~</div>
						</div>
						<div class="form-group">
							<label for="out">퇴실시간 :</label>
							<div id="out">12:00~</div>
						</div>
					</div>
				</div>
			</div>
					<!-- footer -->
		<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
		</div>

	</div>
	

</body>
</html>