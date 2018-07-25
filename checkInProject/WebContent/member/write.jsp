<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<div class="col-sm-7 center"
			style="positon: relative; margin-top: 80px" id="center">
			<div class="container">
				<h3>리뷰</h3>
				<!--         enctype="multipart/form-data" 는 폼안에 파일선택하는 기능이 있을때는 반드시 있어야 함.                                                                   -->
				<form class="form-horizontal" id="dataFrm" method="post"
					action="writeOk.jsp" enctype="multipart/form-data">
					<%
						System.out.println("세션 아이디" + session.getAttribute("logId"));
					%>
					<input type="hidden" name="userid" id="userid"
						value="<%=session.getAttribute("logId")%>" />


					<div class="form-group row">

						<label>평점</label> <input type="number" step="0.5" value="0"
							max="5" min="0" id="grade" />

					</div>
					<div class="row">
						<textarea name="content" id="content" class="col-sm-10"
							placeholder="글제목을입력하세요.."></textarea>
					</div>


					<div class="form-group row-12">
						<label class="col-sm-7">사진선택</label>
						<div class="form-group row">
							<input type="file" class="form-control col-sm-10" name="filename"
								id="img1" />
						</div>
						<div class="form-group row">
							<input type="file" class="form-control col-sm-10" name="filename"
								id="img2" />
						</div>
						<div class="form-group row">
							<input type="file" class="form-control col-sm-10" name="filename"
								id="img3" />
						</div>

					</div>
					<input type="submit" value="파일올리기"
						class="btn btn-success form-control col-sm-10" />
				</form>
			</div>




		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
	</footer>

</body>
</html>