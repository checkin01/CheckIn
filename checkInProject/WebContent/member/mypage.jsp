<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in! 포인트</title>
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
	#left{width:15%}
	#sideNav{width:12%}	
		#sideBar{position:relative;top:20px;left:10px;width:80%}	
			#navImg{width:100%}
			#sideNavCnt{background-color:#f8f8f8;position:relative;padding:10px 15px}
				#sideNavCnt>a{line-height:2.3em;color:black}
				#sideNavCnt>a:hover{font-weight:bold;text-decoration:none}
	#center{padding:20px 0px;margin:0px;weight:400px}
		#pointTable{text-align:center;border-top:1px solid #ccc;border-bottom:1px solid lightgray}
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
				<a href="<%=request.getContextPath() %>/member/mypage.jsp">
					<img src="../img/mypageNavTop.PNG" id="navImg"/>
				</a>
			</div>
			<div id="sideNavCnt">
				<a href="<%=request.getContextPath() %>/mypageList/bookList.jsp">예약내역</a><br/>
				<a href="<%=request.getContextPath() %>/mypageList/point.jsp"><b>포인트</b></a><br/>
				<a href="<%=request.getContextPath() %>/mypageList/checkInfo.jsp">회원정보확인/수정</a>				
			</div>
		</div>
	</aside>
	
	<!-- main -->
    <div class="col-sm-5 center container" id="center">   	
    	<!--  check box 추가 -->
    	<!-- 홈 > 회원가입 -->
		<span class="font1-small">홈>마이페이지>포인트</span>
		<hr/>		
		<h3>포인트</h3>
		<span class="font1-small">포인트를 클릭하면 상세 내역을 확인하실 수 있습니다.</span>
		<br/><br/>
		<table id="pointTable" class="table">
		    <thead class="thead-light">
		        <tr>
		            <th>예약 포인트</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>0</td>
		        </tr>
		    </tbody>
	  	</table>		
    </div>
    <aside class="left" id="left" ></aside>
</div>
  
<!-- footer -->
<footer class="row footer" id="footer">
    <div class="col-sm-12"></div>
</footer>

</body>
</html>