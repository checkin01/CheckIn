<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="writeNoticeModal.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
#pagination {
	margin-top: 50px;
}
</style>

<title>웹 관리 페이지</title>
</head>

<body>
<%@ include file="../topnav_webmaster.jspf"%>
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">
		<aside class="left col-sm-1" id="left">
		</aside>
		<div class="col-sm-10 center container" id="center" style="text-align: center">
			<h4 class="sub-title" style="text-align: center">공지 사항 리스트</h4>
			<div class="btn-group row" style="text-align: right; width: 100%">
				<button type="button" class="btn w3-indigo" data-toggle="modal" data-target="#writeModal">새 공지 추가</button>
			</div>
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">아이디</div>
						<div class="col-md-4">제목</div>
						<div class="col-md-2">시작날짜</div>
						<div class="col-md-2">끝날짜</div>
						<div class="col-md-2">적용 대상</div>
					</div>
				</div>

				<div class="list-group-item" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">1</div>
						<div class="col-md-1">webmaster</div>
						<div class="col-md-4">
							<a href="<%=request.getContextPath()%>/webmaster/notice/viewNotice.jsp">서버 관리 공지</a>
						</div>
						<div class="col-md-2">20180806</div>
						<div class="col-md-2">20180809</div>
						<div class="col-md-2">일반 회원</div>
					</div>
				</div>
				<div class="list-group-item" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">1</div>
						<div class="col-md-1">webmaster</div>
						<div class="col-md-4">연휴 관련 공지</div>
						<div class="col-md-2">20180806</div>
						<div class="col-md-2">20180808</div>
						<div class="col-md-2">가맹점 회원</div>
					</div>
				</div>

			</div>

			<ul class="pagination pagination-md justify-content-center" id="pagination">
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Prev</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">1</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">2</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">3</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">4</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">5</a></li>
				<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Next</a></li>
			</ul>

			<!-- 여기 안에 모두 담자 -->

		</div>
		<aside class="col-sm-1 right" id="right"></aside>

	</div>

</body>
</html>