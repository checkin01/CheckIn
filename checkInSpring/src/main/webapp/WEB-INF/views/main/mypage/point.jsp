<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->
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
	#center{padding:20px 0px;margin:0px;weight:400px}
		#pointTable{text-align:center;border-top:1px solid #ccc;border-bottom:1px solid lightgray}
	#center h3, #pointTable th{
		font-family:'Jua';
	}
</style>
</head>
<body>

<%@ include file="../topnav_member.jspf"%>
<!-- 
   본문은 left center right으로 나뉜다.
-->
<div id="main" class="row main">
	<!-- 빈 영역 확보 -->
	<aside class="left" id="left" ></aside>
	
	<!-- side Nav -->
	<aside class="left" id="sideNav">
		<%@ include file="rightside_nav.jspf"%>
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
		            <td><div id="upoint"class="font1-small">${upoint }</div></td>
		        </tr>
		    </tbody>
	  	</table>		
    </div>
    <aside class="left" id="left" ></aside>
</div>
  
	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;">
		<%@ include file="../companyInfo.jspf"%>
	</footer>

</body>
</html>