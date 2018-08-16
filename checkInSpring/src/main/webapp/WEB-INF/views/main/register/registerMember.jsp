<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/register.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
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

#main .row {
	margin-right: 2px;
	font-family: 'Jua', 'Gothic A1', sans-serif;
}

#main label {
	font-size:1em;
	font-family: 'Jua', 'Gothic A1', sans-serif;
	text-align:center;
	padding-right:20px;
}

.error-text{
	font-size:12px;
	color:red;
}

body{
	background:url('../img/h_r2.jpg')100% 100%;
	height:800px;
}

#regFrmMember .btns{
	position: relative;
	padding: 20px;
	margin: 0 20px;
	text-align: center;
	font-family: 'Jua', 'Gothic A1', sans-serif;
}
#regFrmMember{
	background-color: rgba( 255, 255, 255, 0.9);
}

.center{

	font-family: 'Jua', 'Gothic A1', sans-serif;
}


</style>
<script>
	
</script>
</head>
<body class="font1-medium">
<%@ include file="../topnav_member.jspf"%>
	<!-- 본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" >
		<aside class="left col-sm-3" id="left"></aside>
		<div class="col-sm-6 center" id="center" style="padding-top:80px; padding-left:20px">
			
			<form method="post" id="regFrmMember" style="margin-top:30px;"
				action="../index.jsp" class="container form-horizontal rounded">
				<div style="padding:20px 0">
				<span style="padding:30px"> 홈 > 회원가입 </span>
				</div>
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

				<!-- 생년월일 -->
				<div class="form-group row">
					<input type="hidden" id="birth" /> <label class="col-sm-3">생년월일</label>
					<input type="date" name="birthdate" id="birthdate"
						class="form-control col-sm-4" value="1999-01-01"> <select
						class="form-control col-sm-4">
						<option value="1">남성</option>
						<option value="2">여성</option>
					</select>
				</div>
				<div class="row"><div class="col-sm-3"></div><span id="birthMsg"
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

				<!-- addr -->
				<div class="form-group row">
					<input type="hidden" id="location" /> <label class="col-sm-3">지역</label>
					<select class="form-control col-sm-5" id="locationSelector">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="부산">부산</option>
						<option value="경남">경남</option>
						<option value="대구">대구</option>
						<option value="경북">경북</option>
						<option value="울산">울산</option>
						<option value="대전">대전</option>
						<option value="광주">광주</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주">제주</option>
					</select>
				</div>
				<div class="container btns form-group">
					<input class="col-sm-3 btn btn-primary" type="submit" value="가입하기" />
					<input class="col-sm-3 btn" type="button" value="취소하기" />
				</div>
			</form>
		</div>
		<aside class="col-sm-3 right" id="right"></aside>
	</div>
</body>
</html>