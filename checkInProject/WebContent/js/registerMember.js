$(function() {
	// 회원가입 일반 회원 유효성 검사
	$("#regFrm1").submit(function() {
			
	});
	
	// 회원가입 가맹점 회원 유효성 검사
	$("#regFrm2").submit(function() {
		
	});
});
function whenClickRadioBtn(){
	 var radioVal = $('input[name="radioTxt"]:checked').val();
	 
}

function whenClickIdChk(){
	//id check 눌렀을때

	// 파일명,창이름,옵션(width,height,scrolling, )
	window.open("idChkWin.jsp?userid=" + $("#userid").val(), "win", "width=400,height=300");
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
		alert("아이디 중복검사를 하세요...");
		return false;
	}
}
function checkName(){
	// 이름검사 :한글,2~6글자까지 허용
	data = $("#uname").val();
	reg = /^[가-힣]{2,6}$/;
	if (!reg.test(data)) {
		alert("이름이 잘못입력되었습니다...")
		return false;
	}
}

function checkUid(){
	var data = $("#uid").val();
	var reg = /^[a-zA-Z]{1}\w{7,11}$/;// 표현식
	
	if (!reg.test(data)) { // 정규표현식 검사 메소드 : true, false
		alert("아이디를 잘못입력하셧습니다");
		return false;
	}
}
function checkPwd(){
	// 비밀번호 검사
	data = $("#upwd").val();
	if (!reg.test(data)) { // 정규표현식 검사 메소드 : true, false
		alert("비밀번호를 잘못입력하셧습니다...");
		return false;
	}
}
function checkPwd2(){
	if (data != $("#upwd2").val()) {
		alert("비밀번호가 일치하지 않습니다..");
		return false;
	}
}
function checkTel(){
	// 전화번호 검사
	data = $("#tel").val();
	// 010, 011, 02, 031, 032, 051.....
	reg = /^[0-9]{2,3}[-][0-9]{3,4}[-][0-9]{4}$/;
	if (!reg.test(data)) {
		alert("전화번호를 잘못입력하셨습니다...");
		return false;
	}
}
function checkEmail(){

	// 이메일검사 : 아이디 @ 영. 영 . 영 goguma12345@korea.com,
	// goguma12345@korea.co.kr
	data = $("#email").val();
	// ()? : 한번나오던지, 안나오던지
	reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-z]{2,3}([.][a-z]{2,3})?/;
	if (!reg.test(data)) {
		alert("이메일을 잘못입력하셨습니다...")
		return false;
	}
}
function checkBirth(){
	// 주민번호
	data = $("#birth").val();
	// 89-02-28
	reg = /^[0-9]{4}[-](01|02|03|04|05|06|07|08|09|10|11|12){1}[-][0-3]{1}[0-9]{1}$/;
	if (!reg.test(data)) {
		alert("생년월일을 잘못입력하셨습니다...")
		return false;
	}
	
}
function checkLocation(){
	if ($("#location").val() == "") {
		alert("주소를 입력하세요....");
		return false;
	}
}

