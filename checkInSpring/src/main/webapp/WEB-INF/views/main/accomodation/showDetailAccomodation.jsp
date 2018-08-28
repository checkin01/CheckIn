<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 룸 상세 정보 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<link rel="stylesheet" href="/webapp/css/default.css" />
<link rel="stylesheet" href="/webapp/css/showDetailStyle.css">

<!-- daterangepicker-->
<!-- navermap api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ve4ILimYsUbRNnlZeSVm&submodules=geocoder"></script>

<script src="/webapp/js/daterangepicker.js"></script>
<!--  <script src="/webapp/js/showDetailAccomodation.js"></script> -->
<link rel="stylesheet" href="/webapp/css/daterangepicker.css">
<style>
.historyImg {
	width: 100%;
	height: 200px;
	padding: 0px;
}

.review-p {
	background: #fff;
}

label {
	font-size: 0.7;
}

#rooms {
	margin: 0;
	paddint: 0;
}

/* background:#34A853; */
.roomsImg {
	margin-top: 20px;
	width: 100%;
	height: 250px;
	padding: 0px;
}

.block {
	height: 20px;
}
</style>
<script>
var onepage = 1;
function whenclickbookingbtn(a,r){
	
var u = '${u}';
var checkinout =  $("#acheckinout").val();


if(u == null || u == ''){
	var result = confirm("로그인이 필요합니다. 로그인 페이지로 이동 하시겠습니까?",'Check in !');
	if(result == true){
		location.href="/webapp/main/login";
	}
}else{
	var bcheckin = $("#checkin").val();
	var bcheckout =  $("#checkout").val();
	
	if(bcheckin==bcheckout){
		alert("날짜를 지정해주세요");
		return false;
	}
	 
	var checkinout =  $("#checkin").val(); +" ~ " +  $("#checkout").val();
	var people = $("#people").val();
	var result = confirm(checkinout +" 날짜에  인원수 : "+ people+"\n\n 예약 하시겠습니까? 예를 누르면 예약 됩니다.");
		if(result == true){
			ajax_booking(a,r,checkinout,people,u);				
		}
	}
}

//예약 시도 ajax
function ajax_booking(a,r,checkinout, people,u){
	var bcheckin = $("#checkin").val();
	var bcheckout =  $("#checkout").val();
	
	var params = "a="+a+"&r="+r+"&bcheckin="+bcheckin+"&bcheckout="+bcheckout+"&bcount="+people+"&u="+u;

	$.ajax({
		type : "get",
		url : "/webapp/main/trybooking",
		data : params,
		dataType : 'json',
		contentType : 'applicaiton/json;charset=UTF-8',
		success : function(result) {
			if(result > 0){
				var isClickedOk = confirm("예약 되었습니다. 예약 확인 페이지로 이동하시겠습니까?");
				if(isClickedOk==true){
					location.href="/webapp/main/mypage/bookingList";
				}
				//page 이동.
			}else{
				alert("죄송합니다. 예약에 실패 했습니다. 잠시 후 다시 시도 해 주세요.");
			}
			
		},
		error : function(e) {
			console.log(e.responseText);
			alert("죄송합니다. 예약에 실패 했습니다. 잠시 후 다시 시도 해 주세요.");
		}
	})
	
}

//<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
//리뷰 클릭시
function whenClickReview(r) {
	
	var upScroll = "<strong><i class='fa fa-caret-down' style='font-size:20px'></i> 리뷰</strong>";
	var downScroll = "<strong><i class='fa fa-caret-up' style='font-size:20px'></i> 리뷰</strong>";
	
	
	if ($("#reviewStatus"+r).val() == 'up') {
		$('#vcurpage${vo.r}').val(1);
		ajax_totalPage(r);

		$("#showReview"+r).html(downScroll);
		$("#reviewStatus"+r).val('down');
		$("#review"+r).css("display", "block");
		
	} else if ($("#reviewStatus"+r).val() == "down") {
		
		$("#showReview"+r).html(upScroll);
		$("#reviewStatus"+r).val("up");
		$("#review"+r).css("display", "none");
		$("#review-more"+r).css("display", "none");

	}
}

function addrcurpage(r){
	$('#vcurpage'+r).val(Number($('#vcurpage'+r).val())+1);
}


