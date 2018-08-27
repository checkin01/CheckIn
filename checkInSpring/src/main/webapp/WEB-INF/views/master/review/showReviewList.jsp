<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 리뷰 보기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<!-- body 구성에 적용 되는 스타일 시트 -->
<script>	
function view(v) {
	//javascript
	var v = v;
	var userid = $("#uuid").val();
	alert(userid+", "+v);	
	
	ajax_reviewModal(userid,v);
		
}
function ajax_reviewModal(userid,v){
	var param = "uuid="+userid+"&v="+v;
	$.ajax({
		type:"GET",
		url:"/webapp/master/selectReviewAjax",
		data:param,
		contentType:"application/json;charset=UTF-8",
		success:function(result){				
			if(result != null){
				$("#grade").text(result.vgrade);
				$("#uid").text(userid);
				$("#date").text(result.writedate);
				$("#content").text(result.vcontent);
				$("#img1").attr('src',result.vimg1);
				
				$("#reviewModal").modal();
			}else{
				alert("죄송합니다. 다시 선택해주십시오.");				
			}
		},
		error:function(e){
			alert(e.responseText)
		}
	});
	
}
</script>
<style>
.rtitle:hover {
	cursor: pointer;
	color: #ddd;
}
</style>

</head>
<body>

	<!-- 
	본문은 left center right으로 나뉜다.
-->
	<%@ include file="../topnav_master.jspf"%>
	<div id="main" class="row main">
		<aside class="left col-sm-1" id="left"></aside>
		<div class="col-sm-10 center" id="center">
			
			<div class="font1-small" style="padding:20px 0;">
				리뷰 게시판
			</div>
			<div class="list-group">
				<div class="list-group-item">
					<!-- 글 태그 영역 -->
					<div class="row">
						<div class="col-sm-1 ct">번호</div>
						<div class="col-sm-5 ct">리뷰내용</div>
						<div class="col-sm-2 ct">글쓴이</div>
						<div class="col-sm-3 ct">등록일</div>
					</div>
				</div>
				<c:forEach var="vo" items="${list }">
				<div class="list-group">
					<div class="list-group-item">
						<div class="row">
							<div class="col-sm-1 ct v" >${vo.v }</div>						
							<div class="col-sm-5 ct rtitle" onclick='view(${vo.v})'>${vo.vcontent }</div>
							<div class="col-sm-2 ct">${vo.uname }</div>
							<div class="col-sm-3 ct">${vo.writedate }</div>
							<input type="hidden" id="uuid" name="uuid" value="${vo.uuid }"/>
							<input type="hidden" id="vgrade" name="vgrade" value="${vo.vgrade }"/>
						</div>
					</div>
				</div>
				</c:forEach>
				
				<!-- 검색 start -->
				<form action="list.jsp" id="searchFrm" class="form-inline">
					<div class="list-group-item list-group-item-action" style="text-align: center">
						<select name="searchKey" class="form-control">
							<option value="subject">제목</option>
							<option value="content">글내용</option>
							<option value="writer">작성자</option>
						</select> <input type="text" id="searchWord" name="searchWord" class="form-control" /> <input type="submit" value="Search" class="form-control" />
					</div>
				</form>
				<!-- 검색 end -->

				<ul class="pagination pagination-md justify-content-center form-inline" style="margin-top: 20px" id="pagination">
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Prev</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">1</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">2</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">3</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">4</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">5</a></li>
					<li class="page-item"><a href="manageBookingInfo.jsp" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>

	<aside class="col-sm-1 right" id="right"></aside>
	<!-- footer -->
	<footer id="footer" class="footer" style="width: 100%; font-size: 0.8em; margin-top: 150px">
		<%@ include file="../companyInfo.jspf"%>
	</footer>
</body>
<%@ include file="reviewModal.jspf"%>
</html>