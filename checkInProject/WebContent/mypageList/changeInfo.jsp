<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체크인 예약내역</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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
	#headerIng {width: 100%;height: 90px;margin-bottom: 10px}
	.row {margin-right: 2px}
	/*=========================================================  */
	#left{width:20%}
	#sideNav{width:12%}	
		#sideBar{position:relative;top:20px;left:10px;width:80%}	
			#navImg{width:100%}
			#sideNavCnt{background-color:#f8f8f8;position:relative;padding:10px 15px}
				#sideNavCnt>a{line-height:2.3em;color:black}
				#sideNavCnt>a:hover{font-weight:bold;text-decoration:none}
	#center{padding:20px 0px;margin:0px}
</style>
</head>
<body>
<%@ include file="../nav.jspf"%>
<!-- 
   본문은 left center right으로 나뉜다.
-->
<div id="main" class="row main">
	<!-- 빈 영역 확보 -->
	<aside class="left" id="left" ></aside>
	
	<!-- side Nav -->
	<aside class="left" id="sideNav">
		<div id="sideBar">
			<div>
				<a href="<%=request.getContextPath() %>/member/mypage.jsp">
					<img src="../img/mypageNavTop.PNG" id="navImg"/>
				</a>
			</div>
			<div id="sideNavCnt">
				<a href="<%=request.getContextPath() %>/mypageList/bookList.jsp">예약내역</a><br/>
				<a href="<%=request.getContextPath() %>/mypageList/point.jsp">포인트</a><br/>
				<a href="<%=request.getContextPath() %>/mypageList/checkInfo.jsp">회원정보확인/수정</a>				
			</div>
		</div>
	</aside>
	
	<!-- main -->
    <div class="col-sm-5 center container" id="center">   	
    	<!--  check box 추가 -->
    	<!-- 홈 > 회원가입 -->
		<span class="font1-small">홈>마이페이지>회원정보수정</span>
		<hr/>
		<h3>회원정보수정</h3><br/>
		<div class="container">
			<form method="post" id="regFrm" class="form-horizontal" action="registerFormOk.jsp">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<span class="col-sm-4">==현재사용중인아이디==</span>
					<input class="col-sm-2 btn" type="button" value="아이디변경"/>
					<input type="text" name="userid" id="userid" class="form-control col-sm-7" placeholder="아이디를 입력하세요."/>
					<input type="button" value="아이디중복확인" id="idChk" class="form-control col-sm-3 btn-primary"/>
					<input type="hidden" name="idCheckResult" id="idCheckResult" value="N"/>					
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<input type="password" name="userpwd" id="userpwd" class="form-control col-sm-10" placeholder="비밀번호를 입력하세요."/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호확인</label>
					<input type="password" name="userpwd2" id="userpwd2" class="form-control col-sm-10" placeholder="비밀번호를 재입력하세요."/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<input type="text" name="username" id="username" class="form-control col-sm-10" placeholder="이름를 입력하세요."/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생년월일</label>
					<input type="date" name="birthday" id="birthday" class="form-control col-sm-10"/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">연락처</label>
					<input type="text" name="phone" id="phone" class="form-control col-sm-10" placeholder="연락처입력(010-1234-5678)"/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<input type="text" name="email" id="email" class="form-control col-sm-10" placeholder="이메일을 입력하세요"/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<input type="text" name="zipcode" id="zipcode" class="form-control col-sm-1"/>
					<input type="button" value="우편번호찾기" id="zipcodeSearch" class="form-control col-sm-2 btn-primary"/>
					<input type="text" name="addr" id="addr" class="form-control col-sm-7" placeholder="검색주소"/>				
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상세주소</label>
					<input type="text" name="detailaddr" id="detailaddr" class="form-control col-sm-10" placeholder="상세주소를 입력하세요"/>				
				</div>
				<input type="submit" value="회원가입하기" class="btn btn-success form-control"/>				
			</form>
		</div>		
    </div>
    <aside class="left" id="left" ></aside>
</div>
  
<!-- footer -->
<footer class="row footer" id="footer">
    <div class="col-sm-12"></div>
</footer>

</body>
</html>