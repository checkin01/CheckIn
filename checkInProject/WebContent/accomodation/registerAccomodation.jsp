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
<link rel="stylesheet" href="../css/default.css"> <!-- body 구성에 적용 되는 스타일 시트 -->

</head>
<body>
<%@ include file="../nav.jspf" %>
<!-- 
	본문은 left center right으로 나뉜다.
-->
<div id= "main" class="row main">
<aside class="left col-sm-3" id="left">
</aside>
	<div class="col-sm-7 center" id="center" style="top:50px">
		<!--  -->
		<form id="dataform" class="form-horizontal font1-medium" method="post" action="writeOk.jsp" enctype="multipart/form-data">
		<input type="hidden" value="mid" id="mid" name="mid" />
		
		<!-- 숙박 업소 유형 -->		
		<div class="form-group row">
    			<label class= "col-sm-4" for="typeSelector">숙박 업소 유형</label>
    			<select class="form-control col-sm-5"  id="typeSelector" name = "">
			      <option>호텔</option>
			      <option>모텔</option>
			      <option>펜션</option>
			      <option>호스텔</option>
			      <option>게스트하우스</option>
			    </select>
		</div>
		

		<!-- 숙박 업소 이름 -->		
		<div class="form-group row">
			<label class="col-sm-4">숙박 업소 이름</label>
			<input class="form-control col-sm-5" id="mid" name="mid" type="text" placeholder="숙박업소 이름을 입력하세요."/>
		</div>
		
		<!-- 숙박 업소 주소 검색 -->		
		<label class="form-group row">
  			<input type="file" id="file" class="custom-file-input">
  			<span class="custom-file-control"></span>
		</label>
		
		<!-- 숙박 업소 전화번호 검색  -->		
		<label class="form-group row">
  			<input type="file" id="file" class="custom-file-input">
  			<span class="custom-file-control"></span>
		</label>
		
		<!-- 숙박 업소 체크인시간, 체크아웃시간  -->	
		<div class="form-group row">
			<label class="col-sm-4">글제목</label>
			<input class="form-control col-sm-10" id="title" name="title"  type="text" placeholder="제목을 입력하세요."/>
		</div>
		
		
		<!-- 숙박 업소 최대 머무를 수 있는 날짜, 최대 예약 가능한 날짜  -->	
		
		
		<!-- 이미지 등록 
		<div class="form-group row">
			<label class="col-sm-4">이미지 등록</label>
			<textarea class="form-control col-sm-10" name="content" id="content" placeholder="글 내용을 입력하세요"></textarea>
			<script>
				CKEDITOR.replace("content");
			</script>
		</div>
		-->
		<!-- 기타 정보들.. checkbox -->
		<label for="info">기타 정보</label>
		<div class="form-group row"  id="info">
			<div class="input-group-prepend d-inline-flex p-3">
    			<div class="input-group-text">
		     		 <input type="checkbox">
		     		 <span class="col-sm-3">스파</span>
		    	</div>
		  	</div>
		  	
		 	<div class="input-group-prepend d-inline-flex p-3">
    			<div class="input-group-text">
		     		 <input type="checkbox">
		     		 <span class="col-sm-3">애견</span>
		    	</div>
		  	</div>
		  	
		  	<div class="input-group-prepend d-inline-flex p-3">
    			<div class="input-group-text">
		     		 <input type="checkbox">
		     		 <span class="col-sm-3">애견</span>
		    	</div>
		  	</div>
		  	
		  	<div class="input-group-prepend d-inline-flex p-3">
    			<div class="input-group-text">
		     		 <input type="checkbox">
		     		 <span class="col-sm-3">바베큐</span>
		    	</div>
		  	</div>
		  	
		  	<div class="input-group-prepend d-inline-flex p-3">
    			<div class="input-group-text">
		     		 <input type="checkbox">
		     		 <span class="col-sm-3">오션뷰</span>
		    	</div>
		  	</div>
		  	
		 </div>
		
		<!-- notice 주의 사항들 textfield --<
		<div class="form-group row">
			<label class="col-sm-2">파일 선택</label>
			<input type="file" class="form-control col-sm-10"  name="filename" id="filename"/>
		</div>
		
		<!-- 등록 버튼 -->	
		<input type="submit" value="파일 등록" class="btn btn-success form-control"/>
	</form>
</div>
<aside class="col-sm-2 right" id="right">
	
</aside>
</div>

<!-- footer -->
<footer class="row footer" id="footer">
		<div class="col-sm-12"></div>
</footer>
</body>
</html>