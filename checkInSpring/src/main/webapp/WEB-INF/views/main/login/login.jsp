<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Check in ! 로그인</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#mainDiv {
	width: 1060px;
	margin: 0px auto;
	background: #fff
}

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
	margin: 0px;
}
/*로그인 제목  */
#logTitle {
	height: 30px;
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
</style>
<script>
	function logChk() {
		//아이디, 비밀번호 확인
		var id = document.getElementById("uuid").value
		var pwd = document.getElementById("upwd").value

		if (id == "") {//아이디를 입력하지 않은 경우
			alert("아이디를 입력하세요");
			return false;
		}
		if (pwd == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		return true;
	}
	
	$(function(){
		$("#memberLoginBtn").click(function(){
			var result = logChk();
			var url = "/webapp/main/tryLoginUser";
			var uuid = $('#uuid').val();
			var upwd = $('#upwd').val();
			if(result == true){
				$.ajax({
					type:"POST",
					url:url,
					data:"uuid="+uuid+"&upwd="+upwd,
					success:function(result){
						
						if(result == ""){
							alert("로그인 실패");
						}else{
							alert("로그인 성공");
							location.href="/webapp";
						}												
					},
					error:function(e){
						console.log(e);
					}
				})
			}
			return false;
		});
		$("#masterLoginBtn").click(function(){
			var result = logChk();
			var url = "/webapp/main/tryLoginManager";
			var mid = $('#uuid').val();
			var mpwd = $('#upwd').val();
			if(result == true){
				$.ajax({
					type:"POST",
					url:url,
					data:"mid="+mid+"&mpwd="+mpwd,
					success:function(result){
						alert(result.aname);
						if(result == ""){
							alert("로그인 실패");
						}else{
							alert("로그인 성공");
							location.href="/webapp/master";
						}
					},
					error:function(e){
						console.log(e);
					}
				})
			}
				return false;
			});

	});
</script>

</head>
<body>
	<%@ include file="../topnav_member.jspf"%>
	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main" style="padding-top: 80px">
		<aside class="left col-sm-2" id="left"></aside>
		<div class="col-sm-8 center" id="center" class="font1-small container" style="top: 80px">

			<!-- 로그인 메인 -->
			<div id="id01">
				<div class="w3-card-4 w3-animate-zoom container" style="max-width: 600px">
					<div class="w3-center">
						<br> <img src="/webapp/img/img_avatar4.png" alt="Avatar" style="width: 30%" class="w3-circle w3-margin-top">
					</div>

					<form class="w3-container">

						<div class="w3-section">
							<label><b>Username</b></label> 
							<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="uuid" id="uuid" required> 
							<label><b>Password</b></label> 
							<input class="w3-input w3-border" type="password" placeholder="Enter Password" name="upwd" id="upwd" required>

							<div class="w3-section row">
								<button id="memberLoginBtn" class="w3-button w3-block w3-green border w3-padding col-sm-6 rounded">일반 회원 로그인</button>
								<button id="masterLoginBtn" class="w3-button w3-block w3-deep-orange border w3-padding col-sm-6 rounded">가맹점 회원 로그인</button>
							</div>
							<input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
						</div>
					</form>

					<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
						<span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
					</div>

				</div>
			</div>
		</div>
		<aside class="col-sm-2 right" id="right"></aside>
	</div>

	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;">
		<%@ include file="../companyInfo.jspf"%>
	</footer>

</body>
<script>




</script>
</html>