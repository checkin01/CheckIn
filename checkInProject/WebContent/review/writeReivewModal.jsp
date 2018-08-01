<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script>
	$(".star_rating span").click(function() {
	    $(this).parent().children("span").removeClass("on");
	    $(this).addClass("on").prevAll("span").addClass("on");
	    return false;
	});
  </script>
  <style>
    label{font-weight:bold;}
		form div{margin:0px;padding:0px}
			/* div border로 섹션 나누기 */
			.contentBox{border-top:solid 1px black;}
				.contentBox>div{border-bottom:solid 1px lightgray;margin-top:1%;margin-bottom:1%}				
				.contentBox:first-child div:last-child{border-bottom:solid 0px #F1F1F1}
				/* 룸 img 사이즈 고정 */
				img{ display: inline-block;vertical-align: middle;max-height: 100%;max-width: 100%;}
				/* 별스타일 */
				.star_rating {font-size:0; letter-spacing:0px;}
				.star_rating span {
				    font-size:22px;
				    letter-spacing:-4px;
				    display:inline-block;
				    margin-left:5px;
				    color:#ddd;
				    text-decoration:none;
				}
				.star_rating span:first-child {margin-left:0;}
				.star_rating span.on {color:#FBBD02;}
				textarea{height:180px}
				/* 사진첨부버튼,등록하기버튼 */
				#imgAddBtn{background-color:#fff;color:#5284FF;border:solid 1px #5284FF;font-weight:bold}
				#submitBtn{background-color:#5284FF;color:#fff;font-weight:bold}
  #reviewFrm .review-item{
  	margin:20px;
  }
  
  </style>
</head>
<body>

  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reviewModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal bd-example-modal-lg" id="reviewModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
         	<form id="reviewFrm" name="reviewFrm">
            	<div class="form-group">
            		<div class= row>
            			<label class="col-sm-2">별점</label>
            			<select class="form-control review-item col-sm-5">
            				<option>1</option>
            				<option>2</option>
            				<option>3</option>
            				<option>4</option>
            				<option>5</option>
            			</select>
            		</div>
            		<div class="row">
            			<label class="col-sm-2">제목</label>
            			<input type="text" class="form-control review-item" id="title" name="title"/>
            		</div>
            		<div class="row">
            			<label class="col-sm-2">내용</label>
            			<textarea type="text" class="form-control review-item" id="content" name="content"></textarea>
            		</div>
            		
            		<div class="row">
						<label class="col-sm-5"><i class="fa fa-file-image-o" style="font-size: 16px">
							이미지 등록(최대 3개) </i></label>
						<input type="file" id="img1" class="form-control review-item">
						<input type="file" id="img1" class="form-control review-item">
						<input type="file" id="img1" class="form-control review-item">
				</div>
            	</div>
            </form>
       
        </div>  
      </div>
    </div>
  </div>
  
</body>
</html>