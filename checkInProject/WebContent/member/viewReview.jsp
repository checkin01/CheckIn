<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 리뷰 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->

</head>
<body>
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">

		<aside class="left col-sm-3" id="left">

			<nav class="w3-sidebar w3-light-grey w3-collapse w3-top"
				style="z-index: 3; width: 260px" id="mySidebar">
				<div class="w3-container w3-display-container w3-padding-16">


				</div>
			</nav>
			<!-- filter -->

		</aside>
		<div class="col-sm-7 center" id="center">

			<h1>자료실 리스트</h1>
			<div class="list-group">
				<div class="list-group-item list-group-item-action">
					<!-- 글 태그 영역 -->
					<div class="row">
						<div class="col-sm-1 ct">번호</div>
						<div class="col-sm-5 ct">글제목</div>
						<div class="col-sm-2 ct">글쓴이</div>
						<div class="col-sm-3 ct">등록일</div>
						<div class="col-sm-1 ct">첨부파일</div>
					</div>

				</div>



				<div class="list-group-item list-group-item-action">
					<div class="row">





						<div class="col-sm-1 ct"></div>


					</div>
				</div>


			</div>
		</div>

		<div class="list-group-item list-group-item-action">
	
		</div>
	</div>



	<aside class="col-sm-2 right" id="right"></aside>


	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>
</body>
</html>