//리뷰 총 개수 가져오기
function ajax_totalPage(r){
	var params = "r="+r;
	var vcurpage = $('#vcurpage'+r).val();
	$.ajax({
		type : "get",
		url : "/webapp/main/getReivewsCnt",
		data : params,
		dataType : 'json',
		contentType : 'applicaiton/json;charset=UTF-8',
		success : function(result) {
			
			ajax_review(r,vcurpage);
			if(result <= vcurpage){
				$("#review-more"+r).css("display","none");
			}else{
				$("#review-more"+r).css("display","block");
			}
			addrcurpage(r);
		},
		error : function(e) {
			console.log(e.responseText);
			alert("죄송합니다. 리뷰 불러오기에 실패 했습니다.");
		}
	})
}

function ajax_review(r,i){
	var params = "r="+r+"&vcurpage="+i+"&vonepage="+onepage;
	$.ajax({
		type : "get",
		url : "/webapp/main/getReivews",
		data : params,
		dataType : 'json',
		contentType : 'applicaiton/json;charset=UTF-8',
		success : function(result) {
			var $result = $(result);
			var reviewDiv =$("#review"+r);
			reviewDiv.html('');
			
			var totalpage;
			$result.each(function(i,val){
				var grade = val.vgrade;
				var uuid = val.uuid;
				var writedate = val.writedate;
				var content = val.vcontent;
				var img1 = val.vimg1;
				var html = '<div class="row" style="padding-left:20px; padding-right:20px">';
				html +='<p class="col-sm-4 review-p border">';
				html += '<label><i class="fa fa-thumbs-o-up"></i> 평점 : </label> <span class="grade">'+grade+'</span>';
				html +='</p><p class="col-sm-4 review-p border">';
				html +='<label><i class="fa fa-user"></i> 아이디 : </label><span class="uid">'+uuid+'</span>';
				html += '</p><p class="col-sm-4 review-p border">';
				html +='<label><i class="fa fa-calendar"></i> 날짜 : </label> <span class="writedate">'+writedate+'</span>';
				html +='</p></div><label><i class="fa fa-comments"></i> 내용 </label><div class="row" style="padding-left:20px; padding-right:20px">';	
				html +='<p class="col-sm-8 font1-small border review-p" class="content">'+content+'</p>';
				html +='<p class="col-sm-4">'
				html +='<img src="'+val.img+'"style="width: 100%; height: 150px" class="rounded vimg1"';
				html +='</p></div><hr/>';
				reviewDiv.append(html);
			});
			
	
		},
		error : function(e) {
			console.log(e.responseText);
			alert("죄송합니다. 리뷰 불러오기에 실패 했습니다.");
		}
	})

}

function whenClickAccor(id){
	var accor = document.getElementById(id);
	if(accor.className.indexOf("w3-hide") != -1){ //hide일때
		accor.className = accor.className.replace(" w3-hide"," w3-show");
	}else{
		accor.className = accor.className.replace(" w3-show"," w3-hide");
	}
}

function pageReload(a){
	var checkin = $("#checkin").val().replace(/-/gi,'/'); 
	var checkout = $("#checkout").val().replace(/-/gi,'/');
	
	checkinout = checkin+'-'+checkout;
	if(checkin==checkout){
		alert("날짜를 지정해주세요");
		return false;
	}
	alert(checkinout);
	var url = "/webapp/main/room/showList?checkinout="+checkinout+"&a="+a;
	location.href = url;
}
</script>

<c:set var="accmoVO" value="${accoVO}" />

