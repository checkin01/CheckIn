<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in! 회원정보확인/수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<style>
#headerIng {
	width: 100%;
	height: 90px;
	margin-bottom: 10px
}

.row {
	margin-right: 2px
}
/*=========================================================  */
body {
	background-color: #F5F5F5
}

#center {
	padding: 50px 40px;
	margin: 20px auto;
	background-color: #fff
}

#pwdChkBtn {
	position: relative;
	left: 40%
}

#cancle {
	position: relative;
	left: 41%
}

#center h3 {
	font-family: 'Jua';
}

#pwd {
	border-radius: 5px;
	border: 1px solid lightgray
}
</style>
<script>
	$(function() {
		$("#cancle").click(function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<%@ include file="../topnav_member.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<!-- main -->
		<div class="col-sm-5 center container" id="center">
			<!--  check box 추가 -->
			<!-- 홈 > 회원가입 -->
			<span class="font1-small">홈>마이페이지>회원정보수정</span>
			<hr />
			<h3>회원정보확인</h3>
			<span class="font1-small"> <span style="color: skyblue; font-weight: bold">${uname }님</span>의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
			</span><br />
			<br />
			<form method="post" action="/webapp/main/mypage/modifyInfo">
				<div class="table-responsive">
					<table class="table rounded" id="pwd-table">
						<thead class="rounded">
							<tr class="rounded">
								<th class="rounded" style="background-color: #AFDCE8"><span style="font-size: 0.9em">비밀번호</span></th>
								<th><input class="input-control" type="password" id="upwd" name="upwd" /></th>
							</tr>
						</thead>
					</table>
				</div>
				<input type="submit" id="pwdChkBtn" value="확인" class="btn btn-success" /> <input type="button" id="cancle" value="취소" class="btn " />
			</form>

		</div>
		<aside class="left" id="left"></aside>
	</div>

	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;">
		<%@ include file="../companyInfo.jspf"%>
	</footer>
</body>
</html>