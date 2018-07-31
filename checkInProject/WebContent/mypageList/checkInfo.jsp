<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체크인 회원정보확인/수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
   <!-- 
   uid 아이디
   upwd 
   uname 
   tel 
   email 
   birth 앞자리 뒷자리한개 
   location 앞에만 
   info(체크박스) -->
<style>
	#headerIng {width: 100%;height: 90px;margin-bottom: 10px}
	.row {margin-right: 2px}
	/*=========================================================  */
	body{background-color:#F5F5F5}
	#sideNav{width:12%}	
		#sideBar{position:relative;top:20px;left:10px;width:80%}	
			#navImg{width:100%}
			#sideNavCnt{background-color:#f8f8f8;position:relative;padding:10px 15px}
				#sideNavCnt>a{line-height:2.3em;color:black}
				#sideNavCnt>a:hover{font-weight:bold;text-decoration:none}
	#center{padding:50px 40px;margin:20px auto;background-color:#fff}
		#pwdChk{position:relative;left:40%}
		#reset{position:relative;left:41%}
</style>
</head>
<body>
<%@ include file="../nav.jspf"%>
<!-- 
   본문은 left center right으로 나뉜다.
-->
<div id="main" class="row main">
	<!-- main -->
    <div class="col-sm-5 center container" id="center">   	
    	<!--  check box 추가 -->
    	<!-- 홈 > 회원가입 -->
		<span class="font1-small">홈>마이페이지>회원정보수정</span>
		<hr/>
		<h3>회원정보확인</h3>
		<span class="font1-small">
			<span style="color:skyblue;font-weight:bold">회원님</span>의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
		</span><br/><br/>
		<form method="post" action="changeInfo.jsp">
			<div class="table-responsive">
				<table class="table">
					<thead>
					<tr>
						<th style="background-color:#AFDCE8"><span style="font-size:0.9em">비밀번호</span></th>
						<th><input type="password" id="pwd"/></th>
					</tr>
					</thead>
				</table>
			</div>
			<input type="submit" id="pwdChk" value="확인" class="btn btn-success"/>
			<input type="button" id="reset" value="취소" class="btn "/>
		</form>
		
    </div>
    <aside class="left" id="left" ></aside>
</div>
  
<!-- footer -->
<footer class="row footer" id="footer">
    <div class="col-sm-12"></div>
</footer>

</body>
</html>