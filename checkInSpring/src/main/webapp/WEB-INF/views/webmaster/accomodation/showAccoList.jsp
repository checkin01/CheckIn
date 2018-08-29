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
<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<%=request.getContextPath()%>/js/gchart_combo.js"></script>
<script src="<%=request.getContextPath()%>/js/gchart_cal.js"></script>
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

#theme {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
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
			<h4 style="text-align: center;" class="sub-title">숙박업소 리스트</h4>
			<!-- 리스트 시작 -->
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">연번</div>
						<div class="col-md-1">숙박업소명</div>
						<div class="col-md-2">연락처</div>
						<div class="col-md-2">주소</div>
						<div class="col-md-1">업태</div>
						<div class="col-md-1">체크인시간</div>
						<div class="col-md-1">체크아웃시간</div>
						<div class="col-md-1">최대숙박가능일</div>
						<div class="col-md-1">테마</div>
						<div class="col-md-1">가입날짜</div>
					</div>
				</div>

				<!-- 숙박업소 리스트-->
				<c:forEach var="vo" items="${list }">
				<div class="list-group-item" style="text-align: center" id="aa">
					<div class="row" id="bookList">
						<div class="col-md-1">${vo.a }</div>
						<div class="col-md-1">${vo.aname }</div>
						<div class="col-md-2">${vo.atel }</div>
						<div class="col-md-2">${vo.aaddr }</div>
						<div class="col-md-1">${vo.atype }</div>
						<div class="col-md-1">${vo.acheckin }</div>
						<div class="col-md-1">${vo.acheckout }</div>
						<div class="col-md-1">${vo.amaxreservedate }</div>
						<div class="col-md-1" id="theme">${vo.atheme }</div>
						<div class="col-md-1">${vo.writedate }</div>
					</div>
				</div>
				</c:forEach>
			<!-- listGroup -->
			<!------------------------ paging 시작 ----------------->
			<c:set var="curpage" value="${curpage}" />
			<c:set var="onepage" value="${onepage}" />
			<c:set var="totalpage" value="${totalpage}" />
			<ul class="pagination pagination-md justify-content-center" id="pagination">
				<c:if test="${curpage!=1}" >
					<li class="page-item"><a href="/webapp/webmaster/accoList?curpage=${curpage-1}" class="page-link">Prev</a></li>
				</c:if>
				<!-- 5개씩 보여준다. -->
				<c:forEach var = 'i' begin='${Math.floor(curpage/5)*5+1}' end='${(curpage/5)*5+4}'>
					<c:if test = "${i <= totalpage}">
						<c:choose>
							<c:when test = "${i==curpage}">
								<li class="page-item"><a href="/webapp/webmaster/accoList?curpage=${i}" class="page-link"><b>${i}</b></a></li>
							</c:when>
							<c:when test = "${i!=curpage}">
								<li class="page-item"><a href="/webapp/webmaster/accoList?curpage=${i}" class="page-link">${i}</a></li>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${curpage!=totalpage}" >
					<li class="page-item"><a href="/webapp/webmaster/accoList?curpage=${curpage+1}" class="page-link">Next</a></li>
				</c:if>
			</ul>
			<!---------------------------------- paging 끝 ----------------->
			</div>
		<!-- 여기 안에 모두 담자 -->

		<!-- right -->		
		</div>
		<aside class="col-sm-1 right" id="right"></aside>
	</div>
</body>
</html>