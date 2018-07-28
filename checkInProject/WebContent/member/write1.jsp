<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 글쓰기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="//cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script>
<script>
	$(function(){
	 //form에서 submit이벤트 발생시 호출
	 $("#dataFrm").submit(function(){	 
	     if($("#title").val()== ""){
	         alert("글제목을 입력하세요....");
	         return false;
	     }
	    /* //if($("#content").val()==""){
	         alert("글내용을 입력하세요....");
	        return false;
	     } */
	     if($("#filename").val()== ""){
	         alert("업로드할 파일을 선택하세요....");
	         return false;
	  
	     return true;
	});

	});
</script>
</head>
<body>
<div class="container">
     <h1>자료실 글쓰기</h1>
     <!--         enctype="multipart/form-data" 는 폼안에 파일선택하는 기능이 있을때는 반드시 있어야 함.                                                                   -->
     <form class="form-horizontal" id="dataFrm" method="post" action="writeOk.jsp" enctype="multipart/form-data">
     <%System.out.println("세션 아이디"+session.getAttribute("logId")); %>
        <input type="hidden" name="userid" id="userid" value="<%=session.getAttribute("logId")%>"/>
     
      <div class="form-group row">
             <label class= "col-sm-2">글제목</label>
             <input type="text" class="form-control col-sm-10" name="title" id="title" placeholder="글제목을 입력하세요.."/>
        </div>
         <div class="form-group row">
             <label class= "col-sm-2">글내용</label>
             <textarea name="content" id="content" class="col-sm-10"></textarea>
             <script>
             	CKEDITOR.replace("content");
             </script>
        </div>
         <div class="form-group row">
             <label class= "col-sm-2">파일선택</label>
             <input type="file" class="form-control col-sm-10" name="filename" id="filename"/>
        </div>
      <input type="submit" value="파일올리기"class="btn btn-success form-control"/>
      </form>
</div>

</body>
</html>