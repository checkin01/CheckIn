<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 예약 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">

<!-- body 구성에 적용 되는 스타일 시트 -->
<!-- daterangepicker-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/js/daterangepicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/daterangepicker.css">

<style>
body {
	font-size: 1em;
}

.pagination {
	margin: 10px auto;
}

.page-link {
	
}

#bookingList button {
	width: 100%;
	height: 100%;
	font-size: 100%;
	display: inline-block;
}

#theme {
	text-overflow: ellipsis
}

#bookListTop>div>div {
	font-size: 1em;
}

#aa {
	text-overflow: ellipsis
}
</style>
<script>
	$(function() {
		//datetimepicker
		$('input[name="checkinout"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
		$('.enter').click(function() {
			var html = $(this).html().trim();
			if (html == '미입실') {
				$(this).removeClass('w3-light-blue').addClass('w3-grey');
				html = '입실';
			} else {
				$(this).addClass('w3-light-blue').removeClass('w3-grey');
				html = '미입실';
			}
			alert(html + " 상태로 바뀌었습니다.");
			$(this).html(html);

		});
	});
</script>
</head>
<body>
<%@ include file="../topnav_webmaster.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">

		<aside class="left col-sm-1" id="left">
			
		</aside>

		<!-- center -->
		<div class="col-sm-10 center" id="center">
			<h4 style="text-align: center" class="sub-title">가맹점 회원 리스트</h4>
			<!-- 리스트 시작 -->
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">마스터아이디</div>
						<div class="col-md-2">이름</div>
						<div class="col-md-2">전화번호</div>
						<div class="col-md-2">이메일</div>
						<div class="col-md-2">가입날짜</div>

					</div>
				</div>

				<!-- 예약내역 -->
				<c:forEach var="vo" items="${list }">
				<div class="list-group-item" style="text-align: center">
					<div class="row" id="bookList">
						<div class="col-md-1">${vo.m }</div>
						<div class="col-md-1">${vo.mid }</div>
						<div class="col-md-2">${vo.mname }</div>
						<div class="col-md-2">${vo.mtel }</div>
						<div class="col-md-2">${vo.memail }</div>
						<div class="col-md-2">${vo.writedate }</div>
					</div>	
				</div>
				</c:forEach>

			</div>
			<!-- listGroup -->
			<!------------------------ paging 시작 ----------------->
			<c:set var="curpage" value="${curpage}" />
			<c:set var="onepage" value="${onepage}" />
			<c:set var="totalpage" value="${totalpage}" />
			<ul class="pagination pagination-md justify-content-center" id="pagination">
				<c:if test="${curpage!=1}" >
					<li class="page-item"><a href="/webapp/webmaster/masterList?curpage=${curpage-1}" class="page-link">Prev</a></li>
				</c:if>
				<!-- 5개씩 보여준다. -->

				<c:forEach var = 'i' begin='${Math.floor(curpage/5)*5+1}' end='${(curpage/5)*5+4}'>
					<c:if test = "${i <= totalpage}">
						<c:choose>
							<c:when test = "${i==curpage}">
								<li class="page-item"><a href="/webapp/webmaster/masterList?curpage=${i}" class="page-link"><b>${i}</b></a></li>
							</c:when>
							<c:when test = "${i!=curpage}">
								<li class="page-item"><a href="/webapp/webmaster/masterList?curpage=${i}" class="page-link">${i}</a></li>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${curpage!=totalpage}" >
					<li class="page-item"><a href="/webapp/webmaster/masterList?curpage=${curpage+1}" class="page-link">Next</a></li>
				</c:if>
			</ul>
			<!---------------------------------- paging 끝 ----------------->
		</div>
		<!-- 여기 안에 모두 담자 -->

		<!-- right -->
		<aside class="col-sm-1 right" id="right"></aside>
	</div>
</body>
</html>