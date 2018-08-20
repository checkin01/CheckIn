<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 숙박 업소 리스트 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/showAccomodationList.js"></script>

<!-- daterangepicker-->
<script src="<%=request.getContextPath()%>/js/daterangepicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/daterangepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/showAccomodationList.css">
<!-- navermap api -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ve4ILimYsUbRNnlZeSVm&submodules=geocoder"></script>
<script type="text/javascript" src="/webapp/js/filter.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

</style>
<script>
	$(function() {
		//datetimepicker
		$('input[name="acheckinout"]').daterangepicker({
			opens : 'bottom auto',
			locale: {
			      format: 'YYYY/MM/DD'
			   }
		});
		$('input[name="bottom-checkinout"]').daterangepicker({
			opens : 'top auto',
			locale: {
			      format: 'YYYY/MM/DD'
			   }
		});
	
		
		$(".searchButton").click(function(){
			loadPage();
		});
		
		function loadPage(){
			var atype = $("#Atype").text();
			var asi = $("#asi").text();
			var agu = $("#agu").text();
			var asubway = $("#asubway").text();
			var checkinout = $('#acheckinout').val();
			var sorttype = $('#searchSort option:selected').attr('rel');
			var atheme = $('#hiddenOption').text();
			console.log(atype+' '+asi+' '+agu+' '+asubway+' '+sorttype+' '+atheme);
			var url = '/webapp/main/showAccoList?atype='+atype+'&checkinout='+checkinout+'&asortkey='+sorttype+'&agu='+agu+'&asubway='+asubway+"&atheme="+atheme+"&acurpage=${curpage}&aonepage=10";
			
			location.href=url;
		}
		
		$(window).scroll(function(){
			if($(window).scrollTop() == $(document).height() - $(window).height()){
		
				//ajax로 페이지가 수 체크한 후 에
				checkListCnt();
			}
		});
		
		//페이지 끝으로 가면 로딩 할 리스트가 있는지 DB에서 Select 쿼리를 통해 검사한다.
		function checkListCnt(){
			var atype = $("#Atype").text();
			var asi = $("#asi").text();
			var agu = $("#agu").text();
			var asubway = $("#asubway").text();
			var asortkey = $('#searchSort option:selected').attr('rel');
			var atheme = $('#hiddenOption').text();
			var checkinout = $('#acheckinout').val();
			
			var params = "atype="+atype+'&asortkey='+asortkey+'&agu='+agu+'&asubway='+asubway+"&atheme="+atheme+"&acurpage=${curpage}&aonepage=10";

			$.ajax({
				type : "get",
				url : "/webapp/main/getListCnt",
				data : params,
				dataType : 'json',
				contentType : 'applicaiton/json;charset=UTF-8',
				success : function(result) {
					var $result = $(result);
					if(result > 0 ){
						var curpage = ${curpage} +1;
					
						//페이지 리로딩
						var url = '/webapp/main/showAccoList?atype='+atype+'&checkinout='+checkinout+'&asortkey='+asortkey+'&agu='+agu+'&asubway='+asubway+"&atheme="+atheme+"&acurpage="+curpage+"&aonepage=10";
						location.href = url;
						
					}else{
						
					}

				},
				error : function(e) {
					console.log(e.responseText);
				}
			})
			
		}
	});
	
	function goRoomPage(a){
		var checkinout = $('#acheckinout').val();
		
		var url = "/webapp/main/room/showList?checkinout="+checkinout+"&a="+a;
		location.href = url;
		
	}
