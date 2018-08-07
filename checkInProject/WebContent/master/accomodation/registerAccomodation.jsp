<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in! 숙박 업소 등록</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type='text/css'
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type='text/css' href="../css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<link rel="stylesheet" type='text/css'
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- script file -->
<script src="../js/accomodationForm.js"></script>

<!-- bootstrap-timepicki -->
<script type="text/javascript" src="../js/timepicki.js"></script>
<link rel="stylesheet" href="../css/timepicki.css">
<script>
$(function(){
	$("#searchAddr").click(function(){
		$('#searchAddr-modal').modal('show');
	});
});

</script>
<style>
.error-text-box {
	color: red;
	font-size: 12px;
}
</style>

</head>
<body>
	<%@ include file="../topnav_master.jspf"%>

	<!-- 본문은 left center right으로 나뉜다.-->

	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left">
				<%@ include file="../leftside_nav.jspf"%>
		</aside>
		<div class="col-sm-8 center" id="center" style="top: 50px">
			<!--  -->
			<div class="font1-small" style="padding: 20px 0">
				<span> 홈 > 관리 페이지 > 숙박 업소 등록 </span>
			</div>

			<!-- 
				form  
				숙박업소유형 : type
				숙박업소이름 : aname
				숙박업소도로면주소 : addr
				숙박업소 전화번호 : tel
				checkin/chechout 시간 HH:MM
				img1,img2,img3
				기타 정보 - info (checkbox)
				
			-->
			<form id="dataform" class="form-horizontal font1-medium list-group"
				method="post" action="writeOk.jsp" enctype="multipart/form-data">
				<input type="hidden" value="mid" id="mid" name="mid" />

				<!-- 숙박 업소 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-fort-awesome"> <label for="typeSelector">숙박
							업소 유형</label></i> <select class="form-control col-sm-5" id="typeSelector"
						name="">
						<option>호텔</option>
						<option>모텔</option>
						<option>펜션</option>
						<option>호스텔</option>
						<option>게스트하우스</option>
					</select> <span class="error-text-box" id="typeMsg"></span>
				</div>

				<!-- 숙박 업소 이름 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="aname">숙박 업소
							이름</label></i> <input class="form-control col-sm-5" maxlength="20" id="aname"
						name="aname" type="text" /> <span class="error-text-box"
						id="anameMsg"></span>
				</div>

				<!-- 숙박 업소 주소 검색 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-card-o"> <label>숙박 업소 도로명 주소</label></i>
					<div class="input-group">
						<input type="text" id="addr" name="addr"
							class="form-control col-sm-8" readonly />
						<button type="button" id="searchAddr" name="searchAddr"
							class="form-control btn btn-success col-sm-2">주소 검색</button>
						<span class="error-text-box" id="addrMsg"></span>
					</div>
				</div>

				<!-- 숙박 업소 전화번호 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-book"> <label>숙박 업소 전화번호</label></i> <input
						class="form-control col-sm-5" id="tel" name="tel" type="text"
						placeholder="예) 02-8888-7777" /> <span class="error-text-box"
						id="telMsg"></span>
				</div>

				<!-- 숙박 업소 체크인시간, 체크아웃시간  -->
				<!-- 필터 폼 생성 시 https://www.eyecon.ro/bootstrap-datepicker/# 사이트 데이터 픽커 사용 -->
				<!-- 필터 폼 생성 시 http://rwdb.kr/datepicker/ 사이트 데이터 픽커 사용 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>손님 체크인/체크아웃 시간</label></i>
					<div>
						<span class="input-group"> <span
							class="form-control col-sm-5">check in</span> <input
							class="form-control col-sm-6 timepicki-input " id="checkin"
							name="checkin" type="text" value="03:00 PM" /> <span
							class="error-text-box" id="checkinMsg"></span>
						</span> <span class="input-group"> <span
							class="form-control col-sm-5">check out</span> <input
							class="form-control col-sm-6 timepicki-input" id="checkout"
							name="checkout" type="text" value="12:00 AM" /> <span
							class="error-text-box" id="checkoutMsg"></span>
						</span>
					</div>
				</div>

				<!-- 숙박 업소 최대 머무를 수 있는 날짜, 최대 예약 가능한 날짜  -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>예약 관련</label></i>
					<div>
						<span class="input-group"> <span
							class="form-control col-sm-6">손님이 최대 머무를 수 있는 일수</span> <input
							class="form-control col-sm-6" id="maxsleepdate"
							name="maxsleepdate" type="number" value="30" /> <span
							class="error-text-box" id="maxsleepdateMsg"></span>
						</span> <span class="input-group"> <span
							class="form-control col-sm-6">손님이 최대 예약 할 수 있는 일수</span> <input
							class="form-control col-sm-6" id="maxreservedate"
							name="maxreservedate" type="number" value="30" /> <span
							class="error-text-box" id="maxreservedateMsg"></span>
						</span>
					</div>
				</div>
				<!-- 이미지 등록 -->
				<div class="list-group-item row">
					<p>
						<i class="fa fa-file-image-o col-sm-12" style="font-size: 16px">
							이미지 등록(최대 3개) </i>
					</p>
					<div class="form-group row">
						<input type="file" id="img1" class="file-control-form col-sm-12">
					</div>
					<div class="form-group row">
						<input type="file" id="img1" class="file-control-form col-sm-12">
					</div>
					<div class="form-group row">
						<input type="file" id="img1" class="file-control-form col-sm-12">
					</div>
				</div>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
					<i class="fa fa-check-square"> <label for="info"> 기타 정보</label></i>
					<div class="form-group row" id="info">
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="info" value="스파"> <span
									class="col-sm-3">스파</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="info" value="애견"> <span
									class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="info" value="복층"> <span
									class="col-sm-3">복층</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="info" value="바베큐"> <span
									class="col-sm-3">바베큐</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="info" value="오션뷰"> <span
									class="col-sm-3">오션뷰</span>
							</div>
						</div>

					</div>
				</div>
				<!-- notice 주의 사항들 textfield -->
				<div class="form-group row list-group-item">
					<i class="fa fa-plus-square"> <label for="notice"> 주의
							사항:</label></i>
					<textarea class="form-control col-sm-12" name="notice" id="notice"
						rows="5"></textarea>
				</div>

				<!-- 등록 버튼 -->
				<div class="list-group-item row">
					<input type="reset" value="다시 쓰기"
						class="btn btn-success form-control col-sm-3" /> <input
						type="button" value="돌아가기"
						class="btn btn-success form-control col-sm-3" /> <input
						type="submit" value="등록"
						class="btn btn-success form-control col-sm-3" />
				</div>
			</form>
			<!-- footer -->
			<footer class="row footer" id="footer">
				<div class="col-sm-12"></div>
			</footer>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<%@ include file="searchAddr.jspf"%>
</body>
</html>