<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../topnav_master.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In ! 객실 등록</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/registerRoom.js"></script>
<style>
.error-text-box {
	color: red;
	font-size: 12pt
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="main" class="row main">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center" style="top: 50px">
			<!--  -->
			<div class="font1-small" style="padding: 20px 0;">
				<a href="manageDetailRoom.jsp">룸 관리 페이지</a>
			</div>

			<form id="dataform" class="form-horizontal font1-medium list-group" method="post" action="writeOk.jsp" enctype="multipart/form-data">
				<input type="hidden" value="mid" id="mid" name="mid" />

				<!-- 룸 유형 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-home"> <label for="type">객실 유형</label></i> <select class="form-control col-sm-5" id="typeSelector" name="">
						<option>개인룸</option>
						<option>더블룸</option>
						<option>트윈룸</option>
					</select> <span class="error-text-box" id="rtypeMsg"></span>
				</div>

				<!-- 객실 명 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="rname">객실 명</label></i> <input class="form-control col-sm-5" id="rname" name="rname" type="text" /> <span class="error-text-box" id="rnameMsg"></span>
				</div>

				<!-- 객실 요금 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-won"> <label for="price">객실 요금</label></i> <input class="form-control col-sm-5" id="price" name="price" type="number" min="0" step="100" value="0" />(단위 : 원) <span
						class="error-text-box" id="priceMsg"></span>
				</div>

				<!-- 객실 최소, 최대 수용 인원  -->
				<div class="form-group row list-group-item">
					<i class="fa fa-group"> <label>예약 관련</label></i>
					<div>
						<div class="input-group">
							<span class="form-control col-sm-2">최소 수용 인원</span> <input class="form-control col-sm-3" id="min" name="min" type="number" value="0" min="0" max="99" /> <span class="error-text-box"
								id="minMsg"></span>
						</div>
						<div class="input-group">
							<span class="form-control col-sm-2">최대 수용 인원</span> <input class="form-control col-sm-3" id="max" name="max" type="number" value="0" min="0" max="99" /> <span class="error-text-box"
								id="maxMsg"></span>
						</div>
						<span class="error-text-box" id="minMaxMsg"></span>
					</div>
				</div>

				<!-- 침실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-bed"> <label for="bedroom">침실 갯수</label></i> <input class="form-control col-sm-5" id="bedroom" name="bedroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="bedroomMsg"></span>
				</div>

				<!-- 거실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-font-awesome"> <label for="diningroom">거실 갯수</label></i> <input class="form-control col-sm-5" id="diningroom" name="diningroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="diningroomMsg"></span>
				</div>

				<!-- 화장실 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-bathtub"> <label for="restroom">화장실 갯수</label></i> <input class="form-control col-sm-5" id="restroom" name="restroom" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="restroomMsg"></span>
				</div>

				<!-- 주방 갯수 -->
				<div class="form-group row list-group-item">
					<i class="fa fa-cutlery"> <label for="kitchen">주방 갯수</label></i> <input class="form-control col-sm-5" id="kitchen" name="kitchen" type="number" min="0" max="99" value="0" /> <span
						class="error-text-box" id="kitchenMsg"></span>
				</div>

				<!-- 이미지 등록 -->
				<div class="list-group-item row">
					<i class="fa fa-file-image-o col-sm-4" style="font-size: 16px"> <label>이미지 등록(최대 3개) </label></i>
					<div class="form-group row">
						<input type="file" id="file1" class="file-control-form col-sm-4"> <input type="file" id="file1" class="file-control-form col-sm-4"> <input type="file" id="file1"
							class="file-control-form col-sm-4">
						<script>
							
						</script>
					</div>
				</div>

				<!-- 기타 정보들.. checkbox -->
				<div class="list-group-item row">
					<i class="fa fa-check-square"> <label for="info"> 기타 정보</label></i>
					<div class="form-group row" id="info">
						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">스파</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">애견</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">바베큐</span>
							</div>
						</div>

						<div class="input-group-prepend d-inline-flex p-3">
							<div class="input-group-text">
								<input type="checkbox"> <span class="col-sm-3">오션뷰</span>
							</div>
						</div>

					</div>
				</div>

				<!-- 등록 버튼 -->
				<div class="list-group-item row">
					<input type="reset" value="다시 쓰기" class="btn btn-success" /> <input type="submit" value="등록" class="btn btn-success" />
				</div>

			</form>
			
		</div>
		<!-- footer -->
		<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
			<%@ include file="../companyInfo.jspf"%>
		</footer>
	</div>



</body>
</html>