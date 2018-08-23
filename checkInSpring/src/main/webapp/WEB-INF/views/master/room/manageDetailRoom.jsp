<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 룸 정보 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/showDetailStyle.css">
<!--  body 구성에 적용 되는 스타일시트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">


<style>
.roomsImg {
	margin-top: 20px;
	padding: 0px;
	width: 100%;
	height: 250px;
	padding: 0px;
}
</style>
</head>
<body>
	<%@ include file="../topnav_master.jspf"%>

	<div id="main" class="row main">
		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-2 font1-medium w3-container" id="left"></aside>

		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-8 center w3-container" id="center">
			<!--div class="font1-small container" style="padding: 20px auto; top:20px;botton:20px">객실 관리 페이지</div>  -->

			<!--  ========================== 룸들 정보 보기 시작 ========================== -->

			<div class="w3-show container" id="rooms">
				<!-- 룸 리스트 정보 시작 -->
								
				<div style="text-align: right; width: 100%">
					<a class="w3-hover-none w3-text-black" href="/webapp/master/addGuestroomInfo"><i class="fa fa-plus-square"></i>새 룸 등록</a>
				</div>
				
				<c:forEach var="vo" items="${list}">				
				<div class="border row">
					<!-- 이미지 DIV 시작 -->
					<div id="${vo.r }" class="container carousel slide col-lg-4" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

						<!-- The slide show -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${vo.rimg1 }" class="roomsImg rounded" onerror="this.src='/webapp/img/1.png'">
							</div>
							<div class="carousel-item">
								<img src="${vo.rimg2 }" class="roomsImg rounded" onerror="this.src='/webapp/img/1.png'">
							</div>
							<div class="carousel-item">
								<img src="${vo.rimg3 }" class="roomsImg rounded" onerror="this.src='/webapp/img/1.png'">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#${vo.r }" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#${vo.r }"  data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
					<!-- 이미지 DIV 끝 -->

					<!-- 정보 DIV 시작 -->
					<div class="container font1-medium col-lg-8" style="margin: 0px; padding: 10px 20px 0 20px">
						<h3 class="row">
							<span id="rname"><strong>${vo.rname }</strong></span>
						</h3>
						<h6 class="row">
							기준 <span id="min">${vo.rmin }</span>명 (최대 <span id="max">${vo.rmax }</span>명)
						</h6>
						<br />
						<div class="row">
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bed"></i><span id="bedroom">${vo.rbedroom }</span>
							</p>
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bath"></i><span id="bathroom">${vo.rrestroom }</span>
							</p>
							<p class="col-sm-1">
								<i class="fa fa-fw fa-bath"></i><span id="bathroom">${vo.rdiningroom }</span>
							</p>
						</div>
						<hr />
						<div class="row">
							<!-- 평점 정보 시작 -->
							<p class="col-lg-6">
							<c:choose>
								<c:when test ="${vo.rgrade != null and vo.rgrade != 0 }">
									<label>평점</label>
									<c:forEach begin = '1' end='${vo.rgrade}' step='1'>
									<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i> 
								</c:forEach>
								</c:when>
								<c:when test ="${vo.rgrade == null or vo.rgrade == 0}">
									<label>등록된 리뷰가 없습니다.</label>
								</c:when>
							</c:choose>
								</p>
							<!-- 평점 정보 끝 -->
							<div class="col-lg-2"></div>
							<h4 class="col-lg-4">
								<i class="fa fa-fw fa-won"></i><span id="price">${vo.rprice }</span>
							</h4>

						</div>
						<br />

						<!-- 버튼 폼 시작 -->
						<div class="row" style="padding: 10px; text-align: right;">
							<a href="/webapp/master/deleteGuestroomInfo?r=${vo.r }"><input type="button" value="삭제하기" class="btn  btn-danger" id="delBtn" /></a>
							<div class="col-sm-1"></div>
							<a href="/webapp/master/modifyGuestroomInfo?r=${vo.r }"><input type="button" value="수정하기" class="btn  btn-success" id="editBtn" /></a>
							<div class="col-sm-1"></div>
							<c:choose>
								<c:when test ="${vo.rgrade != null and vo.rgrade != 0 }">
									<a href="<%=request.getContextPath()%>/master/review/showReviewList.jsp"><input type="button" value="리뷰 보기" class="btn  btn-success" /></a>
								</c:when>
								
							</c:choose>
							
							<div class="col-sm-1"></div>
						</div>
						<!-- 버튼 폼 끝 -->

					</div>

					<!-- 정보 DIV 끝 -->
				</div>
				</c:forEach>
				
				
				
				<!--   -->
			</div>
			<!-- center 끝 -->

		</div>
		<aside class="col-sm-2"></aside>

		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 100px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>



</body>
</html>