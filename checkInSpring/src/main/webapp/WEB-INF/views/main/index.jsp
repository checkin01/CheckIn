<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Check in !</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/webapp/css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- daterangepicker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="/webapp/js/daterangepicker.js"></script>
<link rel="stylesheet"
	href="/webapp/css/daterangepicker.css" />

<script type="text/javascript"
	src="/webapp/js/filter.js"></script>
<script type="text/javascript"
	src="/webapp/js/index.js"></script>
<script>
	$(function(){
		ajax_recommendation();
		ajax_notice();
		$("input[name='daterange']").daterangepicker({
			opens : 'left'
			,locale: {
			      format: 'YYYY-MM-DD'
		    }
		});
		$("#ok").click(function(){
			whenClickSearchBtn();
			//location.href="/webapp/main/showAccoList";
		});
	});
	

	// ajax로 추천 받은 파일을 가져와서 img 뿌려주기
	function ajax_recommendation() {
		var asubway = $("#selectedSubway").text();
		var agu = $("#selectedGu").text();
		var params = "";
		if (asubway != "")
			params = "asubway=" + asubway;
		else if (agu != "")
			params = "agu=" + agu;
		
		$.ajax({
			type : "get",
			url : "/webapp/main/recommend",
			data : params,
			dataType : 'json',
			contentType : 'applicaiton/json;charset=UTF-8',
			success : function(result) {
				if(result != "" && result != null){
				$("#reco-header").css('visibility','visible');
				var $result = $(result);
					$result.each(function(i, val) {
						var tag;
						var aurl = "/webapp/main/room/showList?a="+val.a;
						var aimg = val.aimg1;
						if (i == 0){
							tag = $('#form1');
							 $('#form1').css('display','block');
						}else if (i == 1){
							tag = $('#form2');
							$('#form2').css('display','block');
						}else if (i == 2){
							tag = $('#form3');
							$('#form3').css('display','block');
						}
						// tag 값 변경하기
						$(tag).find('.agrade').text(val.agrade);
						$(tag).find('.aaddr').text(val.aaddr);
						$(tag).find('.aname').text(val.aname);
						$(tag).find('.aurl').attr('href', aurl);
						$(tag).find('.aimg').attr('src', aimg);
						$(tag).find('.a').text(val.a);
						$(tag).find('.atel').text(val.atel);
		
					});
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		})
	}
	function ajax_notice(){
		var params ='target=일반회원';
		$.ajax({
			type:'get',
			url:'/webapp/main/getpagenotice',
			dateType:'json',
			data:params,
			contentType:'application/json;charset=UTF-8',
			success:function(result){
			
				var $result = $(result);
				$result.each(function(i,v){
				
					if(i==0){
						//var contents = v.ncontent.split('\n');
						//var html = "";
						//contents.each(function(index,val){
			
						//	html+=val;
						//	html+='</br>';
						//});
						var tag = $("#noticeModal");
						$(tag).find(".modal-title").text(v.notitle);
						$(tag).find(".modal-body").html(v.ncontent);
						$(tag).modal('show');
					}
				})
				
			},error:function(e){
				console.log(e.responseText())
			}
		})
	}
	function whenClickSearchBtn(){
		
		var checkinout = $('#checkinout').val().split('-');
		var acheckin = checkinout[0].trim()+'-'+checkinout[1].trim()+'-'+checkinout[2].trim();
		var acheckout =  checkinout[3].trim()+'-'+checkinout[4].trim()+'-'+checkinout[5].trim();
		
		var atype = $('#selectedItem').text().split(' ')[1].trim();
		var agu =  $("#selectedGu").text();
		var asubway =$("#selectedSubway").text();
		var url = '/webapp/main/showAccoList?atype='+atype+'&checkinout='+$('#checkinout').val()+'&agu='+agu+'&asubway='+asubway;
		location.href = url;
	}


</script>
</head>
<body>

	<%@ include file="topnav_member.jspf"%>
	<%@ include file="locationModal.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div class="header" style="position: relative">
		<div class="paragrapgh container text w3-animate-left">
			<strong><span style="color: orange"> <i
					class="fa fa-check-square-o" style="font-size: 48px; color: orange"></i>Check
					In
			</span></strong> <span style="font-size: 0.7em;">에서 빠르고 쉽게 예약하세요 !</span>
		</div>
		<div class="filters container rounded w3-animate-left">
			<!-- 유형 filter -->
			<div class="filter-child rounded">
				<div>
					<label>유형</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="w3-dropdown-hover filter-main">
					<div id="selectedType" style="width: 100%">
						<div class=" filter-item" id="selectedItem">
							<i class="material-icons">business</i> 호텔
						</div>
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</div>
					<div class="w3-dropdown-content w3-bar-block border"
						style="width: 100%">
						<div class="w3-bar-item w3-button filter-item type-item"
							style="font-size: 17px;">
							<i class="material-icons">business</i> 호텔
						</div>
						<div class="w3-bar-item w3-button filter-item type-item"
							style="font-size: 17px;">
							<i class="material-icons">brightness_2</i> 모텔
						</div>
						<div class="w3-bar-item w3-button filter-item type-item"
							style="font-size: 17px;">
							<i class="material-icons">home</i> 펜션
						</div>
						<div class="w3-bar-item w3-button filter-item type-item"
							style="font-size: 17px;">
							<i class="material-icons">card_travel</i> 게스트하우스
						</div>
					</div>
				</div>
			</div>
			<!-- 
				모텔 유형 클릭 시 내부 html 변경 됨
			 -->
			<script>
				$(function() {
					$(".type-item").click(function() {
						var html = $(this).html();
						$("#selectedItem").html(html);
					});

				});
			</script>
			<!-- 유형 filter 끝 -->

			<!-- 지역 filter -->
			<div class="filter-child rounded">
				<div>
					<label>지역</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class="filter-main showLocModal">
					<div>
						<div class="filter-item" id='selectedLocation'>
							<i class="material-icons"> location_on</i><span
								class="selectedSido" id="selectedSido">서울</span> <span
								class="selectedGu" id="selectedGu" style="font-size: 0.7em">강남구</span>
							<span class="selectedSubway" id="selectedSubway"
								style="font-size: 0.7em"></span>
							<div>
								<i class="material-icons" style="margin: 0; padding: 0">keyboard_arrow_down</i>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- 지역 filter 끝 -->

			<!-- 체크인/체크아웃 filter -->
			<div class="filter-child rounded filter-checkinout">
				<div>
					<label> 날짜</label>
				</div>
				<!-- filter_item 부분 변경 -->
				<div class=" filter-main">
					<div class="filter-item">
						<i class="material-icons"> calendar_today</i> 
						<input class="rounded" name="daterange" id="checkinout" type="text">
						<div>
							<i class="material-icons">keyboard_arrow_down</i>
						</div>
					</div>
				</div>
			</div>
			<!-- 체크인 filter 끝 -->

			<!-- 검색 필터 -->
			<div class="filter-child  w3-green rounded" id="ok">
				<div>
					<label for="type"> 검색 </label>
				</div>
				<div class="filter-main">
					<div class="searchBtn w3-green">
						<div class="filter-item">
							<i class="material-icons">touch_app</i> 숙소 찾기
							<div>
								<i class="material-icons" style="color: green">keyboard_arrow_down</i>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="main" class="main row" style="position: relative;">
		<div class="col-lg-2"></div>
		<div id="center" class="col-lg-8 center"
			style="position: relative; margin: 50px 0;">
			<div id="reco-header" style="visibility:hidden">
				<!-- 리뷰 등록 순 -->
				<!-- First Photo Grid-->
				<div class="w3-row-padding"
					style="text-align: center; padding: 10px 0px; font-family: 'Jua'">
					<h2>여기는 어떠세요?</h2>
				</div>
				<br />
				<div class="w3-row-padding"
					style="text-align: center; padding: 20px;">
					<h5>
						<button class="btn btn-light showLocModal">
							<i class="fa fa-map-marker"></i> <span class="selectedSido">서울</span>
							<span class="selectedGu">강남구</span> <span class="selectedSubway"></span>
						</button>
						에서 평점이 가장 좋은 곳 이에요.
					</h5>
				</div>
			</div>
			
			<div class="w3-row-padding">

				<!-- test............ -->
				<div class="w3-third w3-container w3-margin-bottom" id="form1" style="display:none">
					<a class="aurl" href="">
					<img
						src="#" style="width: 100%"
						class="w3-hover-opacity aimg"></a>
					<div class="w3-container w3-white">
						<p class="aname"></p>
						<p class="aaddr"></p>

						<p class="grade">
							평점 : <span class="agrade"></span>
						</p>
					</div>
				</div>
				<!-- test............ -->


				<div class="w3-third w3-container w3-margin-bottom" id="form2" style="display:none">
					<img src="<%=request.getContextPath()%>/img/accomodation/home1.jpg"
						style="width: 100%" class="w3-hover-opacity">
					<div class="w3-container w3-white" id="2">
						<p class="name">
							<b></b>
						</p>
						<p class="addr"></p>

						<p class="grade">
							평점 : <span class="grade"></span>
						</p>
					</div>
				</div>
				<div class="w3-third w3-container" id="form3" style="display:none">
					<img src="#" style="width: 100%"
						class="w3-hover-opacity">
					<div class="w3-container w3-white" id="3">
						<p class="name">
							<b></b>
						</p>
						<p class="addr"></p>

						<p class="grade">
							평점 : <span class="grade">4.5</span>
						</p>
					</div>
				</div>
			</div>
			<br />
			<hr />


		</div>
		<div class="col-lg-2"></div>
	</div>

	<!-- footer -->
	<footer id="footer" class="footer"
		style="width: 100%; font-size: 0.8em; margin-top: 150px">
		<%@ include file="companyInfo.jspf"%>
	</footer>
<!-- notice를 위한 modal.... -->	
	<script>
</script>
<div class="modal" id="noticeModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h6 class="modal-title" id="notice-title"></h6>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="notice-body">

      </div>
    </div>
  </div>
</div>
</body>
</html>