</script>
</head>
<body>
	<%@ include file="../topnav_member.jspf"%>
	<%@ include file="../locationModal.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left"></aside>

		<div class="col-sm-8 center" id="center">
			<!-- ===================================필터====================================== -->

			<div id="searchFilter">
				<!-- 검색 라벨 -->
				<div class="labels">
					<div class="label-item">숙박유형</div>
					<div class="label-item">지역(시)</div>
					<div class="label-item">체크인 체크아웃</div>
					<div class="label-item">검색</div>
				</div>

				<!-- 검색 필터 ------------------------------->
				<div id="searchForm">
					<!-- ------------숙박유형------------- -->
					<div class="filter-item dropdown">
						<button type="button" id="Atype" class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="atype">${type}</button>
						<div class="dropdown-menu border" >
							<a class="dropdown-item droptype-item" href="#">모텔</a> <a
								class="dropdown-item droptype-item" href="#">호텔</a> <a
								class="dropdown-item droptype-item" href="#">게스트하우스</a> <a
								class="dropdown-item droptype-item" href="#">펜션</a>
						</div>

					</div>
					<!-- ------------지역 filter------------- -->
					<div class="filter-item" id='selectedLocation' >
						<button id="locationText" class="btn btn-light showLocModal">
							<i class="fa fa-map-marker"></i> <span class="selectedSido" id="asi" name="asi">서울</span>
							<span class="selectedGu" id="agu" name="agu">${gu}</span> <span class="selectedSubway" name="asubway">${subway}</span>
						</button>
					</div>
					<!-- -------------------------- 체크인 체크아웃 --------------------------->
					<div class="filter-item">
						<input type="text" class="w3-border rounded btn btn-default" name="acheckinout" id="acheckinout" value="${checkinout}"/>
							<input type="hidden" name="acheckin" id="acheckin"/>
							<input type="hidden" name="acheckout" id="acheckout"/>
					</div>

					<div class="filter-item">
						<button id="searchButton" class="btn btn-default form-control searchButton">
							숙소검색 <i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				
			</div>
			<!-- ===================================필터 끝 ====================================== -->

			<!-- 정렬 ----------------------------------------------------------->
			<div class="border rounded" id="searchSort">
		
					<select id="searchSort" class="btn btn-light sort-item border" style="font-family:'Jua'; text-align:center">
						<option rel="writedate" name="writedate">등록일순</option> 
						<option rel='aminprice' name="aminprice">최저가격순</option> 
						<option rel='agrade' name="agrade">별점순</option>
					</select>
				<script>
					$(function(){
						//초기 로딩 시 sorting selector의 옵션을 선택하기 위한 javascript
						$("#searchSort").find("option").each(function() {
							 if($(this).attr('rel') == "${asorttype}") {
							  $(this).attr('selected','selected');
							}
						});
					
						$("#searchSort").change(function(){
							var sorttype = $('#searchSort option:selected').attr('rel');
						
							//change 조건으로 리스트 리로딩!
							var checkinout = $("#acheckinout").val();
								
							var atype = $('#Atype').text();
							var agu =  $("#agu").text();
							var asubway =$("#asubway").text();
							var url = '/webapp/main/showAccoList?atype='+atype+'&checkinout='+checkinout+'&asorttype='+sorttype+'&agu='+agu+'&asubway'+asubway;
						
							location.href=url;
													
						});
						
						
					});
				</script>
				<div id="thema" class="sort-item" style="font-family:'Jua'">
					<button class="btn btn-primary" data-toggle="modal" data-target="#themaModal">테마</button>
					<!-- 테마에 대한 정보를 이곳에 hidden 속성으로 숨겨 둔다 -->
				</div>
				
				<div class="theme-item" id="hiddenOption" style="font-family: 'Jua'; font-size: 0.9em; color: #aaa;" /></div>
			</div>

			<!-- 지도 --------------------------------------------------------->
			<div class="border rounded container" id="map"
				style="margin-top: 30px; height: 300px; border: 1px solid black; z-index: 1;">
				<div id="map" class="container" style="width: 100%; height: 280px;">
				</div>

			</div>
			
			<!-- ----------------------------------- 리스트-------------------------------------------- -->
			<div>
			<c:forEach items ="${list}" var = "item">
			<div class="row border list-item rounded">
				<!-- carousel : 업소 사진-->
				<div class="col-lg-5 container">
					<div id="room1" class="carousel slide img-slide"
						data-ride="carousel">

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${item.aimg1}" class="roomsImg">
							</div>
							<div class="carousel-item">
								<img src="${item.aimg2}" class="roomsImg">
							</div>
							<div class="carousel-item">
								<img src="${item.aimg3}" class="roomsImg">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#room1" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#room1" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<!-- 업소 정보 -->
				<div class="col-lg-7 container">
					<div class="row" id="info">
						<div class="col-sm-12" id="info1"><a href="javascript:goRoomPage('${item.a}')">${item.aname}</a></div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">평점 :
						 <c:if test='${item.agrade ==0}'>등록된 리뷰가 없습니다.</c:if>
						 <c:if test='${item.agrade !=0}'>${item.agrade}</c:if>
						 
						 </div>
					</div>
					
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">입실시간 퇴실시간 : ${item.acheckin} / ${item.acheckout}</div>
					</div>
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">테마 : ${item.atheme}</div>
					</div>
					<hr />
					<div class="row" id="info">
						<div class="col-sm-12" id="info2">가격 : ${item.aminprice } ~ ${item.amaxprice }</div>
					</div>
				</div>
			
			</div>
			</c:forEach>
		</div>
		<!-- 리스트 끝 -->
		</div>	
		
		<!-- center 끝 -->
		<aside class="col-sm-2 right" id="right" style="text-align: right">
			<%@ include file="rightside_nav.jspf"%>
		</aside>
	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;margin-bottom:40px">
		<%@ include file="../companyInfo.jspf"%>
	</footer>
	<%@ include file="footer_nav.jspf"%>
	<%@ include file="themeModal.jspf"%>
	</div>
</body>
<script>
	//--------------------------------------- naver map --------------------------------------/
	var map = new naver.maps.Map('map');
	var myaddress = '광양9길';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
	naver.maps.Service
			.geocode(
					{
						address : myaddress
					},
					function(status, response) {
						if (status !== naver.maps.Service.Status.OK) {
							return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
						}
						var result = response.result;
						// 검색 결과 갯수: result.total
						// 첫번째 결과 결과 주소: result.items[0].address
						// 첫번째 검색 결과 좌표: result.items[0].point.y,
						// result.items[0].point.x
						var myaddr = new naver.maps.Point(
								result.items[0].point.x,
								result.items[0].point.y);
						map.setCenter(myaddr); // 검색된 좌표로 지도 이동
						// 마커 표시
						var marker = new naver.maps.Marker({
							position : myaddr,
							map : map
						});
						// 마커 클릭 이벤트 처리
						naver.maps.Event.addListener(marker, "click", function(
								e) {
							if (infowindow.getMap()) {
								infowindow.close();
							} else {
								infowindow.open(map, marker);
							}
						});
						// 마크 클릭시 인포윈도우 오픈
						var infowindow = new naver.maps.InfoWindow(
								{
									content : '<h4> [업소이름]</h4>[평점 : ★★★★★]<br/>[전화번호 : 02-1111-1111]<br/> <img src="../img/accomodation/home1.jpg"></a>'
								});
					});
</script>
</html>