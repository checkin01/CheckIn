<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true"%>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in! 예약내역</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="http://gsgd.co.uk/sandbox/jquery/easing/"></script>
<link rel="stylesheet" href="/webapp/css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->

<style>
#headerIng {
	width: 100%;
	height: 90px;
	margin-bottom: 10px
}

.row {
	margin-right: 2px
}
/*=========================================================  */
#left {
	width: 15%
}

#center {
	padding: 20px 0px;
	margin: 0px;
	weight: 400px
}
</style>
<script>
	function whenclickwritemodal(b,a,r,checkin,checkout){
		$(".b").val(b);
		$(".a").val(a);
		$(".r").val(r);
		$(".checkin").val(checkin);
		$(".checkout").val(checkout);
		$("#content").val('');
		$("#file").val('');
		
	}
	
	function whenclickviewmodal(v){
		$(".view").css("display","block");
		$(".edit").css("display","none");
		$("#editimgbtn").css("display","block");
		
		var params = "v="+v;
		$.ajax({
			type:"get",
			url : "/webapp/main/mypage/getReview",
			data : params,
			dataType : 'json',
			contentType:'application/json;charset=UTF-8',
			success: function(result){
				//var $result = $(result);
				$("#revieweditFrm .v").val(v);
				$("#revieweditFrm .content").text(result.vcontent);
				var grade = result.vgrade;
				$("#revieweditFrm .grade").text(grade);
				if(grade!=null && grade != 0)
					$(document).find('option[name='+grade+']').attr('selected','selected');
				
				var img1 = result.vimg1;
				img1 = img1.split('/')[3];
				$("#revieweditFrm .img1").text(img1);
				$("#reviewModal_edit").modal('show');
				$("#revieweditFrm #eimg1").attr('src',result.vimg1);
			},error:function(error){
				alert("죄송합니다. 리뷰 읽어 오기에 실패 했습니다.");
				console.log(error.responseText);
			}
		})
	}
	function whenclickcancle(b){
		var result = confirm("정말 예약을 취소 하시겠습니까? ");
		if(result == true){
			url = "/webapp/main/mypage/trycanclebooking?b="+b;
			location.href=url;
		}
		
	}
</script>
</head>
<body>
<fmt:formatDate value="${now}" pattern="yy/MM/dd" var="nowDate" />

	<%@ include file="../topnav_member.jspf"%>
	<!-- 
   본문은 left center right으로 나뉜다.
-->
	<div id="main" class="row main">
		<!-- 빈 영역 확보 -->
		<aside class="left" id="left"></aside>

		<!-- side Nav -->
		<aside class="left" id="sideNav">
			<%@ include file="rightside_nav.jspf"%>
		</aside>

		<!-- main -->
		<div class="col-sm-7 center container" id="center">
			<!--  check box 추가 -->
			<!-- 홈 > 회원가입 -->
			<span class="font1-small">홈>마이페이지>예약내역</span>
			<hr />
		<c:forEach var="list" items="${lst }">
				<!-- 예약 현황 리스트 시작 -->
		<div>
		<!-- 예약 현황 1 시작 -->
		<div class="input-group">
			<div class="input-group-item col-lg-3 border">
				<c:if test="${list.aimg1 != null}">
				<img src='${list.aimg1}' style="width:100%;height:100%"/>
				</c:if>
			</div>
			<div class="container input-group-item col-lg-9">
				<table class="table">
					<thead>
						<tr>
							<th>예약날짜</th>
							<th>체크인</th>
							<th>체크아웃</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${list.writedate }</td>
							<td>${list.bcheckin }</td>
							<td>${list.bcheckout }</td>
						</tr>
					</tbody>
				</table>
				<table class="table">
					<thead>
						<tr>
							<th>숙박업소</th>
							<th>룸번호(이름)</th>
							<th>연락처</th>
							<th>인원수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${list.aname }</td>
							<td>${list.rname }</td>
							<td>${list.atel }</td>
							<td>${list.bcount }</td>
						</tr>
					</tbody>
				</table>
				<div class="row"id="review_btns">
					<span class="col-sm-5"> </span>
					
					<fmt:parseDate value="${list.bcheckin}" pattern="YY/MM/dd" var="checkin" />
					<fmt:parseDate value="${list.bcheckout}" pattern="YY/MM/dd" var="checkout" />
					
					<c:if test="${list.cancel != 1}">
						<c:if test="${list.v != 0}">
						<button id='editBtn' onclick="whenclickviewmodal(${list.v})" type="button" class="btn btn-secondary col-sm-2 showreviewModal_edit" style="font-weight:bold">리뷰보기</button>
						</c:if>
						<c:if test="${list.v == 0}">
							<c:if test ="${nowDate >= checkin }">
							<button id="writeBtn" onclick="whenclickwritemodal(${list.b},${list.a},${list.r},'${list.bcheckin}','${list.bcheckout }')" data-toggle="modal" data-target="#reviewModal" class="btn btn-primary col-sm-2 showreviewModal" style="font-weight:bold; padding-left:10px">리뷰작성</button>
							</c:if>
						</c:if>
						<c:if test ="${nowDate < checkin }">
						<button id="cancleBtn" class="btn btn-danger col-sm-2" style="margin-left:10px" onclick='whenclickcancle(${list.b})'>예약취소</button>
						</c:if>
					</c:if>
					<c:if test ="${list.cancel == 1}">
						<span style="color:grey">최소된 예약 입니다.</span>
					</c:if>
				</div>
			</div>
		</div>
		<!-- 예약 현황 1 끝 -->
	</div>
	<!-- 예약 현황 리스트 끝 -->

	<br/>
	</c:forEach>			
		</div>
		<aside class="left" id="left"></aside>
		<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px;">
		<%@ include file="../companyInfo.jspf"%>
	</footer>
	</div>

	
	<%@ include file="../review/writeReviewModal.jspf"%>
	<%@ include file="../review/editReviewModal.jspf"%>
</body>
</html>