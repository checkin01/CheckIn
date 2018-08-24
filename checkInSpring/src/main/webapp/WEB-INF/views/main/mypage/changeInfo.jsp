<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in! 회원정보수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/accomodationForm.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">

<!-- bootstrap-timepicki -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/timepicki.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/timepicki.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<!-- 
   uid 아이디
   upwd 
   uname 
   tel 
   email 
   birth 앞자리 뒷자리한개 
   location 앞에만 
   info(체크박스) -->
<style>
/* .row {margin-right: 2px} */
/*=========================================================  */
body {
	background-color: #F5F5F5
}

/* 아래쪽 수정 버튼 가운데 정렬*/
#center {
	padding: 50px 40px;
	margin: 20px auto;
	background-color: #fff;
	width: 1000px;
	height: 1000px;
}

#changeMain form div label {
	font-weight: bold
}

#regFrm label, #regFrm input, #regFrm span {
	font-family: 'Jua';
	font-size: 1em;
	font-weigth: lighter;
	color: #111;
}
.error-text {
	font-size: 12px;
	color: red;
}
</style>
<script>

$(function(){
    var theme ='${vo.utheme}';
    var themeArr = theme.split(' ');
    //alert(themeArr.length);
    jQuery.each(themeArr,function(index,value){
       //체크 박스 처리
       if(value.trim() != ''){
             $(document).find('input[name='+value+']:checkbox').attr('checked','checked');
       }
    })
    
    $("#cancleBtn").click(function(){
    	location.href="/webapp/main/mypage/preModifyInfo"
    });
    
	//일반 회원 정보 수정 유효성 검사
	$("#editMemberFrm").submit(function() {		
		var result = true;
		result &=checkUpwd();		
		result &=checkUpwd2();							
		result &=checkUlocation();		
		
		if(result == 0) return false;
		else{
			getUtheme();
			alert("회원정보 수정이 성공적으로 완료되었습니다.");
			return true;
		}
	});
	
	$("#upwd").focusout(function(){
		checkUpwd();
	});
	$("#upwd2").focusout(function(){
		checkUpwd2();
	});
	
	$("#utel").focusout(function(){
		checkUtel();
	});		
});
//----------------------------정규식 체크---------------------------//
function checkUpwd(){
	var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-~])(?=.*[0-9]).{5,15}/;
	// 표현식
	//최소 1개의 숫자 혹은 특수 문자를 포함해야 함
	var data = $("#upwd").val();
	var msg = "";
	var result = true;
	
	if(!reg.test(data)){ // 정규표현식 검사 메소드 : true, false
		msg= "비밀번호는 최소 1개의 숫자 혹은 특수 문자를 포함한 5~15글자의 문자열입니다.";
		result = false;
	}
	
	if(data== null || data ==""){
		msg = "필수 정보 입니다.";
		result = false;
	}
	
	if(reg.test(data)) result=true;
	
	$("#upwdMsg").html(msg);
	return result;
}

function checkUpwd2(){
	var upwd = $("#upwd").val();
	var upwd2 = $("#upwd2").val();
	
	if (upwd!=upwd2 || upwd == "") {
		$("#upwd2Msg").html("비밀번호가 일치하지 않습니다.");
		return false;
	}
	$("#upwd2Msg").html("");
	return true;
}

function checkUlocation(){

	var data = $("#uaddr option:selected").val();
	
	console.log("select 체크"+data);
	
	if(data==null || data == ''){
		return false;
	}
	return true;
}

function getUtheme(){
	var checkTheme = "";		

	$("input:checked").each(function(){
 		checkTheme += $(this).val()+" ";
	});
	$("#utheme").val(checkTheme);
}
</script>
</head>
<body>
	<%@ include file="../topnav_member.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다.