</head>
<body>
	<%@ include file="../topnav_member.jspf"%>

	<div id="main" class="row main" style="top: 80px">

		<!-- 왼쪽 필터 부분 -->
		<aside class="left col-lg-3 font1-medium w3-container" id="left">
			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index: 3; width: 290px; padding:80px 10px 10px 10px;" id="mySidebar">
				<!-- 정보 -->
				<div class="w3-container w3-display-container w3-padding-16">
					<i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>

					<!-- 호텔 정보 -->
					<div style="position: relative; top: 20px">
						<p class="w3-col font2-medium">${accoVO.aname}</p>

						<p>
							<i class="fa fa-fw fa-clock-o"></i> Check In: After ${accoVO.acheckin}
						</p>
						<p>
							<i class="fa fa-fw fa-clock-o"></i> Check Out:  ${accoVO.acheckout}
						</p>
						<p>
							<i class="fa fa-fw fa-wifi"></i> <i class="fa-fw fa fa-support"></i> <i class="fa fa-automobile fa-fw"></i> <i class="material-icons">local_dining</i>
						</p>
						<p>
							<i class="material-icons">call</i><span id=tel> ${accoVO.atel}</span>
						</p>
						<hr />
						<div>
							<p>
								<i class="fa fa-calendar-check-o"> <label>체크인</label></i>
							</p>
							
							<input type="date" class="w3-input w3-border" name="checkin" id="checkin" value='${checkin}' min='${today}' /> <br />
							<p>
								<i class="fa fa-calendar-check-o"> <label>체크아웃</label></i>
							</p>
							
							
							<input type="date" class="w3-input w3-border" name="checkout" id="checkout" value='${checkout}' min ='${today}' /> <br />
							<p>
								<i class="fa fa-male"> <label>인원수</label></i>
							</p>
							<input class="w3-input w3-border" type="number" value="1" name="people" id="people" min="1" max="10"> <br />
							<p>
								<button class="w3-button w3-block w3-green w3-left-align" onclick="pageReload(${accoVO.a})">
									<i class="fa fa-search w3-margin-right"></i> Search availability
								</button>
							</p>
						</div>
					</div>
				</div>


			</nav>
		</aside>
		<!------------------------------ 필터 끝 ---------------------------------------------->

		<!------------------------------ 센터 부분 ---------------------------------------------->
		<div class="col-lg-8 center w3-container" id="center" style="padding-top: 30px">
			<!--========================== info ==================================-->
			<button onclick="whenClickAccor('ainfo')" class="w3-button w3-block w3-left-align w3-deep-orange  font1-medium">
				<strong>숙소 주의 사항</strong>
			</button>
			<div id="ainfo" class="border w3-show" data-ride="carousel" style="padding: 20px">
				<!-- 아이콘들 -->
				<div></div>

				<!-- 주의사항 -->
				<div>
					<p id="notice">${accoVO.anotice}</p>
				</div>
			</div>

			<!--=================================== 지도 보기  =========================================-->
			<button onclick="whenClickAccor('map')" class="w3-button w3-block w3-left-align w3-light-blue font1-medium">
				<strong>숙소 위치 보기</strong>
			</button>
			<div id="map" class="border w3-show" style="width: 100%; height: 300px;">
				<script>
					var map1 = new naver.maps.Map('map');
					var myaddress = ${accoVO.agil};// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
					naver.maps.Service
							.geocode(
									{
										address : myaddress
									},
									function(status, response) {

										if (status !== naver.maps.Service.Status.OK) {
											return alert(myaddress
													+ '의 검색 결과가 없거나 기타 네트워크 에러');
										}

										var result = response.result;

										// 검색 결과 갯수: result.total
										// 첫번째 결과 결과 주소: result.items[0].address
										// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
										var myaddr = new naver.maps.Point(
												result.items[0].point.x,
												result.items[0].point.y);

										map1.setCenter(myaddr); // 검색된 좌표로 지도 이동

										// 마커 표시
										var marker = new naver.maps.Marker({
											position : myaddr,
											map : map1
										});

										// 마커 클릭 이벤트 처리
										naver.maps.Event.addListener(marker,
												"click", function(e) {
													if (infowindow.getMap()) {
														infowindow.close();
													} else {
														infowindow.open(map1,
																marker);
													}
												});
										var contentString = [
												'<div>',
												'    <h3 style="text-align:center">${accomVO.aname}</h3>',
												'    <div style="text-align:center">[전화번호 : ${accomVO.atel}]</div>',
												'    <div style="text-align:center">[별점 : ★★★★☆]</div>',
												'    <img src="../img/accomodation/home1.jpg" width="200" height="100" style="padding:5px"/>',
												'</div>'

										].join('');
										// 마크 클릭시 인포윈도우 오픈
										var infowindow = new naver.maps.InfoWindow(
												{
													content : contentString,
													maxWidth : 200,
													backgroundColor : "#eee",
													borderColor : "#2db400",
													borderWidth : 5,
													anchorSize : new naver.maps.Size(
															30, 30),
													anchorSkew : true,
													anchorColor : "#eee",
													pixelOffset : new naver.maps.Point(
															20, -20)
												});
									});
				</script>
			</div>


			<!--  ========================== 룸들 정보 보기 시작 ========================== -->
			<button onclick="whenClickAccor('rooms')" class="w3-button w3-block w3-left-align w3-green font1-medium">
				<strong>방 정보 보기</strong>
			</button>
			<div class="border w3-show" id="rooms" style="padding: 20px">
				<!-- 룸 리스트 정보 시작 -->
				<c:forEach items ="${list}" var ="vo" varStatus="status">
				<input type="hidden" id="r" value="${vo.r}" />
				<input type="hidden" id="a" value="${vo.a}" />
				<div class="border row rounded" style="margin-top:20px">
					<!-- 이미지 DIV 시작 -->
					<div id="ImgDiv1" class="container carousel slide col-lg-4" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#room1" data-slide-to="0" class="active"></li>
							<li data-target="#room1" data-slide-to="1"></li>
							<li data-target="#room1" data-slide-to="2"></li>
						</ul>

						<!-- The slide show -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${vo.rimg1}" class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="${vo.rimg2}" class="roomsImg rounded">
							</div>
							<div class="carousel-item">
								<img src="${vo.rimg3}" class="roomsImg rounded">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#room1" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#room1" data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
					<!-- 이미지 DIV 끝 -->

					<!-- 정보 DIV 시작 -->
					<div class="container font1-medium col-lg-8" style="margin: 0px; padding: 10px 20px 0 20px">
						<h3 class="row">
							<span id="rname"><strong>${vo.rname}</strong></span>
						</h3>
						<h6 class="row">
							기준 <span id="min">${vo.rmin}</span>명 (최대 <span id="max">${vo.rmax}</span>명)
						</h6>
						<br />
						<div class="row">
							<p class="col-sm-3">
								<i class="fa fa-fw fa-bed"></i>침실 <span id="bedroom">${vo.rbedroom}</span>
							</p>
							<p class="col-sm-3">
								<i class="fa fa-fw fa-bath"></i>욕실 <span id="bathroom">${vo.rrestroom}</span>
							</p>
							<p class="col-sm-3">
								<i class="material-icons">event_seat</i>거실<span id="diningroom">${vo.rdiningroom}</span>
							</p>
							<p class="col-sm-3">
								<i class="material-icons">kitchen</i>주방 <span id="kitchen">${vo.rkitchen}</span>
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
								<i class="fa fa-fw fa-won"></i><span id="price">${vo.rprice}</span>
							</h4>

						</div>
						<br />

						<!-- 버튼 폼 시작 -->
						<div class="row">
							<div class="col-sm-5"></div>

							<div class="col-sm-4"></div>
						
								<c:if test="${bookingVO[status.index].wasBooking == 0 or bookingVO[status.index].cancel == 1 }">
									<input type="button" value="예약하기" class="btn form-control col-sm-3 btn-success" onclick="whenclickbookingbtn(${vo.a},${vo.r})"/>
								</c:if>
	
								<c:if test="${bookingVO[status.index].wasBooking > 0 and bookingVO[status.index].cancel != 1}">
								
									<input type="button" value="예약 완료" class="btn form-control col-sm-3 btn-success" disabled/>
								</c:if>
					
						</div>
						<!-- 버튼 폼 끝 -->
					
					</div>
					<!-- 정보 DIV 끝 -->
				<c:if test ="${vo.rgrade != null and vo.rgrade != 0}">		
					
					<!-- 리뷰 DIV 시작 -->
					<div style="width: 100%; padding: 10px;" id="reviewDiv${vo.r}">
						<input type="hidden" id="reviewStatus${vo.r}" value="up" />

						<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
						<div id="showReview${vo.r}" class="font1-medium btn btn-info" style="width: 100%; height: 30px" onclick="whenClickReview(${vo.r},1)">
							<strong><i class='fa fa-caret-down' style='font-size: 20px'></i> 리뷰</strong>
						</div>
						<!-- 결과 창 -->
						<div class="container input-group" id="review${vo.r}" style="display: none; padding-top:10px; background:lightgrey">
							
						</div>
						 <!-- 페이징 창 -->
						 <input type="hidden" value="1" id="vcurpage${vo.r}" />
						 <span class='btn btn-basic' id="review-more${vo.r}" onclick='ajax_totalPage(${vo.r})' style="display:none"> 더보기 </span>
						
					</div>
					<!-- 리뷰 DIV 끝 -->
					
				</c:if>
				</div>
				<!--리스트 한개 끝-->
				</c:forEach>
			</div>
		</div>
		<aside class="col-sm-2"></aside>
		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>
</body>
</html>