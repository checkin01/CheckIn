<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
body{}
#mainDiv{width:1060px;margin:0px auto;background:#fff}
#content {
	position: relative;
	width: 900px;
	margin: 0 auto;
}
/*상단로고 */
#logo {
	border-bottom: 3px blue solid
}
/*현재위치 */
#loc {
 margin:0px;
}
/*로그인 제목  */
#logTitle {
	height:30px;
	/*background-image:url(tit_login.gif);
           background-repeat:no-repeat;*/
	background: url(tit_login.gif) no-repeat;
}
/*로그인 메인 */
#mainDiv {
	position: relative;
	height: 260px
	
}
/*로그인 폼 */
#logFrm {
	width: 445px;
	margin: 0px 15px;
	height: 220px;
	float: left;
	padding-top: 40px;
	text-align: center
}

.f1 {
	width: 340px;
	float: left
}

.f1>div {
	width: 110px;
	height: 28px;
	float: left;
	margin: 5px 0px
}

.f1>input {
	width: 210px;
	height: 28px;
	float: left;
	margin: 5px 0px;
	border-radius: 5px;
	border: solid lightgray 1px
}

.f2 {
	width: 85px;
	float: left
}

.f2>input {
	width: 100px;
	height: 84px;
	background: #2866e1;
	color: #fff;
	font-size: 1.2em;
	font-weight: bold;
	border: 1px solid #2866e1
}

.f3 {
	clear: left;
	padding-top: 50px;
}
</style>
<script>
   function logChk(){
      //아이디, 비밀번호 확인
      var id = document.getElementById("userid").value
      var pwd = document.getElementById("userpwd").value
      
      if(id==""){//아이디를 입력하지 않은 경우
         alert("아이디를 입력하세요");
         return false;
      }
      if(pwd==""){
         alert("비밀번호를 입력하세요");
         return false;
      }
      return true;
   }
</script>

</head>
<body >
	<%@ include file="../nav.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main" >
		<aside class="left col-sm-2" id="left" ></aside>
		<div class="col-sm-8 center" id="center" class="font1-small" style="top:80px">
				<!-- 현재 위치 -->
				<div id="loc" style="top:20px" class="font1-small">홈>로그인</div>
				<!-- 로그인 메인 -->
				<div id="mainDiv">
					<!-- 로그인 폼 --> 
					<h1><strong>로그인</strong></h1>
					<div id="logFrm" style="margin:0 auto" >
						<input type="radio" name="memChange">회원 <input type="radio" name="memChange">가맹점
						<!-- 회원로그인폼 -->
						<!-- post, get -->
						<form action="login2.jsp" method="post" onsubmit="return logChk()">
							<div id="member">
								<div class="f1">
									<div class= "font1-small">아이디</div>
									<input type="text" name="userid" id="userid" />
									<div class= "font1-small">비밀번호</div>
									<input type="password" name="userpwd" id="userpwd" />
								</div>
								<div class="f2">
									<input type="submit" value="LOGIN" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<aside class="col-sm-2 right" id="right"></aside>
		</div>

		<!-- footer -->
		<footer class="row footer" id="footer">
			<div class="col-sm-12"></div>
		</footer>

</body>
</html>