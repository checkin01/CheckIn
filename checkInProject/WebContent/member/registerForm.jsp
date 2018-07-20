<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체크인 회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
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
#headerIng {
	width: 100%;
	height: 90px;
	margin-bottom: 10px
}

.row {
	margin-right: 2px
}
</style>
<script>
	$(function() {
		//아이디 중복검사 창띄우기   
		$("#idChk").click(
				function() {
					//파일명,창이름,옵션(width,height,scrolling, )   
					window.open("idChkWin.jsp?userid=" + $("#userid").val(),
							"win", "width=400,height=300");
				});
		//아이디중복 검사후 수정시 중복검사 취소하기
		$("#userid").keyup(function() {
			$("#idCheckResult").val("N");
		});
		//우편번호 검색을 눌렀을때 
		$("#ZipcodeSearch").click(function() {
			window.open("ZipcodeSearch.jsp", "zc", "width=400,height:500");
		});
		//회원가입 유효성 검사
		$("#regFrm")
				.submit(
						function() {
							//아이디검사
							var data = $("#uid").val();
							var reg = /^[a-zA-Z]{1}\w{7,11}$/;//표현식

							if (!reg.test(data)) { //정규표현식 검사 메소드 : true, false
								alert("아이디를 잘못입력하셧습니다...");
								return false;
							}
							//중복검사
							if ($("#idCheckResult").val() != "Y") {
								alert("아이디 중복검사를 하세요...");
								return false;
							}
							//비밀번호 검사
							data = $("#upwd").val();
							if (!reg.test(data)) { //정규표현식 검사 메소드 : true, false
								alert("비밀번호를 잘못입력하셧습니다...");
								return false;
							}
							if (data != $("#upwd2").val()) {
								alert("비밀번호가 일치하지 않습니다..");
								return false;
							}
							//이름검사 :한글,2~6글자까지 허용
							data = $("#uname").val();
							reg = /^[가-힣]{2,6}$/;
							if (!reg.test(data)) {
								alert("이름이 잘못입력되었습니다...")
								return false;
							}
							//주민번호
							data = $("#birth").val();
							//       89-02-28
							reg = /^[0-9]{4}[-](01|02|03|04|05|06|07|08|09|10|11|12){1}[-][0-3]{1}[0-9]{1}$/;
							if (!reg.test(data)) {
								alert("생년월일을 잘못입력하셨습니다...")
								return false;
							}
							//전화번호 검사
							data = $("#tel").val();
							// 010, 011, 02, 031, 032, 051.....
							reg = /^[0-9]{2,3}[-][0-9]{3,4}[-][0-9]{4}$/;
							if (!reg.test(data)) {
								alert("전화번호를 잘못입력하셨습니다...");
								return false;
							}
							//이메일검사 : 아이디 @ 영. 영 . 영   goguma12345@korea.com, goguma12345@korea.co.kr
							data = $("#email").val();
							//                                            ()? : 한번나오던지, 안나오던지
							reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-z]{2,3}([.][a-z]{2,3})?/;
							if (!reg.test(data)) {
								alert("이메일을 잘못입력하셨습니다...")
								return false;
							}
							if ($("#location").val() == "") {
								alert("주소를 입력하세요....");
								return false;
							}
							alert("ok");
							return true;//submit실행됨
						});

	});
