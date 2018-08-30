<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 관리 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webapp/css/default.css">
<style>
body {
	font-size: 1em;
}

.pagination {
	margin: 10px auto;
}

.page-link {
	
}

</style>

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
			<h4 style="text-align: center" class="sub-title">일반 회원 리스트</h4>
			<!-- 리스트 시작 -->
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">아이디</div>
						<div class="col-md-1">이름</div>
						<div class="col-md-1">주소</div>
						<div class="col-md-2">연락처</div>
						<div class="col-md-2">이에일</div>
						<div class="col-md-1">생년월일</div>
						<div class="col-md-1">성별</div>
						<div class="col-md-1">포인트</div>
						<div class="col-md-1">가입날짜</div>
					</div>
				</div>

				<!-- 숙박업소 리스트 중 한개 -->
				<c:forEach var="vo" items="${list }">
				<div class="list-group-item" style="text-align: center" id="aa">
					<div class="row" id="bookList">
						<div class="col-md-1">${vo.u }</div>
						<div class="col-md-1">${vo.uuid }</div>
						<div class="col-md-1">${vo.uname }</div>
						<div class="col-md-1">${vo.uaddr }</div>
						<div class="col-md-2">${vo.utel }</div>
						<div class="col-md-2">${vo.uemail }</div>
						<div class="col-md-1">
							<c:set var="birth" value="${vo.birth }"></c:set>						
							<c:set var="birth2" value="${fn:substring(birth,0,6)}"></c:set>
							${birth2 }
						</div>					
						<div class="col-md-1">
							<c:set var="birth" value="${vo.birth }"></c:set>						
							<c:set var="gender" value="${fn:substring(birth,6,7)}"></c:set>
							<c:if test="${gender eq 1}">남자</c:if>
							<c:if test="${gender eq 2}">여자</c:if>
						</div>
						<div class="col-md-1">${vo.upoint }</div>
						<div class="col-md-1">${vo.writedate }</div>
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
					<li class="page-item"><a href="/webapp/webmaster/userList?curpage=${curpage-1}" class="page-link">Prev</a></li>
				</c:if>
				<!-- 5개씩 보여준다. -->

				<c:forEach var = 'i' begin='${Math.floor(curpage/5)*5+1}' end='${(curpage/5)*5+4}'>
					<c:if test = "${i <= totalpage}">
						<c:choose>
							<c:when test = "${i==curpage}">
								<li class="page-item"><a href="/webapp/webmaster/userList?curpage=${i}" class="page-link"><b>${i}</b></a></li>
							</c:when>
							<c:when test = "${i!=curpage}">
								<li class="page-item"><a href="/webapp/webmaster/userList?curpage=${i}" class="page-link">${i}</a></li>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${curpage!=totalpage}" >
					<li class="page-item"><a href="/webapp/webmaster/userList?curpage=${curpage+1}" class="page-link">Next</a></li>
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