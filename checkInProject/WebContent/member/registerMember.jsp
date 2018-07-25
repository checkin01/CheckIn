<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in !회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script
	src="../js/registerForm.js"></script>

<link rel="stylesheet" href="../css/default.css">
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

</script>
</head>
<body class="font1-medium">
	<%@ include file="../nav.jspf"%>
	<!-- 본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" style="margin-top: 80px">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center">
			<!--  check box 추가 
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="custom-control custom-radio col-sm-3">
					<input type="radio" class="custom-control-input"
						data-toggle="collapse" data-target="#register1" id="customRadio1"
						name="customRadio"> <label class="custom-control-label"
						for="customRadio1">일반회원</label>
				</div>

				<div class="custom-control custom-radio col-sm-3">
					<input type="radio" class="custom-control-input" id="customRadio2"
						data-toggle="collapse" data-target="#register2" name="customRadio">
					<label class="custom-control-label" for="customRadio2">가맹점회원</label>
				</div>
				<div class="col-sm-3"></div>
			</div>
			-->

			<div id="register" style="margin-top:30px">
				<div class="container" id="memberReg" style="display: hidden">
					<!-- 홈 > 회원가입 -->
					<form method="post" id="regFrm" class="form-horizontal"
						action="registerFormOk.jsp">
						<div class="input-group form-group row">
							<label class="col-sm-2">아이디</label>
							<input type="text"
								name="userid" id="uid" class="form-control col-sm-7"
								placeholder="아이디를 입력하세요"> 
							<input type="button"
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
								name="birthday" id="birth" class="form-control col-sm-5">
							<div class="dropdown col-sm-2">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">성별선택</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">남성</a> <a
										class="dropdown-item" href="#">여성</a>

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
							<label class="col-sm-2">지역</label> <input type="text"
								name="detailaddr" id="detailaddr" class="form-control col-sm-9"
								placeholder="지역을체크박스를이용하여선택하세요">
							<button type="button" class="btn btn-primary"
								data-toggle="collapse" data-target="#demo">지역</button>
							<div id="demo" class="collapse">
								<hr />
								<button type="button" class="btn btn-primary">서울</button>
								<button type="button" class="btn btn-primary">경기</button>
								<button type="button" class="btn btn-primary">인천</button>
								<button type="button" class="btn btn-primary">강원</button>
								<button type="button" class="btn btn-primary">부산</button>
								<button type="button" class="btn btn-primary">경남</button>
								<button type="button" class="btn btn-primary">대구</button>
								<button type="button" class="btn btn-primary">경북</button>
								<button type="button" class="btn btn-primary">울산</button>
								<button type="button" class="btn btn-primary">대전</button>
								<button type="button" class="btn btn-primary">광주</button>
								<button type="button" class="btn btn-primary">전남</button>
								<button type="button" class="btn btn-primary">전북</button>
								<button type="button" class="btn btn-primary">제주</button>
								<hr />
							</div>
						</div>
						<input type="submit" value="회원가입하기"
							class="btn btn-success form-control" />
					</form>
				</div>
			</div>
			<aside class="col-sm-2 right" id="right"></aside>
		</div>
	</div>


	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>