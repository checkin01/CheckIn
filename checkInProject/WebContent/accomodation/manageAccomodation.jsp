<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkin-관리자페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
<style>
 	.regtop{padding-top:50px; float:right}
 	.reginfoFrm{margin-top:130px; height:500px; background:cyan; overflow:scroll}
 	.reginfo{margin:10px 10px}
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
	
	<aside class="left col-sm-2" id="left">
		
		<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:260px" id="mySidebar">
  			<div class="w3-container w3-display-container w3-padding-16">


  			</div>
  		</nav>
  		<!-- filter -->
  		
	</aside>
	<div class="col-sm-8 center" id="center">
		<div class="btn-group-lg regtop">
			<a href="#" class="btn btn-secondary" role="button">숙박업소등록</a>
			<a href="#" class="btn btn-secondary" role="button">숙박업소수정</a>		
			<a href="#" class="btn btn-secondary" role="button">숙박업소삭제</a>		
		</div>
		<div class="reginfoFrm">
			<div class="jumbotron reginfo">
				<img src="../img/logo02_w.png"/>
			</div>
			<div class="jumbotron reginfo">
				<img src="../img/logo02_w.png"/>
			</div>
			<div class="jumbotron reginfo">
				<img src="../img/logo02_w.png"/>
			</div>
			<div class="jumbotron reginfo">
				<img src="../img/logo02_w.png"/>
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