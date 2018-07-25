<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
<style>
	#main{margin:10px}
</style>
<script>
	
</script>
</head>
<body>
<%@ include file="../nav.jspf" %>
<!-- 
	본문은 left center right으로 나뉜다.
-->
<div id= "main" class="row main">
	
	<aside class="left col-sm-3" id="left">
		
		<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:260px" id="mySidebar">
  			<div class="w3-container w3-display-container w3-padding-16">


  			</div>
  		</nav>
  		<!-- filter -->
  		
	</aside>
	<div class="col-sm-7 center" id="center">
		<div class="row" id="filter">	
			<div class="btn-group" style="background:cyan">
				<div class="btn-group">
					<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">숙박형태</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">모텔</a></li>
						<li><a href="#">호텔</a></li>
						<li><a href="#">펜션</a></li>
						<li><a href="#">게스트하우스</a></li>
					</ul>
				</div>
				<button type="button" class="btn btn-light col-lg-4">서울시</button>
				<div class="btn-group">
					<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">구</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">강남구</a></li>
						<li><a href="#">강동구</a></li>
						<li><a href="#">강북구</a></li>
						<li><a href="#">강서구</a></li>
					</ul>
				</div>
				<button type="button" class="btn btn-light">체크인</button>
				<button type="button" class="btn btn-light">체크아웃</button>
				<button type="button" class="btn btn-light">검색</button>
			</div> 
		</div>				
		<div class="row" id="map">
			<div class="col-lg-12">
			</div>
		</div>
		<div class="row"id="list">
			
		</div>
	</div>
	<aside class="col-sm-2 right" id="right">
	
	</aside>
</div>

<!-- footer -->
<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
</footer>

</body>
</html>