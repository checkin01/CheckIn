<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkin-관리자페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
<style>
 	.regtop{padding-top:50px; float:right}
 	.reginfoFrm{margin-top:130px; height:500px; border:2px solid black}
 	.reginfo{margin:10px 10px}
    .roomsImg {
      margin:10px 10px;
      width:300px;
      height:250px;
      
    }
    
    #info1{line-height:60px; height:60px; font-size:30px}
	#info2{line-height:40px; height:40px; font-size:16px}
	#manageFrm{margin-top:30px; padding:10px 10px}
	#manage{text-align:center}
</style>
<script>
	
</script>
</head>
<body>
<%@ include file="../nav.jspf" %>
<!-- 
	본문은 left center right으로 나뉜다.
-->
<div id= "main" class="row main">
	
	<aside class="left col-sm-2" id="left">
		
		<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:260px" id="mySidebar">
  			<div class="w3-container w3-display-container w3-padding-16">


  			</div>
  		</nav>
  		<!-- filter -->
  		
	</aside>
	<div class="col-sm-8 center" id="center">
		<div class="btn-group-lg regtop">
			<a href="#" class="btn btn-secondary" role="button">숙박업소등록</a>
			<a href="#" class="btn btn-secondary" role="button">숙박업소수정</a>		
			<a href="#" class="btn btn-secondary" role="button">숙박업소삭제</a>		
		</div>
		<div class="list-group reginfoFrm">
			<div class="list-group-item">
				<div class="row">					
					         <!-- carousel : 업소 사진-->
         			<div class="col-lg-5" style="background-color:gray">
	         			<div id="room1" class="carousel slide" data-ride="carousel">
				                 <!-- Indicators -->
				                 <ul class="carousel-indicators">
				                 	<li data-target="#room1" data-slide-to="0" class="active"></li>
				                 	<li data-target="#room1" data-slide-to="1"></li>
				                 	<li data-target="#room1" data-slide-to="2"></li>
				                 </ul>
				               
				                 <!-- The slideshow -->
				                 <div class="carousel-inner">
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
				                </a>
				                <a class="carousel-control-next" href="#room1" data-slide="next">
				                    <span class="carousel-control-next-icon"></span>
				                </a>
			         	</div>			            
		        	</div>
		        	<!-- 업소 정보 -->
					<div class="col-lg-7">
						<div class="row" id="info">								
							<div class="col-sm-12" id="info1">업소이름</div>
						</div>
						<div class="row" id="info">
							<div class="col-sm-12" id="info2">평점</div>			
						</div>	
						<div class="row" id="info">	
							<div class="col-sm-12" id="info2">최소인원~최대인원</div>								
						</div>	
						<div class="row" id="info">	
							<div class="col-sm-12" id="info2">입실시간 퇴실시간</div>							
						</div>	
						<div class="row" id="info">	
							<div class="col-sm-12" id="info2">조건</div>
						</div>
						<!-- 업소 관리 링크 -->	
						<div class="row" id="manageFrm">
							<div class="col-sm-3 btn btn-light" id="manage">객실관리</div>							
							<div class="col-sm-3 btn btn-light" id="manage">예약현황</div>
							<div class="col-sm-3 btn btn-light" id="manage">정보수정</div>
							<div class="col-sm-3 btn btn-light" id="manage">삭제</div>
						</div>														
					</div>
				</div>
				<div class="row">
					<div></div>
				</div>
			</div>	
		</div>
	</div>
	<aside class="col-sm-2 right" id="right">
	
	</aside>
</div>

<!-- footer -->
<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
</footer>

</body>
</html>