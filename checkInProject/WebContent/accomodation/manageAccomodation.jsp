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
	.border{border-radius:10px}
 	#center{margin-top:30px; background:#d5f4e6}	
 	.info{border-bottom-style:none; background:white}
 	.info>div{font-size:1.5em; height:50px}
    .roomsImg {
      margin:20px auto;
      width:100%;
      height:350px;
      
    }
    #aname{folat:right; margin-top:40px; float:left; font-size:40px}
	#manageFrm{float:right; margin-top:50px}
	#manageFrm>.btn{text-align:center;}
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
	<div class="col-sm-8 center border" id="center">
		<div class="font2-large" id="aname">[업소이름] </div>
		<!-- 업소 관리 링크 -->	
		<div class="btn-group" id="manageFrm">
			<div class="btn btn-success btn-lg" id="roomManageBtn">객실관리</div>							
			<div class="btn btn-success btn-lg" id="bookingBtn">예약현황</div>
			<div class="btn btn-success btn-lg" id="infoEditBtn">정보수정</div>
		</div>	
		<div class="list-group reginfoFrm" style="margin-top:100px;">
			<div class="list-group-item" style="border-style:none; margin:0px; background:#d5f4e6">
				<div class="row">					
					         <!-- carousel : 업소 사진-->
         			<div class="col-lg-5 border" style="background:white">
	         			<div id="room1" class="carousel slide" data-ride="carousel" style="margin-top:15px; margin-left:0px; height:100%">
				                 <!-- Indicators -->
				                 <ul class="carousel-indicators">
				                 	<li data-target="#room1" data-slide-to="0" class="active"></li>
				                 	<li data-target="#room1" data-slide-to="1"></li>
				                 	<li data-target="#room1" data-slide-to="2"></li>
				                 </ul>
				               
				                 <!-- The slideshow -->
				                 <div class="carousel-inner" style="width:100%">
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
						<div class="row border info">
							<div class="col-lg-7" id="condition">업소유형 : </div>
							<div class="col-lg-5" id="aggrade">별점: ★★★★★</div>
						</div>
						<div class="row border info">
							<div class="col-lg-12" id="aggrade">주소 : </div>			
						</div>
						<div class="row border info">
							<div class="col-lg-12" id="aggrade">연락처 : 02-1111-1111</div>			
						</div>	
						<div class="row border info">	
							<div class="col-lg-12" id="enterTime1">입실시간 : </div>							
						</div>
						<div class="row border info">	
							<div class="col-lg-12" id="enterTime2">퇴실시간 : </div>							
						</div>	
						<div class="row border info">	
							<div class="col-sm-12" id="info2">기타(테마) : </div>
						</div>
						<div class="row border info" style="height:110px" >	
							<div class="col-sm-12" id="info2">주차, 스파, 풀, 복층</div>
						</div>													
					</div>
				</div>
			</div>	
		</div>
		<div class="btn btn-danger" id="deleteBtn" style="float:right; width:150px; margin:10px auto">삭제</div>
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