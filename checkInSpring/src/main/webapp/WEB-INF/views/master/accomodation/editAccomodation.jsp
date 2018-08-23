<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in! 숙박 업소 정보 수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webapp/css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- script file -->
<script src="/webapp/js/accomodationForm.js"></script>

<!-- bootstrap-timepicki -->
<script type="text/javascript" src="/webapp/js/timepicki.js"></script>
<link rel="stylesheet" href="/webapp/css/timepicki.css">
<c:set var="vo" value='${accoVO}' />
<style>
.error-text-box {
	color: red;
	font-size: 12px;
}
</style>
<script>
	$(function(){
		var blankMsg = "필수 정보입니다.";
		var wrongMsg = "잘못 입력하셨습니다.";
		var options = $(document).find('option');
		var type = '${vo.atype}';
		$(document).find('option[name='+type+']').attr('selected','selected');
		
		var subway = '${vo.asubway}';
		$(document).find('option[name='+subway+']').attr('selected','selected');
		
		var theme ='${vo.atheme}';
		
		if(theme != null && theme!=''){
			var themeArr = theme.split(' ');
			jQuery.each(themeArr,function(index,value){
				//체크 박스 처리
				
				if(value.trim() != ''){
				$(document).find('input[name='+value+']:checkbox').attr('checked','checked');
				}
			})
		}
		$("#aname").focusout(function(){
			checkAname();
		});
		$("#tel").focusout(function(){
			checkTel();
		});
		
		$("#maxsleepdate").focusout(function(){
			checkMaxsleepdate();
		});
		$("#maxreservedate").focusout(function(){
			checkMaxreservedate();
		});
		
	});
	
	function getAtheme(){
		var checkTheme = "";
		
		$("input:checkbox:checked").each(function(){
	 		checkTheme += $(this).val()+" ";
		});
		$("#atheme").val(checkTheme);
		console($("#atheme").val());
	}

	function whenClickSubmitBtn(){
		console.log("submit 이벤트 발생 ....");
		var result = true;
		result &= checkAname();
		result &= checkTel();
		result &= checkAddr();
		result &= checkMaxsleepdate();
		result &= checkMaxreservedate();
		result &= checkCheckIn();
		result &= checkCheckOut();
		if(result==0)return false;
		else {
			getAtheme();
			return true;
		}
	}
