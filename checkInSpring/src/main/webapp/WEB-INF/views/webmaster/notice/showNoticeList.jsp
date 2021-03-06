<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 공지 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webapp/css/default.css">
<script>
	function whenclickwritebtn(){
		$("#writeModal").modal('show');
	}

</script>
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
				<a href="/webapp/webmaster/addNotice"><button type="button" class="btn w3-indigo">새 공지 추가</button></a>
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
				<c:forEach var="vo" items="${list }">
				<div class="list-group-item" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">${vo.no }</div>
						<div class="col-md-1">${vo.wid }</div>
						<div class="col-md-4">
							<a href="/webapp/webmaster/notice?no=${vo.no }">${vo.notitle }</a>
						</div>
						<div class="col-md-2">${vo.nostartdate }</div>
						<div class="col-md-2">${vo.noenddate }</div>
						<div class="col-md-2">${vo.target }</div>
					</div>
				</div>
				</c:forEach>
						
			</div>

			<c:set var="curpage" value="${curpage}" />
			<c:set var="onepage" value="${onepage}" />
			<c:set var="totalpage" value="${totalpage}" />
			<ul class="pagination pagination-md justify-content-center" id="pagination">
				<c:if test="${curpage!=1}" >
					<li class="page-item"><a href="/webapp/webmaster/notices?ncurpage=${curpage-1}" class="page-link">Prev</a></li>
				</c:if>
				<!-- 5개씩 보여준다. -->

				<c:forEach var = 'i' begin='${Math.floor(curpage/5)*5+1}' end='${(curpage/5)*5+4}'>
					<c:if test = "${i <= totalpage}">
						<c:choose>
							<c:when test = "${i==curpage}">
								<li class="page-item"><a href="/webapp/webmaster/notices?ncurpage=${i}" class="page-link"><b>${i}</b></a></li>
							</c:when>
							<c:when test = "${i!=curpage}">
								<li class="page-item"><a href="/webapp/webmaster/notices?ncurpage=${i}" class="page-link">${i}</a></li>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${curpage!=totalpage}" >
					<li class="page-item"><a href="/webapp/webmaster/notices?ncurpage=${curpage+1}" class="page-link">Next</a></li>
				</c:if>
			</ul>
		</div>
		<aside class="col-sm-1 right" id="right"></aside>

	</div>

</body>
</html>