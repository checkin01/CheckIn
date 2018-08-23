<%=request.getContextPath()%>/<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type='text/css'
	href="/webapp/css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<link rel="stylesheet" type='text/css'
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- script file -->
<script src="/webapp/js/accomodationForm.js"></script>

<script type="text/javascript">
	$(function() {
		var blankMsg = "필수 정보입니다.";
		var wrongMsg = "잘못 입력하셨습니다.";
		$("#searchAddr").click(function() {
			$('#searchAddr-modal').modal('show');
		});
		$("#aname").focusout(function() {
			checkAname();
		});
		$("#tel").focusout(function() {
			checkTel();
		});

		$("#maxsleepdate").focusout(function() {
			checkMaxsleepdate();
		});
		$("#maxreservedate").focusout(function() {
			checkMaxreservedate();
		});
	});

	function getAtheme() {
		var checkTheme = "";

		$("input:checkbox:checked").each(function() {
			checkTheme += $(this).val() + " ";
		});
		$("#atheme").val(checkTheme);
		console($("#atheme").val());
	}

	function whenClickSubmitBtn() {
		alert("submit");
		var result = true;
		result &= checkAname();
		alert(result);
		result &= checkTel();
		alert(result);
		result &= checkAddr();
		alert(result);
		result &= checkMaxsleepdate();
		alert(result);
		result &= checkMaxreservedate();
		alert(result);
		result &= checkCheckIn();
		alert(result);
		result &= checkCheckOut();
		alert(result);
		if (result == 0) {
			return false;
		} else {
			getAtheme();
			return true;
		}
	}

	function goJusoPopup() {
		var pop = window.open("/webapp/master/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		var sireg = /^[가-힣]+[시]{1}$/;
		var gureg = /^[가-힣]+[구]{1}$/;
		var gilreg = /^[가-힣]+[로]{1}([0-9]+[가-힣]?[길]{1}){0,1}$/;
		var dongreg = /^[\(]{1}[가-힣0-9]+[동]{1}[\)]{1}$/;
		var gunmul = /^[0-9]{0,3}([-]{1}[0-9]+){0,1}$/;
		var aaddr = roadAddrPart1.split(' ');
		console.log(aaddr[0] + " " + aaddr[1] + " " + aaddr[2] + " " + aaddr[3]
				+ aaddr[4]);

		if (aaddr[0] != '서울특별시') {
			alert('죄송합니다. 현재 서비스는 서울 숙박 업소만 지원 됩니다.');
		} else {
			$("#roadFullAddr").val(roadFullAddr);
			$("#roadAddrPart1").val(roadAddrPart1);
			$("#addrDetail").val(addrDetail);
			$("#a").val(zipNo.trim());
			$("#adong").val(roadAddrPart2);
			alert($("#a").val());
			$.each(aaddr, function(i, l) {
				
				if (l.match(sireg) != null) {
					console.log(l.match(sireg));
					$("#asi").val(l.match(sireg));
				}

				if (l.match(gureg) != null) {
					console.log(l.match(gureg));
					$("#agu").val(l.match(gureg));
				}

				if (l.match(gilreg) != null) {
					console.log(l.match(gilreg));
					$("#agil").val(l.match(gilreg)[0]);
				}

				//동 처리
				if (l.match(dongreg) != null) {
					console.log(l.match(dongreg));

				}
				//동 처리
				if (l.match(gunmul) != null) {
					console.log(l.match(dongreg));
					$("#agunmul").val(l.match(gunmul));
				}
			});
		}

	}
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

		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center" style="top: 50px">
			<!-- 이전 페이지로 이동  -->
			<div class="font1-small" style="padding: 20px 0">
				<a href="manageAccomodation.jsp">숙소 관리 페이지</a>
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
				method="post" onsubmit="return whenClickSubmitBtn()"
				action="/webapp/master/insertOkAcco" enctype="multipart/form-data">
				<input type="hidden" value="${mid}" id="mid" name="mid" />
				<!-- 주소 관련 hidden form -->

				<input type="hidden" id="a" name="a" /> 
				<input type="hidden" id="asi" name="asi" /> 
					<input type="hidden" id="agu" name="agu" />
				<input type="hidden" id="agil" name="agil" /> 
				<input type="hidden"
					id="adong" name="adong" /> 
					<input type="hidden" id="agunmul"
					name="agunmul" />

				<!-- 숙박 업소 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-fort-awesome"> <label for="typeSelector">숙박
							업소 유형</label></i> <select class="form-control col-sm-5" id="typeSelector"
						name="atype">
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
						<input type="text" id="roadFullAddr" name="aaddr"
							class="form-control col-sm-8" readonly />
						<button type="button" name="searchAddr"
							class="form-control btn btn-success col-sm-2"
							onclick="goJusoPopup()">주소 검색</button>
						<span class="error-text-box" id="addrMsg"></span>
					</div>
				</div>
					
				<!-- 인근 지하철 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-fort-awesome"> <label for="#subwaySelector">인근 지하철 </label></i> 
					<select class="form-control col-sm-5" id="subwaySelector"
						name="asubway">
						<option class="">강남/역삼/삼성/논현</option>
						<option class="">서초/신사/방배역</option>
						<option class="">동묘/신설동/청량리/회기</option>
						<option class="">장안동/답십리</option>
						<option class="">신림/서울대/사당/금천/동작</option>
						<option class="">신촌/홍대/합정</option>
						<option class="">강서/화곡/까치산/양천</option>
						<option class="">수유/미아</option>
						<option class="">잠실/신천</option>
						<option class="">신촌/홍대/합정</option>
						<option class="">동묘/신설동/청량리/회기</option>
						<option class="">연신내/불광/응암</option>
						<option class="">상봉/중랑/면목</option>
						<option class="">태릉/노원/도봉/창동</option>
						<option class="">종로(3,5가)/혜화</option>
						<option class="">동대문/충무로/신당/약수/금호</option>
						<option class="">성신여대/성북/월곡</option>
						<option class="">왕십리/성수/강변</option>
						<option class="">건대/군자/구의</option>
						<option class="">이태원/삼각지/용산/서울/명동/회현</option>
					</select>
				</div>

				<!-- 숙박 업소 전화번호 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-book"> <label>숙박 업소 전화번호</label></i> <input
						class="form-control col-sm-5" id="tel" name="atel" type="text"
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
							class="form-control col-sm-6 " name="acheckin" type="time"
							id="acheckin" value="13:00" /> <span class="error-text-box"
							id="checkinMsg"></span>
						</span> <span class="input-group"> <span
							class="form-control col-sm-5">check out</span> <input
							class="form-control col-sm-6 " name="acheckout" type="time"
							id="acheckin" value="15:00" /> <span class="error-text-box"
							id="checkoutMsg"></span>
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
							name="amaxsleepdate" type="number" value="30" /> <span
							class="error-text-box" id="maxsleepdateMsg"></span>
						</span> <span class="input-group"> <span
							class="form-control col-sm-6">손님이 최대 예약 할 수 있는 일수</span> <input
							class="form-control col-sm-6" id="maxreservedate"
							name="amaxreservedate" type="number" value="30" /> <span
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
						<input type="file" id="img1" name="filename1"
							class="file-control-form col-sm-12">
					</div>
					<div class="form-group row">
						<input type="file" id="img1" name="filename2"
							class="file-control-form col-sm-12">
					</div>
					<div class="form-group row">
						<input type="file" id="img1" name="filename3"
							class="file-control-form col-sm-12">
					</div>
				</div>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
					<input name="atheme" id="atheme" type="hidden" /> <i
						class="fa fa-check-square"> <label for="info"> 기타 정보</label></i>
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
					<i class="fa fa-plus-square"> <label for="anotice"> 주의
							사항:</label></i>
					<textarea class="form-control col-sm-12" name="anotice" id="notice"
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
		<!-- footer -->
		<footer id="footer" class="footer"
			style="width: 100%; font-size: 0.8em; margin-top: 150px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>

</body>
</html>