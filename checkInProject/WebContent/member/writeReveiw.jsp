<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 리뷰 작성</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css">
<script src="//cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script>


<!-- body 구성에 적용 되는 스타일 시트 -->
</head>
<body>


	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main font1-medium">

		<aside class="left col-sm-3" id="left">
			
		</aside>


		<div class="col-sm-7 center"
			style="positon: relative; margin-top:20px" id="center">
			<div class="container">
				<div style="margin-bottom: 50px" class="font1-small">홈 > 예약 내역
					확인 > 리뷰 작성</div>
				<div class="row">
					<div class="col-sm-2 font1-small">평점</div>
					<select id="grade" name="grade" class="form-control col-sm-8">
						<option value="5">★ ★ ★ ★ ★</option>
						<option value="4">★ ★ ★ ★</option>
						<option value="3">★ ★ ★</option>
						<option value="2">★ ★</option>
						<option value="1">★</option>
					</select>
				</div>
				<form class="form-horizontal" id="dataFrm" method="post"
					action="writeOk.jsp" enctype="multipart/form-data">
					<%
						System.out.println("세션 아이디" + session.getAttribute("logId"));
					%>
					<input type="hidden" name="userid" id="userid"
						value="<%=session.getAttribute("logId")%>" />

					<div class="form-group row">
						<div class="col-sm-2 font1-small">글내용</div>
						<textarea name="content" id="content" class="col-sm-10"></textarea>
						<script>
							CKEDITOR.replace("content");
						</script>
					</div>
					<div>
						<div class="font1-smallform-group">사진선택</div>
						<div class="form-group">
							<input type="file" accept="image/gif, image/jpg , image/png"
								class="form-control" name="filename" id="img1" />

						</div>
						<div class="form-group">
							<input type="file" class="form-control"
								accept="image/gif, image/jpg , image/png" name="filename"
								id="img2" />
						</div>
						<div class="form-group">
							<input type="file" class="form-control"
								accept="image/gif, image/jpg , image/png" name="filename"
								id="img3" />
						</div>

					</div>
					<div class="form-group row">
						<div class="col-sm-1"></div>
						<input type="submit" value="파일 올리기"
							class="btn btn-success form-control col-sm-4" />
						<div class="col-sm-1"></div>

						<input type="button" value="취소"
							class="btn btn-success form-control col-sm-4" />

					</div>
					<script>
						
					</script>


				</form>

			</div>
			<!--  -->
			<!-- footer -->
			<footer class="row footer" id="footer">
				<div class="col-sm-12"></div>
			</footer>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>



</body>
</html>