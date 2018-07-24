<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap-timepicker -->
<script type="text/javascript" src="../js/bootstrap-timepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-timepicker.min.css">
</head>
<script>
	//has-warnig, has-error, has-success
	
</script>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-3" id="left"></aside>
		<div class="col-sm-7 center" id="center" style="top: 50px">
			<!--  -->
			<div class="font1-small" style="padding: 20px 0">
				<span> 홈 > 관리 페이지 > 숙박 업소 수정 </span>
			</div>

			<form id="dataform" class="form-horizontal font1-medium list-group"
				method="post" action="writeOk.jsp" enctype="multipart/form-data">
				<input type="hidden" id="mid" name="mid" />
			
				<!-- 비밀번호 -->
				<div class="form-group row list-group-item">
					<label>비밀번호</label>
					<input type="password" class="form-control col-sm-5"  id="mpwd" name="mpwd" placeholder="비밀번호를 입력하세요." />
				</div>
		

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
					</select>
				</div>

				<!-- 숙박 업소 이름 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="aname">숙박 업소
							이름</label></i> <input class="form-control col-sm-5" id="aname" name="aname"
						type="text" />
				</div>

				<!-- 숙박 업소 주소 검색 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-card-o"> <label>숙박 업소 도로명 주소</label></i>
					<div class="input-group">
						<input type="text" id="addr" name="addr"
							class="form-control col-sm-8" disabled />
						<button type="button" id="searchAddr" name="searchAddr"
							class="form-control btn btn-success col-sm-2">주소 검색</button>
					</div>
				</div>

				<!-- 숙박 업소 전화번호 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-book"> <label>숙박 업소 전화번호</label></i> <input
						class="form-control col-sm-5" id="tel" name="tel" type="text"
						placeholder="예) 010-8888-7777" />
				</div>

				<!-- 숙박 업소 체크인시간, 체크아웃시간  -->
				<!-- 필터 폼 생성 시 https://www.eyecon.ro/bootstrap-datepicker/# 사이트 데이터 픽커 사용 -->
				<!-- 필터 폼 생성 시 http://rwdb.kr/datepicker/ 사이트 데이터 픽커 사용 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>손님 체크인/체크아웃 시간</label></i>
					<div>
						<span class="input-group bootstrap-timepicker col-sm-6"> <span
							class="form-control  col-sm-5">check in</span> <input
							class="form-control timepicker col-sm-7" id="checkin"
							name="checkin" type="text" /> <script type="text/javascript">
								$('.timepicker').timepicker();
							</script>
						</span> <span class="input-group bootstrap-timepicker col-sm-6"> <span
							class="form-control col-sm-5">check out</span> <input
							class="form-control timepicker col-sm-7" id="checkout"
							name="checkout" type="text" /> <script type="text/javascript">
								$('.timepicker').timepicker();
							</script>
						</span>
					</div>
				</div>

				<!-- 숙박 업소 최대 머무를 수 있는 날짜, 최대 예약 가능한 날짜  -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>예약 관련</label></i>
					<div>
						<span class="input-group"> 
						<span class="form-control col-sm-5">손님이 최대 머무를 수 있는 일수</span> 
							<input class="form-control col-sm-2" id="maxsleepdate"name="maxsleepdate" type="number" min="1" />
						</span> 
						<span class="input-group"> 
						<span class="form-control col-sm-5">손님이 최대 예약 할 수 있는 일수</span> 
						<input class="form-control col-sm-2" id="maxreservedate" name="maxreservedate" type="number" min="1" />
						</span>
					</div>
				</div>
				<!-- 이미지 등록 -->
				<div class="list-group-item row">
					<i class="fa fa-file-image-o col-sm-4" style="font-size: 16px">
						<label>이미지 등록(최대 3개) </label>
					</i>
					<div class="form-group row">
						<input type="file" id="img1" class="file-control-form col-sm-4">
						<input type="file" id="img2" class="file-control-form col-sm-4">
						<input type="file" id="img3" class="file-control-form col-sm-4">
						<script>
							
						</script>
					</div>
				</div>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
					<i class="fa fa-check-square"> <label for="info"> 기타 정보</label></i>
					<div class="form-group row" id="info">
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">스파</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">바베큐</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">오션뷰</span>
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
						type="submit" value="파일 등록"
						class="btn btn-success form-control col-sm-3" />
				</div>
			</form>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
</body>
</html>