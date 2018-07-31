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

</head>
<body>
<%@ include file="../nav.jspf" %>
<!-- 
	본문은 left center right으로 나뉜다.
-->
<div id= "main" class="row main">
	
	<aside class="left col-sm-3" id="left">
	</aside>
	<div class="col-sm-7 center" id="center">
                
                <h1>글내용 보기 </h1>
		<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="userid"/><br/>
		제목 :<div></div><br/>
		글내용:<div></div><br/>
		첨부파일: </div><br/>
		<input type="button" value="자료실로가기"/>
	</form>
	   
	</div>
	<aside class="col-sm-2 right" id="right">
	
	</aside>


<!-- footer -->
<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
</footer>

</body>
</html>