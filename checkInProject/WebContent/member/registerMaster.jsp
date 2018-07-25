<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file="../nav.jspf"%>
	<!-- 본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" style="margin-top: 80px">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center">
		<!-- 가맹점 회원 -->
			<div id="register" class="collapse" style="margin-top:30px">
				<div class="container" id="masterReg">
					<span class="badge badge-secondary"></span>
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
							<label class="col-sm-2">연락처</label> <input type="text"
								name="phone" id="tel" class="form-control col-sm-10"
								placeholder="연락처입력(예:010-1234-5678)">
						</div>

						<div class="form-group row">
							<label class="col-sm-2">이메일</label> <input type="text"
								name="email" id="email" class="form-control col-sm-10"
								placeholder="이메일입력(예:abcde@.com)">
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