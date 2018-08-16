<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- datetimepicker -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css">
<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
</head>
<body>
	<%@ include file="../topnav_webmaster.jspf"%>
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">

		<aside class="left col-sm-1" id="left"></aside>
		<div class="col-sm-10 center container" id="center">
			<div class="font1-small" style="padding: 20px 0">
				<span class="bread"> 공지 사항 > 공지 수정하기 </span>
			</div>
			<form id="dataform" class="form-horizontal font1-medium" method="post" action="writeOk.jsp" enctype="multipart/form-data">
				<input type="hidden" value="mid" id="mid" name="mid" />

				<hr />
				<!-- 제목 -->
				<div class="form-group" style="padding: 0 10px;">
					<label for="ntitle">제목 </label>

					<div class="form-control col-sm-5" id="ntitle" name="ntitle" class="edit">공지1</div>
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
						<div class='input-group date' id='datetimepicker6'>
							<input type='text' class="form-control" value="2018-09-10 12:00" /> <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-3">공지 끝 날짜/시간</span>
					<div class="form-group col-sm-8 edit">
						<div class='input-group date' id='datetimepicker7'>
							<input type='text' class="form-control" value="2018-09-10 12:00" /> <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<span class="col-sm-3">공지 대상</span> <select class="form-control col-sm-5" id="ntype" style="width: 50%">
						<option>일반 회원</option>
						<option>가맹점 회원</option>
					</select>
				</div>
			</form>
			<script type="text/javascript">
				$(function() {
					$('#datetimepicker6').datetimepicker();
					$('#datetimepicker7').datetimepicker({
						useCurrent : true
					//Important! See issue #1075
					});
					$("#datetimepicker6").on(
							"dp.change",
							function(e) {
								$('#datetimepicker7').data("DateTimePicker")
										.minDate(e.date);
							});
					$("#datetimepicker7").on(
							"dp.change",
							function(e) {
								$('#datetimepicker6').data("DateTimePicker")
										.maxDate(e.date);
							});
				});
			</script>
			<hr />
			<div class="button-group">
				<button type="button" class="btn w3-indigo edit">확인</button>
				<button type="button" class="btn w3-basic">취소</button>
			</div>
		</div>
		<aside class="col-sm-1 right" id="right"></aside>
	</div>

</body>
</html>