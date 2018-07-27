<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체크인 회원가입</title>
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

<script>
   $(function() {
      //아이디 중복검사 창띄우기   
      $("#idChk").click(
            function() {
               //파일명,창이름,옵션(width,height,scrolling, )   
               window.open("idChkWin.jsp?userid=" + $("#userid").val(),
                     "win", "width=400,height=300");
            });
      //아이디중복 검사후 수정시 중복검사 취소하기
      $("#userid").keyup(function() {
         $("#idCheckResult").val("N");
      });
      //우편번호 검색을 눌렀을때 
      $("#ZipcodeSearch").click(function() {
         window.open("ZipcodeSearch.jsp", "zc", "width=400,height:500");
      });
      
      //회원가입 유효성 검사
      $("#regFrm").submit(function(){
    	  //비밀번호 검사
          data = $("#upwd").val();
          if (!reg.test(data)) { //정규표현식 검사 메소드 : true, false
        	  alert("비밀번호를 잘못입력하셧습니다...");
              return false;
          }
          if (data != $("#upwd2").val()) {
        	  alert("비밀번호가 일치하지 않습니다..");
              return false;
          }
          //이름검사 :한글,2~6글자까지 허용
          data = $("#uname").val();
          reg = /^[가-힣]{2,6}$/;
          if (!reg.test(data)) {
        	  alert("이름이 잘못입력되었습니다...")
              return false;
          }
          //주민번호
          data = $("#birth").val();
          //       89-02-28
          reg = /^[0-9]{4}[-](01|02|03|04|05|06|07|08|09|10|11|12){1}[-][0-3]{1}[0-9]{1}$/;
          if (!reg.test(data)) {
        	  alert("생년월일을 잘못입력하셨습니다...")
        	  return false;
		  }
          //전화번호 검사
          data = $("#tel").val();
          // 010, 011, 02, 031, 032, 051.....
          reg = /^[0-9]{2,3}[-][0-9]{3,4}[-][0-9]{4}$/;
          if (!reg.test(data)) {
              alert("전화번호를 잘못입력하셨습니다...");
              return false;
          }
          //이메일검사 : 아이디 @ 영. 영 . 영   goguma12345@korea.com, goguma12345@korea.co.kr
          data = $("#email").val();
          //                                            ()? : 한번나오던지, 안나오던지
          reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-z]{2,3}([.][a-z]{2,3})?/;
          if (!reg.test(data)) {
              alert("이메일을 잘못입력하셨습니다...")
              return false;
          }
          if ($("#location").val() == "") {
              alert("주소를 입력하세요....");
              return false;
          }
          alert("ok");
          return true;//submit실행됨
      });
   });
</script>
<style>
	#headerIng {width: 100%;height: 90px;margin-bottom: 10px}
	.row {margin-right: 2px}
	/*=========================================================  */
	#left{width:20%}
	#sideNav{width:12%}	
		#sideBar{position:relative;top:20px;left:10px;width:80%}	
			#navImg{width:100%}
			#sideNavCnt{background-color:#f8f8f8;position:relative;padding:10px 15px}
				#sideNavCnt ul,li {margin:0; padding:0;} 
				#sideNavCnt>ul>li{line-height:200%;list-style-type:none;color:black;}
				#sideNavCnt>ul>li:hover{font-weight:bold}
	/* 라디오 버튼 숨기기 */
	#center>input{display:none}
	/*컨텐츠 숨기기*/
	#center>div{display:none}
	
	/*컨텐츠 보이기	 :nth-of-type(1)*/
	#bookList:checked ~ div:nth-of-type(1){display:block}
	#point:checked ~ div:nth-of-type(2){display:block}
	#AttentionList:checked ~ div:nth-of-type(3){display:block}
	#infoModify:checked ~ div:nth-of-type(4){display:block}
</style>
</head>
<body>
<%@ include file="../nav.jspf"%>
<!-- 
   본문은 left center right으로 나뉜다.
