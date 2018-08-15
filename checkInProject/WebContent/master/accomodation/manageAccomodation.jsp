<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkin-관리자페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/manageAccomodation.css">
<!-- body 구성에 적용 되는 스타일 시트 -->

<!-- filter -->
<script>
	
</script>
<style>
.reginfoFrm {
	margin-top: 5px
}

#manageBtn>div {
	margin-left: 10px;
	float: right
}

.roomsImg {
	margin: 20px auto;
	width: 100%;
	height: 350px;
}
</style>
</head>
<body>
	<%@ include file="../topnav_master.jspf"%>
	<!-- 본문은 left center right으로 나뉜다.-->
	<div id="main" class="row main">

		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center">
			<div class="btn row" style="float: right;">
				<a class="w3-hover-none w3-text-black"
					href="<%=request.getContextPath()%>/master/accomodation/registerAccomodation.jsp"><i class="fa fa-plus-square"></i> 새 숙소 등록</a>
			</div>

			<!-- 업소 이름 -->
			<div class="row" style="margin-top: 10px">

				업소명

			</div>

			<!-- 업소 간략 정보 -->
			<div class="list-group reginfoFrm">
				<div class="row border" style="border-style: none; margin: 0px; padding: 10px">


					<!-- carousel : 업소 사진-->
					<div class="col-lg-5" style="background: white">
						<div id="room1" class="carousel slide" data-ride="carousel"
							style="margin-top: 15px; margin-left: 0px; height: 100%">
							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#room1" data-slide-to="0" class="active"></li>
								<li data-target="#room1" data-slide-to="1"></li>
								<li data-target="#room1" data-slide-to="2"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner" style="width: 100%">
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
							<a class="carousel-control-prev" href="#room1" data-slide="prev"> <span
								class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#room1" data-slide="next"> <span
								class="carousel-control-next-icon"></span>
							</a>
						</div>
					</div>


					<!-- 업소 정보 -->
					<div class="col-lg-7 border" style="padding-top:20px">
						<div class="row info">
							<div class="col-lg-12" id="aname">업소명:</div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-7">업소유형 :</div>
							<div class="col-lg-5">별점: ★★★★★</div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-12">주소 :</div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-12">연락처 : 02-1111-1111</div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-6">입실시간 :</div>
							<div class="col-lg-6">퇴실시간 :</div>
						</div>
					
						<hr/>
						<div class="row info">
							<div class="col-sm-12">기타(테마) : 주차, 스파, 풀, 복층</div>
						</div>
					</div>

				</div>

				<div class="row" id="manageBtn" style="width: 100%; text-align: right; padding-top: 10px;">
					
					<div class="btn btn-success " id="infoEditBtn">
						<a class="w3-hover-none w3-text-white "
							href="<%=request.getContextPath()%>/master/accomodation/editAccomodation.jsp">정보수정</a>
					</div>
					<div class="btn btn-danger " id="deleteBtn">
						<a class="w3-hover-none w3-text-white ">삭제</a>
					</div>
				</div>
			</div>
			<!-- 업소 관리 버튼 -->




		</div>
					<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>


</body>
</html>