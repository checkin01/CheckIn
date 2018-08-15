<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 예약 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css">
<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<%=request.getContextPath() %>/js/gchart_combo.js"></script>
<script src="<%=request.getContextPath() %>/js/gchart_cal.js"></script>
<!-- body 구성에 적용 되는 스타일 시트 -->
<!-- daterangepicker-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/js/daterangepicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/daterangepicker.css">
<style>
body {
	font-size: 1em;
}

.pagination {
	margin: 10px auto;
}

.page-link {
	
}

#bookingList button {
	width: 100%;
	height: 100%;
	font-size: 100%;
	display: inline-block;
}

#theme {
	text-overflow: ellipsis
}

#bookListTop>div>div {
	font-size: 1em;
}

#aa {
	text-overflow: ellipsis
}
</style>
<script>
	$(function() {
		//datetimepicker
		$('input[name="checkinout"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
		$('.enter').click(function() {
			var html = $(this).html().trim();
			if (html == '미입실') {
				$(this).removeClass('w3-light-blue').addClass('w3-grey');
				html = '입실';
			} else {
				$(this).addClass('w3-light-blue').removeClass('w3-grey');
				html = '미입실';
			}
			alert(html + " 상태로 바뀌었습니다.");
			$(this).html(html);

		});
	});
</script>
</head>
<body>
<%@ include file="../topnav_webmaster.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main" style="position: relative; top: 80px; margin-bottom: 100px">

		<aside class="left col-sm-1" id="left">
			
		</aside>

		<!-- center -->
		<div class="col-sm-10 center" id="center">
			<h4 style="text-align: center" class="sub-title">일반 회원 리스트</h4>
			<!-- 리스트 시작 -->
			<div class="list-group" style="margin-top: 20px; font-size: 0.9em" id="bookingList">
				<div class="list-group-item w3-indigo" id="bookListTop" style="text-align: center">
					<div class="row">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">아이디</div>
						<div class="col-md-1">이름</div>
						<div class="col-md-1">주소</div>
						<div class="col-md-2">연락처</div>
						<div class="col-md-1">이에일</div>
						<div class="col-md-1">나이</div>
						<div class="col-md-1">성별</div>
						<div class="col-md-1">포인트</div>
						<div class="col-md-1">가입날짜</div>
					</div>
				</div>

				<!-- 숙박업소 리스트 중 한개 -->
				<div class="list-group-item" style="text-align: center" id="aa">
					<div class="row" id="bookList">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">power</div>
						<div class="col-md-1">김파워</div>
						<div class="col-md-1">파워 업구 업동</div>
						<div class="col-md-2">010-8282-8282</div>
						<div class="col-md-1">power@hanmail.net</div>
						<div class="col-md-1">20</div>
						<div class="col-md-1">여자</div>
						<div class="col-md-1">0</div>
						<div class="col-md-1">2018-08-06</div>
					</div>
				</div>
				<div class="list-group-item" style="text-align: center" id="aa">
					<div class="row" id="bookList">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">power</div>
						<div class="col-md-1">김파워</div>
						<div class="col-md-1">파워 업구 업동</div>
						<div class="col-md-2">010-8282-8282</div>
						<div class="col-md-1">power@hanmail.net</div>
						<div class="col-md-1">20</div>
						<div class="col-md-1">여자</div>
						<div class="col-md-1">0</div>
						<div class="col-md-1">2018-08-06</div>
					</div>
				</div>
				<div class="list-group-item" style="text-align: center" id="aa">
					<div class="row" id="bookList">
						<div class="col-md-1">번호</div>
						<div class="col-md-1">power</div>
						<div class="col-md-1">김파워</div>
						<div class="col-md-1">파워 업구 업동</div>
						<div class="col-md-2">010-8282-8282</div>
						<div class="col-md-1">power@hanmail.net</div>
						<div class="col-md-1">20</div>
						<div class="col-md-1">여자</div>
						<div class="col-md-1">0</div>
						<div class="col-md-1">2018-08-06</div>
					</div>
				</div>
			</div>
			<!-- listGroup -->
			<!-- paging -->

			<ul class="pagination pagination-md justify-content-center" id="pagination">
				<li class="page-item"><a href="showMasters.jsp" class="page-link">Prev</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">1</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">2</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">3</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">4</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">5</a></li>
				<li class="page-item"><a href="showMasters.jsp" class="page-link">Next</a></li>
			</ul>
			<form action="list.jsp" id="searchFrm" class="form-inline justify-content-center">
				<div style="text-align: center">
					<select name="searchKey" class="form-control">
						<option value="subject">연번</option>
						<option value="content">숙박업소명</option>
						<option value="writer">업태</option>
					</select> <input type="text" id="searchWord" name="searchWord" class="form-control" /> <input type="submit" value="Search" class="form-control" />
				</div>
			</form>
		</div>
		<!-- 여기 안에 모두 담자 -->

		<!-- right -->
		<aside class="col-sm-1 right" id="right"></aside>



	</div>


</body>
</html>