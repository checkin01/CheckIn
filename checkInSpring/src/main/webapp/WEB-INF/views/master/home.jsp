<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 관리자 메인 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<%=request.getContextPath()%>/js/gchart_combo.js"></script>
<script src="<%=request.getContextPath()%>/js/gchart_cal.js"></script>
<script src="<%=request.getContextPath()%>/js/gchart_accomodation.js"></script>
<style>
.table {
	padding: 20px;
}
</style>
</head>
<body>
	<%@ include file="topnav_master.jspf"%>
	<div class="row main" id="main">
		<aside class="col-lg-1"></aside>

		<div class="col-lg-9 center" id="center" style="text-align: center">
			<div style="text-align: center">
				<h3>
					[<span>금강 호텔</span>] 매출 현황
				</h3>
			</div>
			<div class="table" style="text-align: center">
				<div class="row">
					<div class="col-sm-3 list-group-item list-group-item-info">한달 평균 예약 수</div>
					<div class="col-sm-3 list-group-item list-group-item-info">전체 평점</div>
					<div class="col-sm-3 list-group-item list-group-item-info">등록된 리뷰 수</div>
					<div class="col-sm-3 list-group-item list-group-item-info">방 수</div>
				</div>
				<div class="row">
					<div class="col-sm-3 list-group-item">a</div>
					<div class="col-sm-3 list-group-item">b</div>
					<div class="col-sm-3 list-group-item">b</div>
					<div class="col-sm-3 list-group-item">b</div>
				</div>
			</div>

			<hr />
			<!------------------------------ google chart ---------------------------------------->
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="calendar_basic" class="panel-body" style="width: 1000px; height: 350px;" style="text-align:center"></div>
			</div>
			<hr />
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="chart_div" class="panel-body" style="width: 900px; height: 500px;" style="text-align:center"></div>
			</div>
			<!------------------------------ google chart ---------------------------------------->
			<hr />
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="columnchart_material" class="panel-body" style="width: 800px; height: 400px;"></div>
			</div>

		</div>
		<!-- 관리 현황 페이지 google chart -->


		<aside class="col-lg-1"></aside>
		<footer id="footer" class="footer" style="width:100%;font-size:0.8em;margin-top:50px">
		<%@ include file="companyInfo.jspf"%>
		</footer>
		
	</div>
	
	


</body>
</html>