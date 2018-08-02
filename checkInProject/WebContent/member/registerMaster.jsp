<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in !회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="../js/register.js"></script>

<link rel="stylesheet" href="../css/default.css">
<style>
#headerIng {
	width: 100%;
	height: 90px;
	margin-bottom: 10px
}

#main .row {
	margin-right: 2px
}

#main label {
	font-size: 16px;
}
.error-text{
	font-size:12px;
	color:red;
}
</style>
</head>
<body>
<%@ include file="../nav.jspf"%>

<body class="font1-medium">
	<!-- 본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" >
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center" style="margin-top:80px; padding-left:20px">
			<div class="font1-small" style="padding: 20px 0">
				<span> 홈 > 회원가입 </span>
			</div>
			<form method="post" id="regFrmMaster" style="margin-top: 30px"
				action="registerFormOk.jsp" class="container form-horizontal">

				<!-- 아이디 -->
				<div class="row form-group">
					<label class="col-sm-3">아이디</label> <input type="text" name="uid"
						id="uid" class="form-control col-sm-5 input-group-item"
						placeholder="아이디를 입력하세요" /> 


					<!-- 중복확인 -->
					<input type="button" value="아이디 중복체크" id="idChk"
						class="form-control btn-primary col-sm-3 input-group-item" style="font-size:14px;" onclick="whenClickIdChk()"/>
					<input
						type="hidden" name="idCheckResult" id="idCheckResult" value="N" />
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="uidMsg" class="error-text"></span></div>

				<!-- 비밀번호 -->
				<div class="form-group row">
					<label class="col-sm-3">비밀번호</label> 
					<input type="password" name="upwd" id="upwd" class="form-control col-sm-8"
						placeholder="비밀번호를 입력하세요"> 
				</div>
				<div class="row">
				<div class="col-sm-3"></div>
				<span id="upwdMsg"class="error-text"></span>
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="form-group row">
					<label class="col-sm-3">비밀번호확인</label> <input type="password"
						name="upwd2" id="upwd2" class="form-control col-sm-8"
						placeholder="비밀번호확인">
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="upwd2Msg"
						class="error-text"></span></div>
				
				
				<!-- 이름 -->
				<div class="form-group row">
					<label class="col-sm-3">이름</label> <input type="text" name="uname"
						id="uname" class="form-control col-sm-8" placeholder="이름을 입력하세요">
				
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="unameMsg"
						class="error-text"></span></div>
				
				<!-- tel -->
				<div class="form-group row">
					<label class="col-sm-3">연락처</label> <input type="text" name="tel"
						id="tel" class="form-control col-sm-8"
						placeholder="연락처입력(예:010-1234-5678)"> 
				
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="telMsg"
						class="error-text"></span></div>

				<!-- email -->
				<div class="form-group row">
					<label class="col-sm-3">이메일</label> <input type="text" name="email"
						id="email" class="form-control col-sm-8"
						placeholder="이메일입력(예:abcde@.com)">
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="emailMsg"
						class="error-text"></span></div>


				<div style="height:100px"></div>
				<div class="container row">
					<div class="col-sm-7"></div>
					<input class="col-sm-2 btn btn-success" type="button" value="취소하기" />
					<div class="col-sm-1"></div>
					<input class="col-sm-2 btn btn-success" type="submit" value="가입하기" />
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
<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>