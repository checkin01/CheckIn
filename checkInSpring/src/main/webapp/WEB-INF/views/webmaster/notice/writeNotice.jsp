<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- datetimepicker -->
<link rel="stylesheet" href="/webapp/css/bootstrap-datetimepicker.css">
<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

</head>
<body>
	<%@ include file="../topnav_webmaster.jspf"%>
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">

		<aside class="left col-sm-1" id="left"></aside>
		<div class="col-sm-10 center container" id="center">
			<div class="font1-small" style="padding: 20px 0">
				<span class="bread"> 공지 사항 > 공지 사항 등록 </span>
			</div>				
			
			<!-- ----------------------------------------------폼태그 -->
			<form id="dataform" class="form-horizontal font1-medium" method="post" action="/webapp/webmaster/tryAddNotice" enctype="multipart/form-data">
				<hr />
				<!-- 제목 -->
				<div class="form-group" style="padding: 0 10px;">
					<label for="notitle">제목 </label>
					<input type="text" class="form-control col-sm-5" id="notitle" name="notitle"/>
					<span class="error-text-box" id="ntitleMsg"></span>
				</div>

				<!-- 공지 사항 -->
				<div class="form-group" style="padding: 0 10px;">
					<label for="ncontent control-label">내용</label>
					<textarea id="ncontent" name="ncontent" class="form-control edit" rows="10" cols="50"></textarea>
					<span class="error-text-box" id="nContentMsg"></span>
				</div>
				<hr />
				<!-- 숙박 업소 체크인시간, 체크아웃시간  -->
				<!-- datetimepicker 사용 -->
				<div class="form-group">
					<span class=" col-sm-3">공지 시작 날짜/시간</span>
					<div class="form-group col-sm-8 edit">
						<div class='input-group date'>
							<input type='date' class="form-control" name="nostartdate" /> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-3">공지 끝 날짜/시간</span>
					<div class="form-group col-sm-8 edit">
						<div class='input-group date'>
							<input type='date' class="form-control" name="noenddate" /> 
						</div>
					</div>
				</div>

				<div class="form-group row">
					<span class="col-sm-3">공지 대상</span> 
					<select class="form-control col-sm-5" id="typeSelector" name="target" style="width: 50%">
						<option value="일반회원">일반회원</option>
						<option value="가맹점회원">가맹점회원</option>						
					</select>
				</div>
				<hr />
				<div class="button-group">
					<input type="submit" class="btn btn-danger w3-indigo edit" value="등록"/>
					<a href="/webapp/webmaster/notices"><button type="button" class="btn w3-basic">취소</button></a>
				</div>
			</form>
			<!-- ----------------------------------------------폼태그 -->
		</div>
		<aside class="col-sm-1 right" id="right"></aside>
	</div>

</body>
</html>