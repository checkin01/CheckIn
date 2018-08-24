<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Check In! 가맹점 </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    background-image: url('/webapp/img/1.png');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>
<script>
	function whenclickbtn(){
		location.href="/webapp/master/insertAcco";
	}

</script>
<body>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
 	Check In
  </div>

  <div class="w3-display-topright w3-padding-large w3-xlarge">
 	${mname}님 환영 합니다. <a href = "/webapp/master/logout" class="w3-large">로그아웃</a>
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">지금 시작 하세요.</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-xxxlarge w3-center"><button class="w3-button w3-round" onclick="whenclickbtn()"><b><i class="fa fa-plus-square"></i> 새 숙소 등록</b></button></p>
  </div>
</div>

</body>
</html>
