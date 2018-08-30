<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 공지 상세 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webapp/css/default.css">

<style>
	label{
		color:#555;
		width:100%;
		height:100%;
	}
	.row{
		margin:20px;

	}
	.item div{
		border:solid 0.5px #ddd;
		padding:5px;
		font-size:1em;
	}
</style>
</head>
<c:set var="vo" value="${vo }"/>	
<body>
<%@ include file="../topnav_webmaster.jspf"%>
	<div id="main" class="row main" style="position:relative; top: 80px; margin-bottom: 100px">
		<aside class="left col-sm-1" id="left">
		
		</aside>
	
		<div class="col-sm-10 center" id="center">
			<div class="font1-small" style="padding:20px 0">
				<span class="bread">공지 사항 > 공지 상세 보기 </span>
			</div>
			<div class="font1-medium form-horizontal rounded" style="width:100%; hegith:100%" >
				<input type="hidden" value="${vo.wid }" id="wid" name="wid" />
				<hr />
				<!-- 번호 -->
				<div class= "row item">
					<label class="col-sm-3" >번호 </label>
					<div class="col-sm-8" id="num">${vo.no }</div>
				</div>

				<div class="row item">
					<label  class="col-sm-3" >제목 </label>
					<div class="col-sm-8" >${vo.notitle }</div>
					
				</div>


				<div class=" row item" >
					<label class="col-sm-3">내용</label>
					<div class="col-sm-8" id="ncontent">${vo.ncontent}</div>
				</div>


				<div class="item row">
					<label  class="col-sm-3" >공지 시작 날짜/시간</label>
					<div class="col-sm-8">${vo.nostartdate }</div>
				</div>
				<div class=" row item">
					<label class="col-sm-3">공지 끝 날짜/시간</label>
					<div class="col-sm-8">${vo.noenddate }</div>
				</div>
				<div class=" row item">
					<label class="col-sm-3">공지 대상</label>
					<div class="col-sm-8">${vo.target }</div>
				</div>
			</div>
			<hr />
			<div class="button-group">
				<a href="/webapp/webmaster/modifyNotice?no=${vo.no }"><button type="button" class="btn w3-indigo edit">수정하기</button></a>
				<a href="/webapp/webmaster/deleteNotice?no=${vo.no }"><button type="button" class="btn btn-basic edit">삭제하기</button></a>
			</div>
		</div>
		<aside class="col-sm-1 right" id="right"></aside>
	</div>

</body>
</html>