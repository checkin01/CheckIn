<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>

body{
	position:relative; 
	padding-top:40px;
}

#main-nav{
	position:fixed; 
	top:40px;
	left:0; 
	width:100%;
	height:40px; 
	background: #f5b335; 
	transition:top 0.2s ease-in-out; 
}
#top-nav{
	position:fixed;
	top:0;
	left:0; 
	width:100%;
	height:40px; 
	transition:top 0.2s ease-in-out; 
}

.nav-up { 
top: -40px; 
}
.nav-down{
top:0px
}

#footer-nav{
	position:fixed; 
	background:red;
	left:0;
	width:100%;
	bottom:0px;
	height:100px;
	transition:top 0.2s ease-in-out; 
	visibility:hidden;
	rgba:0.7;
}
</style>

</head>
<body>
<!--
	<nav id="top-nav">
		222222222222222
	</nav>
	<nav  id="main-nav">
	 !!!!!!!!!!!!
	</nav>
 -->
<%@ include file="nav.jspf"%>
<img src="../img/accomodation/hotel01.PNG" width='100px' height='5000px' />
<!--
<nav id="footer-nav">
	 footer
</nav>
  -->
<footer>


</footer>
</body>
<script>
	var didScroll;
	var lastScrollTop=0;
	var delta = 5;
	var navbarHeight = $('#main-nav').outerHeight();
	var wasShow
	
	$(window).scroll(function(){
		hasScrolled2();
	});

	function hasScrolled2(){
		if($(this).scrollTop() > ($('#main-nav').outerHeight() + $('#top-nav').outerHeight())){
			$('#main-nav').css("top","0");
			$('#top-nav').css("top","-40px");
			$('#footer-nav').css("visibility","visible");
			$('#footer-nav').css("bottom","-70px");
		}else{
			$('#main-nav').css("top","40px");
			$('#top-nav').css("top","0");
			$('#footer-nav').css("bottom","-120px");
			
		}
	}
</script>
</html>