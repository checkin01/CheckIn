<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 
	bootstrap-datetpicker
	1. less 파일 적용
-->
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/bootstrap-datepicker.kr.js"></script>
<link rel="stylesheet" href="../css/datepicker.css">
</head>
<body>
<%@ include file="../nav.jspf" %>


<div id= "main" class="row main">
<!-- 왼쪽 필터 부분 -->
<aside class="left col-sm-3" id="left">
	<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3; top:50px; width:260px" id="mySidebar">
	  <div class="w3-container w3-display-container w3-padding-16">
	    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
	    <h3>숙박 업소 이름</h3>
	    <h6>업소 유형</h6>
	    <hr>
	    <form action="/action_page.php" target="_blank">
	      <p><label><i class="fa fa-calendar-check-o"></i> Check In</label></p>
	      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>          
	      <p><label><i class="fa fa-calendar-o"></i> Check Out</label></p>
	      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>         
	      <p><label><i class="fa fa-male"></i> Adults</label></p>
	      <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">              
	      <p><label><i class="fa fa-child"></i> Kids</label></p>
	      <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6">
	      <p><button class="w3-button w3-block w3-green w3-left-align" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button></p>
	    </form>
	  </div>
	  <div class="w3-bar-block">
	    <a href="#apartment" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-building"></i> Apartment</a>
	    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-16" onclick="document.getElementById('subscribe').style.display='block'"><i class="fa fa-rss"></i> Subscribe</a>
	    <a href="#contact" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-envelope"></i> Contact</a>
	  </div>
	</nav>
</aside>

<!-- 센터 부분 -->
<div class="col-sm-7 center" id="center" >
		<div class="font1-small" style="padding:20px 0; top:100px" >
			<span> 홈 > 숙박업소 리스트  > 숙박 업소 상세 보기 </span>
		</div>
		
		<div class="input-group date" data-provide="datepicker">
		    <input type="text" class="form-control datepicker" id="startdate" data-date-format="mm/dd/yyyy">
		    <span class="input-group-addon">
		        <i class="fa fa-calendar-check-o" style="font-size:20px"></i>
		    </span>
		    <script>
				$('.datepicker').datepicker({
					dateFormat: 'yy-mm-dd', // 날짜표현타입
				    langauge:"kr"
				});
			</script>
		</div>
		
		<input type="text" name="datefilter" value="" />
		<script type="text/javascript">
				$(function() {
				
				  $('input[name="datefilter"]').daterangepicker({
				      autoUpdateInput: false,
				      locale: {
				          cancelLabel: 'Clear'
				      }
				  });
				
				  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
				      $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
				  });
				
				  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
				      $(this).val('');
				  });
				
				});
		</script>
		
		
</div>
<aside class="col-sm-2 right" id="right" style="top:50px">
	
</aside>
</div>

<!-- footer -->
<footer class="row footer" id="footer">
		<div class="col-sm-12">

		</div>
</footer>
</html>