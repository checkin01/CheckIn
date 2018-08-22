<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in !회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<style>
#main .row {
	margin-right: 2px;
	font-family: 'Jua', 'Gothic A1', sans-serif;
}

#main label {
	font-size: 1em;
	font-family: 'Jua', 'Gothic A1', sans-serif;
	text-align: center;
	padding-right: 20px;
}

.error-text {
	font-size: 12px;
	color: red;
}

#regFrmMaster .btns {
	position: relative;
	padding: 20px;
	margin: 0 20px;
	text-align: center;
	font-family: 'Jua', 'Gothic A1', sans-serif;
}

#regFrmMaster {
	background-color: rgba(255, 255, 255, 0.9);
}

body {
	background: url('../img/b_r.jpg') 100% 100%;
	height: 800px;
}

.center {
	font-family: 'Jua', 'Gothic A1', sans-serif;
}
</style>
<script>
	 $(function(){				
		$("#openMember").click(function(){			
				$("#regFrmMember").css("display","block");
				$("#openMember").css("display","none");
				$("#openMaster").css("display","none");
		})
		
		$("#openMaster").click(function(){			
				$("#regFrmMaster").css("display","block");
				$("#openMember").css("display","none");
				$("#openMaster").css("display","none");		
		})		
	});
	
</script>
</head>	
<body class="font1-medium">
<%@ include file="../topnav_member.jspf"%>
<%@ include file="uidChk.jspf" %>
<%@ include file="midChk.jspf" %>
	<!-- 본문은 left center right으로 나뉜다. -->
	<div id="main" class="row main">
		<aside class="left col-sm-3" id="left"></aside>
		<div class="col-sm-6 center" id="center" style="padding-top: 50px; padding-left: 20px;">
			<p style="font-size:2em">회원가입</p>
			<div class="row">
				<div class="btn btn-primary col-lg-6" id="openMember">일반회원</div>
				<div class="btn btn-primary col-lg-6" id="openMaster">숙박업소</div>
			</div>
				<%@ include file="registerMember.jspf"%>
				<%@ include file="registerMaster.jspf"%>
		</div>
		<aside class="col-sm-3 right" id="right"></aside>
	</div>

</body>
</html>