</script>
</head>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<aside class="left col-sm-3" id="left"></aside>
		<div class="col-sm-7 center" id="center">
			<!--  check box 추가 -->
			<hr/>
			<div class="custom-control custom-radio custom-control-inline">
      			<input type="radio" class="custom-control-input" id="customRadio1" name="example1">
      			<label class="custom-control-label" for="customRadio1">일반회원</label>
   			 </div>
    		<div class="custom-control custom-radio custom-control-inline">
     			 <input type="radio" class="custom-control-input" id="customRadio2" name="example2">
     			 <label class="custom-control-label" for="customRadio2">가맹점회원</label>
    		</div>		
			<div class="container"  id="memberReg" style="display:hidden">
				<!-- 홈 > 회원가입 -->
				<hr/>		
				<form method="post" id="regFrm" class="form-horizontal"
					action="registerFormOk.jsp">
					<div class="form-group row">
						<label class="col-sm-2">아이디</label> <input type="text"
							name="userid" id="uid" class="form-control col-sm-7"
							placeholder="아이디를 입력하세요"> <input type="button"
							value="아이디 중복확인" id="idChk"
							class="form-control col-sm-3 btn-primary" /> <input
							type="hidden" name="idCheckResult" id="idCheckResult" value="N" />
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호</label> <input type="password"
							name="userpwd" id="upwd" class="form-control col-sm-10"
							placeholder="비밀번호를 입력하세요">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호확인</label> <input type="password"
							name="userpwd2" id="upwd2" class="form-control col-sm-10"
							placeholder="비밀번호확인">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이름</label> <input type="text"
							name="username" id="uname" class="form-control col-sm-10"
							placeholder="이름을 입력하세요">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생년월일</label> <input type="date"
							name="birthday" id="birth" class="form-control col-sm-7">
							<div class="dropdown">
  						  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
   						   성별선택
    						</button>
    						<div class="dropdown-menu">
     					 	<a class="dropdown-item" href="#">남성</a>
      						<a class="dropdown-item" href="#">여성</a>
     
    					</div>
 					 </div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">연락처</label> <input type="text"
							name="phone" id="tel" class="form-control col-sm-10"
							placeholder="연락처입력(예:010-1234-5678)">
					</div>

					<div class="form-group row">
						<label class="col-sm-2">이메일</label> <input type="text"
							name="email" id="email" class="form-control col-sm-10"
							placeholder="이메일입력(예:abcde@.com)">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세주소</label> <input type="text"
							name="detailaddr" id="detailaddr" class="form-control col-sm-10"
							placeholder="시도군체크박스로하기">
					</div>
					<input type="submit" value="회원가입하기"
						class="btn btn-success form-control" />
				</form>
			</div>
			
			<!-- 가맹점 회원 -->
			<div class="container" id="masterReg">
				<hr/><h1>회원가입<span class="badge badge-secondary">ChEkIn</span></h1><hr/>				
				<form method="post" id="regFrm" class="form-horizontal"
					action="registerFormOk.jsp">
					<div class="form-group row">
						<label class="col-sm-2">아이디</label> <input type="text"
							name="userid" id="uid" class="form-control col-sm-7"
							placeholder="아이디를 입력하세요"> <input type="button"
							value="아이디 중복확인" id="idChk"
							class="form-control col-sm-3 btn-primary" /> <input
							type="hidden" name="idCheckResult" id="idCheckResult" value="N" />
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호</label> <input type="password"
							name="userpwd" id="upwd" class="form-control col-sm-10"
							placeholder="비밀번호를 입력하세요">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호확인</label> <input type="password"
							name="userpwd2" id="upwd2" class="form-control col-sm-10"
							placeholder="비밀번호확인">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이름</label> <input type="text"
							name="username" id="uname" class="form-control col-sm-10"
							placeholder="이름을 입력하세요">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생년월일</label> <input type="date"
							name="birthday" id="birth" class="form-control col-sm-7">
							<div class="dropdown">
  						  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
   						   성별선택
    						</button>
    						<div class="dropdown-menu">
     					 	<a class="dropdown-item" href="#">남성</a>
      						<a class="dropdown-item" href="#">여성</a>
     
    					</div>
 					 </div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">연락처</label> <input type="text"
							name="phone" id="tel" class="form-control col-sm-10"
							placeholder="연락처입력(예:010-1234-5678)">
					</div>

					<div class="form-group row">
						<label class="col-sm-2">이메일</label> <input type="text"
							name="email" id="email" class="form-control col-sm-10"
							placeholder="이메일입력(예:abcde@.com)">
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세주소</label> <input type="text"
							name="detailaddr" id="detailaddr" class="form-control col-sm-10"
							placeholder="시도군체크박스로하기">
					</div>
					<input type="submit" value="회원가입하기"
						class="btn btn-success form-control" />
				</form>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>