-->

	<div id="main" class="row main">
		<!-- main -->
		<div class="col-sm-7 center font1-small" id="center">
			<!--  check box 추가 -->
			<!-- 홈 > 회원가입 -->
			<span class="font1-small">홈>마이페이지>회원정보수정</span>
			<hr />
			
			<div class="container" id="changeMain">
				<form method="post" id="editMemberFrm" class="form-horizontal" action="/webapp/main/tryModifyInfo">
					<div class="form-group row list-group-item">
						<label class="col-sm-2 ">아이디</label> <span class="col-sm-10">${vo.uuid }</span>
						<input type="hidden" id="uuid" name="uuid" value='${vo.uuid }'/>
					</div>
					
					<div class="form-group row list-group-item">
						<label class="col-sm-2">이름</label> <span class="col-sm-10">${vo.uname }</span>
					</div>
					
					<div class="form-group list-group-item row">
						<div class="form-group row col-sm-10">
							<label class="col-sm-2">연락처</label><input class="col-sm-4 form-control" type="text" id="utel" name="utel" value='${vo.utel }'/>
						</div>
					</div>
					
					<div class="form-group row list-group-item">
						<div class="col-sm-3">
							<label>비밀번호 변경</label>
						</div>
						<div class="col-sm-8">
							<div class="form-group row">
								<label class="col-sm-4">신규 비밀번호</label> <input type="password" name="upwd" id="upwd" class="form-control col-sm-6" />
							</div>
							<div class="row">
								<div class="col-sm-4"></div>
								<span id="upwdMsg" class="error-text"></span>
							</div>
							<div class="form-group row">
								<label class="col-sm-4">신규 비밀번호 확인</label> <input type="password" name="upwd2" id="upwd2" class="form-control col-sm-6" />
							</div>
							<div class="row">
								<div class="col-sm-4"></div>
								<span id="upwd2Msg" class="error-text"></span>
							</div>
						</div>
					</div>
					
					<div class="form-group row list-group-item">
						<label class="col-sm-3">생년월일</label> 
						<span class="col-sm-4">
							<c:set var="birth" value="${vo.birth }"/>
								<c:if test="${fn:substring(birth,0,2)>20 }">
									19${fn:substring(birth,0,2) }-${fn:substring(birth,2,4) }-${fn:substring(birth,4,6) }
								</c:if>
								<c:if test="${fn:substring(birth,0,2)<=20 }">
									20${fn:substring(birth,0,2) }-${fn:substring(birth,2,4) }-${fn:substring(birth,4,6) }
								</c:if>
						</span>
					</div>
					
					<div class="form-group row list-group-item">
						<input type="hidden" id="location" /> <label class="col-sm-3">지역</label>
						<select class="form-control col-sm-5" id="uaddr" name="uaddr" onchange='checkUlocation()'>
							<option value="서울" <c:if test="${vo.uaddr eq '서울'}">selected</c:if>>서울</option>
							<option value="경기" <c:if test="${vo.uaddr eq '경기'}">selected</c:if>>경기</option>
							<option value="인천" <c:if test="${vo.uaddr eq '인청'}">selected</c:if>>인천</option>
							<option value="강원" <c:if test="${vo.uaddr eq '강원'}">selected</c:if>>강원</option>
							<option value="부산" <c:if test="${vo.uaddr eq '부산'}">selected</c:if>>부산</option>
							<option value="경남" <c:if test="${vo.uaddr eq '경남'}">selected</c:if>>경남</option>
							<option value="대구" <c:if test="${vo.uaddr eq '대구'}">selected</c:if>>대구</option>
							<option value="경북" <c:if test="${vo.uaddr eq '경북'}">selected</c:if>>경북</option>
							<option value="울산" <c:if test="${vo.uaddr eq '울산'}">selected</c:if>>울산</option>
							<option value="대전" <c:if test="${vo.uaddr eq '대전'}">selected</c:if>>대전</option>
							<option value="광주" <c:if test="${vo.uaddr eq '광주'}">selected</c:if>>광주</option>
							<option value="전남" <c:if test="${vo.uaddr eq '전남'}">selected</c:if>>전남</option>
							<option value="전북" <c:if test="${vo.uaddr eq '전북'}">selected</c:if>>전북</option>
							<option value="제주" <c:if test="${vo.uaddr eq '제주'}">selected</c:if>>제주</option>
						</select>
					</div>					

					<!-- 기타 정보들.. checkbox -->
					<div class="list-group-item row">
						<i class="fa fa-check-square"> <label for="info">기타 정보</label></i>
						<input type="hidden" id="utheme" name="utheme"/>
						<div class="form-group row" id="info">
						
						<!-- 띄어쓰기를 기준으로 자르기 -->
						<c:set var="theme" value="${fn:split('${vo.utheme }',' ')}"/>
						
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
						</div>
					</div>
					<br />
					<center>
						<input type="button" id="cancleBtn" value="취소" class="btn btn-primary form-control col-sm-3" />
						<input type="submit" value="수정" class="btn btn-success form-control col-sm-3" />		
					</center>
				</form>
			</div>
		</div>
		<aside class="left" id="left"></aside>
		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 100px;">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>


</body>
</html>