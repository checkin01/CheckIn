<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>웹 관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body,html {
	height: 100%;
	width:100%;
}

.bgimg {
	margin-top:20px;
	background-img: url("/webapp/img/2.png");
	min-height:100%;
	background-position:center;
	background-size:cover;
}
</style>
</head>
<body>
	<%@ include file="topnav_webmaster.jspf"%>
	<div class="bgimg w3-text-black">
		<div class="w3-display-topleft w3-padding-large w3-xlarge"></div>
		<div class="w3-display-middle">
			<h2 class="w3-animate-top"  style="margin:auto;width:500px;float:center;text-align:center;padding-bottom:50px">체크인 ! 웹 관리자 페이지 입니다.</h2>
			<hr class="w3-border-grey" style="margin:auto;width:40%">
			<p class="w3-large w3-center"></p>
		<c:if test ="${w==null or w ==''}">
			<form action="/webapp/trywebmasterlogin" method="post"  style="margin:auto;width:500px;">
				<label for="wid">ID :</label> 
				<input type="text" class="form-control" name="wid" id="wid"> 
				<label for="wpwd">Password:</label> 
				<input type="password" class="form-control" name="wpwd" id="wpwd">
				<button type="submit" class="btn btn-primary" style="margin-top:10px;text-align:center">Submit</button>
			</form>	
		</c:if>
		</div>

	</div>
</body>
</html>