</script>
<body>

	<%@ include file="../topnav_master.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left">
	
		</aside>
		<div class="col-sm-8 center" id="center" style="top: 50px">
			
			<ul class="nav btn-group" >
				
				  <!-- 숙소 정보 있을 때 -->
				 
				  <li class="nav-item btn btn-primary ">
				    <a class="nav-link w3-text-black w3-large" href="/webapp/master/viewAcco?a=${vo.a}"><b>숙소  보기</b></a>
				  </li>
				  <li class="nav-item btn btn-primary">
				    <a class="nav-link w3-text-white w3-large active"  href="/webapp/master/editAcco?a=${vo.a}"><b>숙소 정보 수정</b></a>
				  </li>
				   <li class="nav-item btn btn-primary">
				    <a class="nav-link w3-text-black w3-large"  href="#"><b>숙소 정보 삭제</b></a>
				  </li>
				
				</ul>
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
			<form id="dataform" class="form-horizontal font1-medium w3-card-4 w3-bar" style="margin-top:50px; padding:20px" method="post" onsubmit="return whenClickSubmitBtn()" action="/webapp/master/editOkAcco" enctype="multipart/form-data">
				<input type="hidden" value="${vo.mid}" id="mid" name="mid" />
				<input type="hidden" value="${vo.a}" id="a" name="a" />
				<!-- 숙박 업소 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-fort-awesome"> <label for="typeSelector">숙박 업소 유형</label></i> 
					<select class="form-control col-sm-5" id="typeSelector" name="atype">
						<option name='호텔'>호텔</option>
						<option name='모텔'>모텔</option>
						<option name='펜션'>펜션</option>
						<option name='호스텔'>호스텔</option>
						<option name='게스트하우스'>게스트하우스</option>
					</select> <span class="error-text-box" id="typeMsg"></span>
				</div>

				<!-- 숙박 업소 이름 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="aname">숙박 업소 이름</label></i> 
					<input class="form-control col-sm-5" maxlength="20" id="aname" name="aname" type="text" value="${vo.aname}" /> <span class="error-text-box"
						id="anameMsg"></span>
				</div>

				<!-- 숙박 업소 주소 검색 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-card-o"> <label>숙박 업소 도로명 주소</label></i>
					<div class="input-group">
						<input type="text" id="addr" name="aaddr" class="form-control col-sm-8" value="${vo.aaddr}" readonly />
						<button type="button" id="searchAddr" name="searchAddr" class="form-control btn btn-success col-sm-2">주소 검색</button>
						<span class="error-text-box" id="addrMsg"></span>
					</div>
				</div>
				
					<!-- 인근 지하철 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-fort-awesome"> <label for="#subwaySelector">인근 지하철 </label></i> 
					<select class="form-control col-sm-5" id="subwaySelector"
						name="asubway">
						<option name="강남/역삼/삼성/논현">강남/역삼/삼성/논현</option>
						<option name="서초/신사/방배역">서초/신사/방배역</option>
						<option name="동묘/신설동/청량리/회기">동묘/신설동/청량리/회기</option>
						<option name="장안동/답십리">장안동/답십리</option>
						<option name="신림/서울대/사당/금천/동작">신림/서울대/사당/금천/동작</option>
						<option name="신촌/홍대/합정">신촌/홍대/합정</option>
						<option name="강서/화곡/까치산/양천">강서/화곡/까치산/양천</option>
						<option name="수유/미아">수유/미아</option>
						<option name="잠실/신천">잠실/신천</option>
						<option name="신촌/홍대/합정">신촌/홍대/합정</option>
						<option name="동묘/신설동/청량리/회기">동묘/신설동/청량리/회기</option>
						<option name="연신내/불광/응암">연신내/불광/응암</option>
						<option name="상봉/중랑/면목">상봉/중랑/면목</option>
						<option name="태릉/노원/도봉/창동">태릉/노원/도봉/창동</option>
						<option name="종로(3,5가)/혜화">종로(3,5가)/혜화</option>
						<option name="동대문/충무로/신당/약수/금호">동대문/충무로/신당/약수/금호</option>
						<option name="성신여대/성북/월곡">성신여대/성북/월곡</option>
						<option name="왕십리/성수/강변">왕십리/성수/강변</option>
						<option name="건대/군자/구의">건대/군자/구의</option>
						<option name="이태원/삼각지/용산/서울/명동/회현">이태원/삼각지/용산/서울/명동/회현</option>
					</select>
				</div>

				<!-- 숙박 업소 전화번호 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-address-book"> <label>숙박 업소 전화번호</label></i> 
					<input class="form-control col-sm-5" id="tel" name="atel" type="text" placeholder="예) 02-8888-7777"  value="${vo.atel}"/> 
					<span class="error-text-box"
						id="telMsg"></span>
				</div>

				<!-- 숙박 업소 체크인시간, 체크아웃시간  -->
				<!-- 필터 폼 생성 시 https://www.eyecon.ro/bootstrap-datepicker/# 사이트 데이터 픽커 사용 -->
				<!-- 필터 폼 생성 시 http://rwdb.kr/datepicker/ 사이트 데이터 픽커 사용 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>손님 체크인/체크아웃 시간</label></i>
					<div>
						<span class="input-group"> <span class="form-control col-sm-5">check in</span> 
						<input class="form-control col-sm-6 " name="acheckin" type="time" id="acheckin"
							value="${vo.acheckin}" /> 
							<span class="error-text-box" id="checkinMsg"></span>
						</span> <span class="input-group"> <span class="form-control col-sm-5">check out</span> 
						<input class="form-control col-sm-6" name="acheckout" id = "acheckout" type="time" value="${vo.acheckout}" />
						
						<span class="error-text-box" id="checkoutMsg"></span>
						</span>

					</div>
				</div>
				<!-- 숙박 업소 최대 머무를 수 있는 날짜, 최대 예약 가능한 날짜  -->
				<div class="form-group row list-group-item">
					<i class="fa fa-clock-o"> <label>예약 관련</label></i>
					<div>
						<span class="input-group"> <span class="form-control col-sm-6">손님이 최대 머무를 수 있는 일수</span> <input class="form-control col-sm-6" id="maxsleepdate" name="amaxsleepdate" type="number"
							value="${vo.amaxsleepdate}" /> <span class="error-text-box" id="maxsleepdateMsg"></span>
						</span> <span class="input-group"> <span class="form-control col-sm-6">손님이 최대 예약 할 수 있는 일수</span> <input class="form-control col-sm-6" id="maxreservedate" name="amaxreservedate" type="number"
							value="${vo.amaxreservedate}" /> <span class="error-text-box" id="maxreservedateMsg"></span>
						</span>
					</div>
				</div>
				<!-- 이미지 등록 -->
				<div class="list-group-item row">
					<p>
						<i class="fa fa-file-image-o col-sm-12" style="font-size: 16px"> 이미지 등록(최대 3개) </i>
					</p>
					<div class="form-group row">
						<span id="imgTextSpan1"><input name = "aimg1" value='${vo.aimg1}' readonly/><span class="btn text-muted btn-light" onclick="whenclickimgbtn(1)">수정</span></span>
						<span id="fileSpan1" style="display:none"><input type="file" name="filename1"  class="file-control-form col-sm-12" ></span>
					</div>
					<div class="form-group row">
						<span id="imgTextSpan2"><input name = "aimg2" value='${vo.aimg2}' readonly/><span class="btn text-muted btn-light"  onclick="whenclickimgbtn(2)">수정</span></span>
						<span id="fileSpan2" style="display:none"><input type="file" name="filename2"  class="file-control-form col-sm-12"></span>
					</div>
					<div class="form-group row">
						<span id="imgTextSpan3"><input name = "aimg3" value='${vo.aimg3}' readonly/><span class="btn text-muted btn-light" onclick="whenclickimgbtn(3)">수정</span></span>
						<span id="fileSpan3" style="display:none"><input type="file" name="filename3"  class="file-control-form col-sm-12" ></span>
					</div>
				</div>
				<script>
					function whenclickimgbtn(i){
						$('#imgTextSpan'+i).css('display','none');
						$('#fileSpan'+i).css('display','block');
						
					}	
				
				</script>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
				<input name="atheme" id="atheme" type="hidden"/>
					<i class="fa fa-check-square"> <label for="info"> 기타 정보</label></i>
					<div class="form-group row" id="info">
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="스파" value="스파"> <span class="col-sm-3">스파</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="애견" value="애견"> <span class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="복층" value="복층"> <span class="col-sm-3">복층</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="바베큐" value="바베큐"> <span class="col-sm-3">바베큐</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="오션뷰" value="오션뷰"> <span class="col-sm-3">오션뷰</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="주차가능" value="주차가능"> <span class="col-sm-3">주차가능</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="게임" value="게임"> <span class="col-sm-3">게임</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="노천탕" value="노천탕"> <span class="col-sm-3">노천탕</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="노래방" value="노래방"> <span class="col-sm-3">노래방</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="수영장" value="수영장"> <span class="col-sm-3">수영장</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="찜질방" value="찜질방"> <span class="col-sm-3">찜질방</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" name="사우나" value="사우나"> <span class="col-sm-3">사우나</span>
							</div>
						</div>
						
					</div>
				</div>
				<!-- notice 주의 사항들 textfield -->
				<div class="form-group row list-group-item">
					<i class="fa fa-plus-square"> <label for="notice"> 주의 사항:</label></i>
					<textarea class="form-control col-sm-12" name="anotice" id="notice" rows="5">${vo.anotice}</textarea>
				</div>

				<!-- 등록 버튼 -->
				<div class="list-group-item row">
					<input type="reset" value="다시 쓰기" class="btn btn-success form-control col-sm-3" />
					 <input type="reset" value="취소" class="btn btn-success form-control col-sm-3" /> 
					 <input type="submit" value="수정" class="btn btn-success form-control col-sm-3" />
				</div>
			</form>
			
			<!-- footer -->
			<footer class="row footer" id="footer">
				<div class="col-sm-12"></div>
			</footer>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
		
	</div>
	
</body>
</html>