-->
<div id="main" class="row main">
	<!-- 빈 영역 확보 -->
	<aside class="left" id="left" ></aside>
	
	<!-- side Nav -->
	<aside class="left" id="sideNav">
		<div id="sideBar">
			<div>
				<img src="../img/mypageNavTop.PNG" id="navImg"/>
			</div>
			<div id="sideNavCnt">
				<ul>
					<li><label for="bookList">예약내역</label></li>
					<li><label for="point">포인트</label></li>
					<li><label for="AttentionList">관심내역</label></li>
					<li><label for="infoModify">회원정보수정</label></li>
				</ul>						
			</div>
		</div>
	</aside>
	
	<!-- main -->
    <div class="col-sm-5 center" id="center">   	
    	<!--  check box 추가 -->
    	<!-- 홈 > 회원가입 -->
    	
	    <input type="radio" name="tab" id="bookList"/>
		<input type="radio" name="tab" id="point" checked/>
		<input type="radio" name="tab" id="AttentionList"/>
		<input type="radio" name="tab" id="infoModify"/>
		
	    <div>
	    	<br/>
	    		<h4 class= "font1-small">홈>마이페이지>예약내역</h4>
	    	<hr>
	    	
	    </div>
		<div>
			<br/>
	    		<h4 class= "font1-small">홈>마이페이지>포인트</h4>
	    	<hr>
			<img src="../img/1542.png"/>
		</div>
		<div>
			<br/>
	    		<h4 class= "font1-small">홈>마이페이지>관심내역</h4>
	    	<hr>
			<img src="../img/home.png"/>
		</div>
		<div>
			<br/>
	    		<h4 class= "font1-small">홈>마이페이지>회원정보수정</h4>
	    	<hr>
	    	<form method="post" action="changeInfo.jsp">
		    	회원님의 소중한 개인 정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.<br/>
		    	<input type="password" id="pwd"><br/>
		    	<input type="submit" name="확인">
	    	</form>
	    	<!-- <form method="post" id="regFrm" class="form-horizontal" action="registerFormOk.jsp">
		        <div class="form-group row">
		            <label class="col-sm-2" >아이디</label> 
		            <input type="text" name="userid" id="uid" class="form-control col-sm-10" disabled/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">비밀번호</label> 
		            <input type="password"name="userpwd" id="upwd" class="form-control col-sm-10" placeholder="비밀번호를 입력하세요"/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">비밀번호확인</label> 
		            <input type="password" name="userpwd2" id="upwd2" class="form-control col-sm-10"placeholder="비밀번호확인"/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">이름</label> 
		            <input type="text" name="username" id="uname" class="form-control col-sm-10"disabled/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">생년월일</label> 
		            <input type="date"name="birthday" id="birth" class="form-control col-sm-7" disabled/>
		            <div class="dropdown">
		                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">성별선택</button>
		                <div class="dropdown-menu" >
		                    <a class="dropdown-item" href="#">남성</a>
		                    <a class="dropdown-item" href="#">여성</a>
		                </div>
		            </div>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">연락처</label> 
		            <input type="text" name="phone" id="tel" class="form-control col-sm-10" placeholder="연락처입력(예:010-1234-5678)"/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">이메일</label> 
		            <input type="text" name="email" id="email" class="form-control col-sm-10" placeholder="이메일입력(예:abcde@.com)"/>
		        </div>
		        <div class="form-group row">
		            <label class="col-sm-2">지역</label>
		            <select class="form-control col-sm-3"  id="typeSelector" name = "">
		                <option>서울</option>
		                <option>경기</option>
		                <option>인천</option>
		                <option>강원</option>
		                <option>부산</option>
		                <option>경남</option>
		                <option>대구</option>
		                <option>경북</option>
		                <option>울산</option>
		                <option>대전</option>
		                <option>광주</option>
		                <option>전남</option>
		                <option>전북</option>
		                <option>제주</option>
		            </select>
		        </div>
		        <input type="submit" value="수정하기" class="btn btn-success form-control"/>
		    </form> -->
		</div>
    </div>
    <aside class="left" id="left" ></aside>
</div>
  
<!-- footer -->
<footer class="row footer" id="footer">
    <div class="col-sm-12"></div>
</footer>

</body>
</html>