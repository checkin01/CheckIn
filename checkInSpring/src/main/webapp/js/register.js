$(function() {
	// 회원가입 일반 회원 유효성 검사
	$("#regFrmMember").submit(function() {

		var result = true;
		result &=wasCheckid();
		result &=checkUid();
		result &=checkUname();

		result &=checkUpwd();

		result &=checkUpwd2();
	
		result &=checkEmail();

		result &=checkTel();

		result &=checkBirth();

		result &=checkLocation();

		
		if(result == 0) return false;
		else return true;
	});
	$("#regFrmMaster").submit(function() {
		var result = true;
		result &=wasCheckid();
		result &=checkUid();
		result &=checkUname();
		result &=checkUpwd();
		result &=checkUpwd2();
		result &=checkEmail();
		result &=checkTel();
	
		if(result == 0) return false;
		else return true;
	});
	
	$("#uid").focusout(function(){
		checkUid();
	});
	$("#upwd").focusout(function(){
		checkUpwd();
	});
	$("#upwd2").focusout(function(){
		checkUpwd2();
	});
	$("#uname").focusout(function(){
		checkUname();
	});
	$("#tel").focusout(function(){
		checkTel();
	});
	
	$("#email").focusout(function(){
		checkEmail();
	});
});

function whenClickRadioBtn(){
	 var radioVal = $('input[name="radioTxt"]:checked').val();
	 
}

function whenClickIdChk(){
	// 파일명,창이름,옵션(width,height,scrolling, )
	window.open("../member/idChkWin.jsp?userid=" + $("#userid").val(), "win", "width=400,height=300");
}

function whenFocusId(){
	// 아이디중복 검사후 수정시 중복검사 취소하기
	$("#userid").keyup(function() {
		$("#idCheckResult").val("N");
	});
}

function wasCheckid(){
	// 중복검사

	if ($("#idCheckResult").val() != "Y") {
		
		return true;
	}
	return false;
}

//----------------------------정규식 체크---------------------------//
function checkUname(){
	// 이름검사 :한글,2~6글자까지 허용
	var data = $("#uname").val();
	var reg = /^[가-힣]{2,6}$/;
	if (!reg.test(data)) {
		
		$("#unameMsg").html("이름 형식이 잘못 되었습니다.");
		return false;
	}
	$("#unameMsg").html("");
	return true;
}

function checkUid(){
	var data = $("#uid").val();
	var reg = /^[a-zA-Z]{1}\w{5,15}$/;// 표현식
	var msg = "";
	var result = true;
	
	if (!reg.test(data)) { // 정규표현식 검사 메소드 : true, false
		msg = "아이디는 영문자로 시작하며 영문자,숫자로 이루어진 5글자 이상 15글자 이하의 문자열입니다.";
		result = false;
	}
	
	if(data== null || data ==""){
		msg = "필수 정보 입니다.";
		result = false;
	}
	
	$("#uidMsg").html(msg);
	return result;
	
}

function checkTel(){
	// 전화번호 검사
	var data = $("#tel").val();
	// 010, 011, 02, 031, 032, 051.....
	var reg = /^[0-9]{2,3}[-][0-9]{3,4}[-][0-9]{4}$/;
	var msg="";
	var result = true;
	if (!reg.test(data)) {
		msg = "전화번호 형식이 잘못 되었습니다.";
		result = false;
	}
	if(data==null || data == ""){
		msg = "필수 입력 값입니다.";
		result = false;
	}
	$("#telMsg").html(msg);
	return result;
}
function checkEmail(){
	// 이메일검사 : 아이디 @ 영. 영 . 영 goguma12345@korea.com,
	var data = $("#email").val();
	var reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-z]{2,3}([.][a-z]{2,3})?/;
	var msg="";
	var result = true;
	if (!reg.test(data)) {
		msg= "이메일을 잘못입력하셨습니다.";
		result =false;
	}
	
	if(data==null || data == ""){
		msg= "필수 입력 값입니다.";
		result =false;
	}
	$("#emailMsg").html(msg);
	return result;
}

function checkBirth(){
	// 주민번호
	var data = $("#birth").val();
	// 89-02-28
	reg = /^[0-9]{4}[-](01|02|03|04|05|06|07|08|09|10|11|12){1}[-][0-3]{1}[0-9]{1}$/;
	if (data==""|| data == null) {
		$("#birthMsg").html("선택 되지 않았습니다.");
		return false;
	}
	
	return true;
}

function checkLocation(){
	if ($("#location").val() == "") {
		return false;
	}
	return true;
}

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
	$("#upwdMsg").html(msg);
	return result;
}

function checkUpwd2(){
	var upwd = $("#upwd").val();
	var upwd2 = $("#upwd2").val();
	
	if (upwd!=upwd2 || upwd == "") {
		$("#upwd2Msg").html("비밀번호가 일치 하지 않습니다.");
		return false;
	}
	$("#upwd2Msg").html("");
	return ture;
}

