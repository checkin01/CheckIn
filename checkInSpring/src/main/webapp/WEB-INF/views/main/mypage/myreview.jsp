<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In! 예약 관리</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/default.css">
<!-- 구글 차트 -->
<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
   <script src="../js/gchart_combo.js"></script>
<script src="../js/gchart_cal.js"></script>
<!-- body 구성에 적용 되는 스타일 시트 -->
<!-- daterangepicker-->
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="../js/daterangepicker.js"></script>
<link rel="stylesheet" href="../css/daterangepicker.css">
<style>


.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}

body{
   font-size:1em;
   
}
.pagination {
   margin: 10px auto;
}

.page-link {
   
}
#bookingList button{
   width:100%;
   height:100%;
   font-size:100%;
   display:inline-block;
}

#theme{text-overflow:ellipsis}


#bookListTop>div>div {
   font-size: 1em;
   

}

#aa{text-overflow:ellipsis}

#left {
	width: 15%
}

#center {
	padding: 20px 0px;
	margin: 0px;
	weight: 500px
}
#review_btns button{margin:0% 1%}
</style>

   

</head>
<body>
	<%@ include file="../topnav_member.jspf"%>


   <!-- 
   본문은 left center right으로 나뉜다. -->
   <div id="main" class="row main" style="position: relative; top: 80px; margin-bottom:100px">

     <!-- side Nav -->
		<aside class="left" id="sideNav">
			<%@ include file="rightside_nav.jspf"%>
		</aside>

    	
    	
   

      <!-- center -->
      
 <div class="col-sm-10 container" id="center">
      <span class="font1-small">홈>마이페이지>예약내역</span>
		
      
         
         <!-- 리스트 시작 -->         
         <div class="list-group" style="margin-top: 20px ; font-size:0.9em" id="bookingList">
          
      
            <!-- 숙박업소 리스트 중 한개 -->
       
     
           <div style="width: 100%; padding: 10px; ">
              

                  <div class="container input-group " id="review"
                     style="display:inline; padding-top: 10px">
                     <div class="row ">
                        <p class="col-sm-4 review-p border"; style=" font-size:1.5em;">
                           <class="fa fa-thumbs-o-up"><label> <b>평점 :</b> </label> <span
                              id="grade">★ ★ ★ ★ ★</span>
                        </p>
                        <p class="col-sm-4 review-p border"; style=" font-size:1.5em;">
                           <label><i class="fa fa-user"></i><b> 아이디 :</b> </label><span id="uid">123456</span>
                        </p>
                        <p class="col-sm-4 review-p border"; style=" font-size:1.5em;">
                           <label><i class="fa fa-calendar"></i><b> 날짜 :</b> </label> <span
                              id="grade">2018-07-24</span>
                        </p>
                     </div>
                     <label><i class="fa fa-comments"></i> <b>내용 </b></label>
                     <div class="row">
                        <!-- 쓰기는 예약 내역에서 가능 있음. -->
 		                        <div class="col-sm-8 font1-small border review-p" id="content">
		                           여기 짱 좋아요 ~</div>
                        

   <div class="col-sm-4">
<div class="w3-content w3-display-container" style="width:100% height:150" >
  <img class="mySlides" src="../img/4.png" style="width:100%">
  <img class="mySlides" src="../img/b_r.jpg"  style="width:100%">

  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
 
  </div>
  </div>
    
</div>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
                     
               </div>
         </div>
       
              
               
              <div class="row" id="review_btns"; style="text-align:right">
					<span class="col-sm-7"></span>
					<button id="writeBtn" data-toggle="modal" data-target="#reviewModal" class="btn col-sm-2 showreviewModal" style="background-color:#5284FF;color:#fff;font-weight:bold">리뷰수정</button>
					<button id="editBtn" data-toggle="modal" data-target="#reviewModal_edit" class="btn col-sm-2 showreviewModal_edit" style="background-color:#5284FF;color:#fff;font-weight:bold">리뷰삭제</button>
					
				</div>
                  
            

      <!-- 여기 안에 모두 담자 -->
      
   <!-- right -->
   <aside class="col-sm-1 right" id="right">
      
   </aside>
   
</div>

</div>


</body>
</html>