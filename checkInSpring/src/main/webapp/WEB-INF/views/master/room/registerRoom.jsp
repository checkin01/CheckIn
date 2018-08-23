<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../topnav_master.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In ! 객실 등록</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/registerRoom.js"></script> --%>
<style>
.error-text-box {
	color: red;
	font-size: 12pt
}
</style>
<script>

function getAtheme(){
	   var checkTheme = "";      

	   $("input:checkbox:checked").each(function(){
	       checkTheme += $(this).val()+" ";
	       //alert(checkTheme);
	   });
	   $("#rtheme").val(checkTheme);
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center" style="top: 50px">
			<!--  -->
			<div class="font1-small" style="padding: 20px 0;">
				<a href="/webapp/master/showMyGuestroomList">룸 관리 페이지</a>
			</div>
			<form id="dataform" class="form-horizontal font1-medium list-group" method="post" action="/webapp/master/tryAddGuestroomInfo" enctype="multipart/form-data">
				
				<!-- 룸 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-home"> <label for="type">객실 유형</label></i> <select class="form-control col-sm-5" id="typeSelector" name="rtype">
						<option>개인룸</option>
						<option>더블룸</option>
						<option>트윈룸</option>
					</select> <span class="error-text-box" id="rtypeMsg"></span>
				</div>

				<!-- 객실 명 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="rname">객실 명</label></i> <input class="form-control col-sm-5" id="rname" name="rname" type="text" /> <span class="error-text-box" id="rnameMsg"></span>
				</div>

				<!-- 객실 요금 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-won"> <label for="price">객실 요금</label></i> <input class="form-control col-sm-5" id="rprice" name="rprice" type="number" min="0" step="100" value="0" />(단위 : 원) <span
						class="error-text-box" id="priceMsg"></span>
				</div>

				<!-- 객실 최소, 최대 수용 인원  -->
				<div class="form-group row list-group-item">
					<i class="fa fa-group"> <label>예약 관련</label></i>
					<div>
						<div class="input-group">
							<span class="form-control col-sm-2">최소 수용 인원</span> <input class="form-control col-sm-3" id="rmin" name="rmin" type="number" value="0" min="0" max="99" /> <span class="error-text-box"
								id="minMsg"></span>
						</div>
						<div class="input-group">
							<span class="form-control col-sm-2">최대 수용 인원</span> <input class="form-control col-sm-3" id="rmax" name="rmax" type="number" value="0" min="0" max="99" /> <span class="error-text-box"
								id="maxMsg"></span>
						</div>
						<span class="error-text-box" id="minMaxMsg"></span>
					</div>
				</div>

				<!-- 침실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-bed"> <label for="bedroom">침실 갯수</label></i> <input class="form-control col-sm-5" id="rbedroom" name="rbedroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="bedroomMsg"></span>
				</div>

				<!-- 거실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="diningroom">거실 갯수</label></i> <input class="form-control col-sm-5" id="rdiningroom" name="rdiningroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="diningroomMsg"></span>
				</div>

				<!-- 화장실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-bathtub"> <label for="restroom">화장실 갯수</label></i> <input class="form-control col-sm-5" id="rrestroom" name="rrestroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="restroomMsg"></span>
				</div>

				<!-- 주방 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-cutlery"> <label for="kitchen">주방 갯수</label></i> <input class="form-control col-sm-5" id="rkitchen" name="rkitchen" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="kitchenMsg"></span>
				</div>

				<!-- 이미지 등록 -->
				<div class="list-group-item row">
					<i class="fa fa-file-image-o col-sm-4" style="font-size: 16px"> <label>이미지 등록(최대 3개) </label></i>
					<div class="form-group row">
						<input type="file" id="file1" name="filename1" class="file-control-form col-sm-4"> 
						<input type="file" id="file2" name="filename2" class="file-control-form col-sm-4"> 
						<input type="file" id="file3" name="filename3" class="file-control-form col-sm-4">
					</div>
				</div>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
					<i class="fa fa-check-square"> <label> 기타 정보</label></i>
					<input type="hidden" name="rtheme" id="rtheme" />
					<div class="form-group row">
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="스파"> <span class="col-sm-3">스파</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="애견"> <span class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="바베큐"> <span class="col-sm-3">바베큐</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="오션뷰"> <span class="col-sm-3">오션뷰</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="트윈베드"> <span class="col-sm-3">트윈베드</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="노래방"> <span class="col-sm-3">노래방</span>
							</div>
						</div>
						
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox" value="사우나"> <span class="col-sm-3">사우나</span>
							</div>
						</div>
					</div>
				</div>

				<!-- 등록 버튼 -->
				<div class="list-group-item row">
					<input type="reset" value="다시 쓰기" class="btn btn-success" /> <input type="submit" value="등록" class="btn btn-success" />
				</div>

			</form>
			
		</div>
		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>
<script>
$(function(){
	$("#rname").focusout(function(){
		rcheckRname();
	});
	
	$("#rprice").focusout(function(){
		rcheckPrice();
	});
	
	$("#rmin").focusout(function(){
		var result = checkMin();			
		if(result == true){				
			rcompareMaxMin();
		}
	});

	$("#rmax").focusout(function(){
		var result = checkMax();
		if(result == true) {
			rcompareMaxMin();
		}
	});		

	$("#rbedroom").focusout(function(){
		rcheckBedroom();
	});
	
	$("#rdiningroom").focusout(function(){
		rcheckDiningroom();
	});
	
	$("#rkitchen").focusout(function(){
		rcheckkitchen();
	});
	
	$("#rrestroom").focusout(function(){
		rcheckRestroom();
	});
});

function rcompareMaxMin(){
	var min = $("#rmin").val();
	var max = $("#rmax").val();
	var result = true;
	if(min=="" || min==null || max==""|| max==null) return false;
	if(min>max){
		msg = "최소 수용 인원이 최대 수용 인원을 초과할 수 없습니다."
		result = false;
		$("#minMaxMsg").html(msg);
	}else{
		$("#minMaxMsg").html("");
	}
}

function rcheckRname(){	
	//객실 명 검사		
	var rname = $("#rname").val();
	var reg = /^[a-zA-Z가-힣0-9]{1,20}$/;	
	var msg = "";
	var result = true;
	
	if(!reg.test(rname)){
		msg = "한글과 영문 대 소문자,숫자를 사용하세요(특수기호, 공백 사용 불가).";
		result = false;
	}
	
	if(rname=="" || rname == null){
		msg="필수정보입니다.";			
		result = false;
	}
	$("#rnameMsg").html(msg);
	return result;
}

function rcheckPrice(){
	//객실 요금 검사
	var price = $("#rprice").val();
	var reg = /^[0-9]{1,8}$/;	
	var msg = "";
	var result = true;
	
	if(!reg.test(price)){
		msg = "숫자를 사용하세요.";
		result = false;
	}
	if(price=="" || price == null){
		msg="필수정보입니다.";
		result = false;
	}		
	$("#priceMsg").html(msg);
	return result;
}

function rcheckMin(){
	//최소 수용인원 검사
	var min = $("#rmin").val();
	var msg = "";
	var result = true;
	
	if(min<=0){
		msg = "최소 수용 인원은 1명 이상이어야 합니다.";
		result = false;
	}

	if(min == "" || min == null){
		msg = "필수정보입니다.";
		result = false;
	}		
	$("#minMsg").html(msg);
	return result;
}

function rcheckMax(){
	//최대 수용인원 검사
	var msg = "";
	var max = $("#rmax").val();
	var result = true;

	if(max == "" || max == null){
		msg = "필수정보입니다.";
		result = false;
	}
	
	if(max<=0){
		msg = "최대 수용 인원은 1명 이상이어야 합니다.";
		result = false;
	}
	
	$("#maxMsg").html(msg);
	return result;
}

function rcheckBedroom(){
	//침실
	var bedroom = $("#rbedroom").val();
	var msg = "";
	var result = true;
	
	if(bedroom<0){
		msg = "0보다 작을 수 없습니다.";
		result = false;
	}
	if(bedroom=="" || bedroom == null){
		msg = "필수정보입니다.";
		result = false;
	}		
	$("#bedroomMsg").html(msg);
	return result;
}

function rcheckDiningroom(){
	//거실
	var diningroom = $("#rdiningroom").val();
	var msg = "";
	var result = true;
	
	if(diningroom<0){
		msg = "0보다 작을 수 없습니다.";
		result = false;
	}
	if(diningroom=="" || diningroom == null){
		msg = "필수정보입니다.";
		result = false;
	}		
	$("#diningroomMsg").html(msg);
	return result;
}

function rcheckKitchen(){
	//주방
	var kitchen = $("#rkitchen").val();
	var msg = "";
	var result = true;
	
	if(kitchen<0){
		msg = "0보다 작을 수 없습니다.";
		result = false;
	}
	if(kitchen=="" || kitchen == null){
		msg = "필수정보입니다.";
		result = false;
	}		
	$("#kitchenMsg").html(msg);
	return result;		
}
	
function rcheckRestroom(){
	//화장실
	var restroom = $("#rrestroom").val();
	var msg = "";
	var result = true;
	
	if(restroom<0){
		msg = "0보다 작을 수 없습니다.";
		result = false;
	}

	if(restroom=="" || restroom == null){
		msg = "필수정보입니다.";
		result = false;
	}
	$("#restroomMsg").html(msg);
	return result;	
}

$(function(){
	$("#dataform").submit(function(){
		
		var result = true;
		//alert("result="+result);
		result &= rcheckRname();
		result &= rcheckPrice();
		result &= rcheckMin();
		result &= rcheckMax();
		result &= rcheckBedroom();
		result &= rcheckDiningroom();
		result &= rcheckKitchen();
		result &= rcheckRestroom();
		//alert("result="+result);
		if(result == 1){
			getAtheme();
			return true;
		}
		else return false;
	});
});
</script>


</body>
</html>