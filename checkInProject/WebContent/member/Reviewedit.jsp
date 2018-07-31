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
<script src="//cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script>

</head>
<body>
<%@ include file="../nav.jspf" %>
<!-- 
	본문은 left center right으로 나뉜다.
-->
<div id= "main" class="row main">
	
	<aside class="left col-sm-3" id="left">
	</aside>
	<div class="col-sm-7 center" id="center" style=padding:80px>
                <h1>리뷰  수정하기</h1>
   <form class="form-horizontal" id="editFrm" method="post" >
      <input type="hidden" name="num"/>
      <div class="form-group row">
         <label class="col-sm-1">작성자</label>
         <div class="col-sm-10"></div>         
      </div>
      <div class="form-group row">
         <label class="col-sm-1">글제목</label>
         <input type="text" class="form-control col-sm-10" name="subject" id="subject" placeholder="글제목을 입력하세요"/>         
      </div>
      <div class="form-group row">
         <label class="col-sm-1">글내용</label>
         <textarea name="content" id="content" class="col-sm-11"></textarea>
         <script>
            CKEDITOR.replace("content");
         </script>         
      </div>
      <div class="form-group row">
         <label class="col-sm-2">비밀번호</label>
         <input type="password" class="form-control col-sm-3" name="pwd" id="pwd" placeholder="수정시 필요합니다.." maxlength="4"/>
      </div>
      <input type="submit" value="수정" class="btn btn-success form-control col-sm-11"/>
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