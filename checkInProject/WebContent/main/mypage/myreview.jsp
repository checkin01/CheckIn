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
</style>

   

</head>
<body>

   <!-- 
   본문은 left center right으로 나뉜다. -->
   <div id="main" class="row main" style="position: relative; top: 80px; margin-bottom:100px">

      <aside class="left col-sm-2" id="left">
    	
      </aside>

      <!-- center -->
      <div class="col-sm-8 center" id="center">
         <h4 style="text-align:center" class="sub-title">나의 리뷰</h4>
         <!-- 리스트 시작 -->         
         <div class="list-group" style="margin-top: 20px ; font-size:0.9em" id="bookingList">
          
      
            <!-- 숙박업소 리스트 중 한개 -->
       
     
           <div style="width: 100%; padding: 10px; background: #e6ffe6;">
              

                  <div class="container input-group" id="review"
                     style="display:inline; padding-top: 10px">
                     <div class="row ">
                        <p class="col-sm-4 review-p border">
                           <class="fa fa-thumbs-o-up"></i> 평점 : </label> <span
                              id="grade">★ ★ ★ ★ ★</span>
                        </p>
                        <p class="col-sm-4 review-p border">
                           <label><i class="fa fa-user"></i> 아이디 : </label><span id="uid">123456</span>
                        </p>
                        <p class="col-sm-4 review-p border">
                           <label><i class="fa fa-calendar"></i> 날짜 : </label> <span
                              id="grade">2018-07-24</span>
                        </p>
                     </div>
                     <label><i class="fa fa-comments"></i> 내용 </label>
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
       
                <div style="text-align:right">
               
               <input type="submit" value="수정">
                  <input type="submit" value="삭제">
                  </div>
                  
                  
            

      </div>
      <!-- 여기 안에 모두 담자 -->
      
   <!-- right -->
   <aside class="col-sm-1 right" id="right">
      
   </aside>
   


</div>


</body>
</html>