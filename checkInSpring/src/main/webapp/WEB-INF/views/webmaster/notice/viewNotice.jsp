<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지 사항 상세 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
				<input type="hidden" value="mid" id="mid" name="mid" />
				<hr />
				<!-- 번호 -->
				<div class= "row item">
					<label class="col-sm-3" >번호 </label>
					<div class="col-sm-8" id="num">1</div>
				</div>

				<div class="row item">
					<label  class="col-sm-3" >제목 </label>
					<div class="col-sm-8" >공지1</div>
					
				</div>


				<div class=" row item" >
					<label class="col-sm-3">내용</label>
					<div class="col-sm-8" id="ncontent">공지 사항 입니다.</div>
				</div>


				<div class="item row">
					<label  class="col-sm-3" >공지 시작 날짜/시간</label>
					<div class="col-sm-8">2018-08-09 15:30</div>
				</div>
				<div class=" row item">
					<label class="col-sm-3">공지 끝 날짜/시간</label>
					<div class="col-sm-8">2018-08-19 15:30</div>
				</div>
				<div class=" row item">
					<label class="col-sm-3">공지 대상</label>
					<div class="col-sm-8">일반 회원/가맹점 회원</div>
				</div>
			</div>
			<hr />
			<div class="button-group">
				<a href="<%=request.getContextPath() %>/webmaster/notice/editNotice.jsp"><button type="button" class="btn w3-indigo edit">수정하기</button></a>
				<button type="button" class="btn btn-basic edit">삭제하기</button>
			</div>
		</div>
		<aside class="col-sm-1 right" id="right"></aside>
	</div>

</body>
</html>