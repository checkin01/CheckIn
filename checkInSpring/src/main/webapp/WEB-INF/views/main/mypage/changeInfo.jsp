<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
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
				<form method="post" id="regFrm" class="form-horizontal" action="registerFormOk.jsp">
					<div class="form-group row list-group-item">
						<label class="col-sm-2 ">아이디</label> <span class="col-sm-10">springZZang</span>
					</div>
					<div class="form-group row list-group-item">
						<label class="col-sm-2">이름</label> <span class="col-sm-10">박지수</span>
					</div>
					<div class="form-group row list-group-item">
						<label class="col-sm-2">연락처</label> <span class="col-sm-4">010-8888-2228</span> <input type="button" class="btn col-sm-2" value="연락처 변경" style="font-size: 0.9em" />
						<!-- <input type="text" name="phone" id="phone" class="form-control col-sm-10" placeholder="연락처입력(010-1234-5678)"/>	 -->
					</div>
					<div class="form-group row list-group-item">
						<div class="col-sm-3">
							<label>비밀번호 변경</label>
						</div>
						<div class="col-sm-8">
							<div class="form-group row">
								<label class="col-sm-6">현재 비밀번호</label> <input type="password" name="userpwd" id="userpwd" class="form-control col-sm-6" />
							</div>
							<div class="form-group row">
								<label class="col-sm-6">신규 비밀번호</label> <input type="password" name="new_userpwd" id="new_userpwd" class="form-control col-sm-6" />
							</div>
							<div class="form-group row">
								<label class="col-sm-6">신규 비밀번호 확인</label> <input type="password" name="new_userpwd2" id="new_userpwd2" class="form-control col-sm-6" />
							</div>
						</div>
					</div>

					<div class="form-group row list-group-item">
						<label class="col-sm-3">생년월일</label> <span class="col-sm-4">==가입시 기입한 날짜==</span>
					</div>
					<div class="form-group row list-group-item row">
						<label class="col-sm-2">우편번호</label>
						<div class="input-group">
							<input type="text" name="zipcode" id="zipcode" class="form-control col-sm-2" /> <input type="button" value="우편번호찾기" id="zipcodeSearch" class="form-control col-sm-2 btn btn-primary"
								style="font-size: 0.9em" /> <input type="text" name="addr" id="addr" class="form-control col-sm-5" placeholder="검색주소" />
						</div>
					</div>
					<div class="form-group row list-group-item">
						<label class="col-sm-3">상세주소</label> <input type="text" name="detailaddr" id="detailaddr" class="form-control col-sm-10" placeholder="상세주소를 입력하세요" />
					</div>
					
					<!-- 기타 정보들.. checkbox -->
					<div class="list-group-item row">
						<i class="fa fa-check-square"> <label for="info">기타 정보</label></i>
						<div class="form-group row" id="info">
							<div class="input-group-prepend d-inline-flex p-3">
								<div class="input-group-text">
									<input type="checkbox" name="info" value="스파"> <span class="col-sm-3">스파</span>
								</div>
							</div>

							<div class="input-group-prepend d-inline-flex p-3">
								<div class="input-group-text">
									<input type="checkbox" name="info" value="애견"> <span class="col-sm-3">애견</span>
								</div>
							</div>

							<div class="input-group-prepend d-inline-flex p-3">
								<div class="input-group-text">
									<input type="checkbox" name="info" value="복층"> <span class="col-sm-3">복층</span>
								</div>
							</div>

							<div class="input-group-prepend d-inline-flex p-3">
								<div class="input-group-text">
									<input type="checkbox" name="info" value="바베큐"> <span class="col-sm-3">바베큐</span>
								</div>
							</div>

							<div class="input-group-prepend d-inline-flex p-3">
								<div class="input-group-text">
									<input type="checkbox" name="info" value="오션뷰"> <span class="col-sm-3">오션뷰</span>
								</div>
							</div>

						</div>
					</div>
					<br />
					<center>
						<input type="submit" value="수정" class="btn btn-success form-control col-sm-3" />
					</center>
				</form>
			</div>
		</div>
		<aside class="left" id="left"></aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>