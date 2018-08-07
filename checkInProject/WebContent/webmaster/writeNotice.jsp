<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- datetimepicker -->
  <script type="text/javascript" src="/bower_components/moment/min/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" />	
	
<head>
<script
	src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<title>공지 사항 작성</title>
</head>

<body>
	<div id="main" class="main">
		<aside></aside>
		<div id="center" class="center container">
			<form id="dataform" class="form-horizontal font1-medium"
				method="post" action="writeOk.jsp" enctype="multipart/form-data">
				<input type="hidden" value="mid" id="mid" name="mid" />

				<!-- 제목 -->
				<div class="form-group row">
					<label for="aname">제목 </label><input class="form-control col-sm-5"
						maxlength="20" id="ntitle" name="ntitle" type="text" /> <span
						class="error-text-box" id="anameMsg"></span>
				</div>

				<!-- 공지 사항 -->
				<div class="form-group row">
					<label for="aname">내용</label>
					<textarea id="ncontent" name="ncontent" class="ckeditor" rows="10"
						cols="50"></textarea>
					<span class="error-text-box" id="anameMsg"></span>
				</div>


				<!-- 숙박 업소 체크인시간, 체크아웃시간  -->
				<!-- datetimepicker 사용 -->

				<div class="form-group row ">
					<span class=" col-sm-2">공지 시작 날짜/시간</span>
					<div class="form-group  col-sm-5">
						<div class='input-group date' id='datetimepicker6'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="form-group row ">
					<span class=" col-sm-2">공지 끝 날짜/시간</span>
					<div class="form-group col-sm-5">
						<div class='input-group date' id='datetimepicker7'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$(function() {
						$('#datetimepicker6').datetimepicker();
						$('#datetimepicker7').datetimepicker({
							useCurrent : false
						//Important! See issue #1075
						});
						$("#datetimepicker6").on(
								"dp.change",
								function(e) {
									$('#datetimepicker7')
											.data("DateTimePicker").minDate(
													e.date);
								});
						$("#datetimepicker7").on(
								"dp.change",
								function(e) {
									$('#datetimepicker6')
											.data("DateTimePicker").maxDate(
													e.date);
								});
					});
				</script>

			</form>


		</div>
		<aside></aside>
	</div>
</body>
</html>