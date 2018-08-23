<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<link rel="stylesheet" href="/webapp/css/default.css">
<link rel="stylesheet" href="/webapp/css/manageAccomodation.css">
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
.row-text{
	font:0.8em;
	color:grey;
	padding-left:10px;
}
</style>
</head>
<body>
<c:set var="vo" value='${accoVO}' />
	<%@ include file="../topnav_master.jspf"%>
	<!-- 본문은 left center right으로 나뉜다.-->
	<div id="main" class="row main">

		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center">
			<ul class="nav btn-group" >
				
				  <!-- 숙소 정보 있을 때 -->
				   <c:if test="${vo.a!=null and vo.a!=''}" >
				 
				  <li class="nav-item btn btn-primary ">
				    <a class="nav-link w3-text-white w3-large active"  href="/webapp/master/viewAcco"><b>숙소  보기</b></a>
				  </li>
				  <li class="nav-item btn btn-primary">
				    <a class="nav-link w3-text-black w3-large"  href="/webapp/master/editAcco"><b>숙소 정보 수정</b></a>
				  </li>
				   <li class="nav-item btn btn-primary">
				    <a class="nav-link w3-text-black w3-large"  href="#"><b>숙소 정보 삭제</b></a>
				  </li>
				 </c:if>
				</ul>
	  <c:if test="${vo.a!=null and vo.a!=''}" >
<!--  a, mid,aname, atel , aaddr, acheckin, acheckout, agil, amaxreservedate, amaxsleepdate, anotice, aimg1,aimg2,aimg3 -->
			<!-- 업소 간략 정보 -->
			<div class="reginfoFrm w3-card-4 w3-bar" style="margin-top:50px;">
			
				<div class="row" style="border-style: none;  padding:20px">
		
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
									<img src="${vo.aimg1}" class="roomsImg" onerror="this.src='/webapp/img/1.png'" >
								
								</div>
								
								
								<div class="carousel-item">
									<img src="${vo.aimg2}" class="roomsImg" onerror="this.src='/webapp/img/1.png'" >

								</div>
							
								
								<div class="carousel-item">
									<img src="${vo.aimg3}" class="roomsImg" onerror="this.src='/webapp/img/1.png'" >
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
					<div class="col-lg-7" style="padding-top:20px">
						<div class="row info">
							<div class="col-lg-12" id="aname">업소명: <span class="row-text">${vo.aname}</span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-7">업소유형 : <span class="row-text">${vo.atype} </span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-12">주소 : <span class="row-text">${vo.aaddr}</span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-12">연락처 : <span class="row-text">${vo.atel}</span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-lg-6">입실시간 : <span class="row-text">${vo.acheckin}</span></div>
							<div class="col-lg-6">퇴실시간 : <span class="row-text">${vo.acheckout}</span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-sm-12">테마 <br /> <span class="row-text">${vo.atheme}</span></div>
						</div>
						<hr/>
						<div class="row info">
							<div class="col-sm-12">주의 사항 <br /> <span class="row-text">${vo.anotice}</span></div>
						</div>
					</div>

				</div>
			</div>
			</c:if>

		</div>
		
		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>
</body>
</html>