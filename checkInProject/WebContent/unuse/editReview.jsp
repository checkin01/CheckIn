<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check in! 리뷰 작성</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script> 

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/default.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
				
				.modal-dialog.modal-80size {
					  width: 80%;
					  height: 80%;
					  margin: 0;
					  padding: 0;
				}
					
				.modal-content.modal-80size {
					  height: auto;
					  min-height: 80%;
				}
				
				.modal-dialog.modal-fullsize {
					  width: 100%;
					  height: 100%;
					  margin: 0;
					  padding: 0;
				}
					
				.modal-content.modal-fullsize {
					  height: auto;
					  min-height: 100%;
					  border-radius: 0;
				}


</style>
</head>
<body class="font1-medium">

<!-- 
	본문은 left center right으로 나뉜다.
-->
	<div class="row main">
		<aside class="left col-sm-3" id="left">
		</aside>
		<div class="col-sm-6 center" id="center">
			<form method="post" action="">
			
			
			<!--  -->
			<input type="button" value="Fullsize Modal" class="btn btn-primary" data-toggle="modal" data-target="#myFullsizeModal">

			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeModal">
  				80%size Modal
			</button>

			<!-- 80% size Modal -->
			<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
			  <div class="modal-dialog modal-80size" role="document">
			    <div class="modal-content modal-80size">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">조금 부족한 Modal</h4>
			      </div>
			      <div class="modal-body">
			        	부족한 만큼 둥근 마음을 갖고 있습니다.
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Full size Modal -->
			<div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel">
			  <div class="modal-dialog modal-fullsize" role="document">
			    <div class="modal-content modal-fullsize">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">전지 Modal</h4>
			      </div>
			      <div class="modal-body">
			       	 화면을 가득 채우므로 가장자리가 각져있습니다.
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!--  -->
			
			
			
				<div class="contentBox">
					<div>
						<label class="col-sm-2">숙박후기 쓰기</label>
					</div>
					<div class="input-group">
						<div class="input-group-item col-lg-3 border">
								<img src="../img/cute2.jpg"/>						
						</div>
						<div class="col-sm-8">
							<span>===>>>숙박업소===</span><br/>
							<span>===>>>룸이름   ===</span><br/>
							<span>===>>>방문날짜===</span>
						</div>
					</div>
				</div>
				<div class="contentBox">
					<div>
						<label class="col-sm-2">별점</label>
						<span class="star_rating">
							<span class="fa fa-star on"></span>
							<span class="fa fa-star on"></span>
							<span class="fa fa-star on"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</span>
					</div>
					<div>
						<label  style="background-color:blue;" class="col-sm-2">숙박후기</label>
						<textarea style="background-color:pink;" name="content" id="content" class="col-sm-9" placeholder="자세한 숙박후기는 고객의 숙박시설 선택에 많은 도움이 됩니다."></textarea>       
					</div>
					<div>
						<label class="col-sm-2">사진첨부</label>
						<input type="button" id="imgAddBtn" class="btn font1-medium" value="사진첨부하기"/>
					</div>
					<div>
						<label class="col-sm-2">한줄요약</label>
						<input type="text" id="" class="col-sm-8" placeholder="한 줄 요약을 입력해 주세요">
					</div>
				</div>
				<center><input type="submit" value="등록하기" id="submitBtn" class="btn form-control col-sm-2 font1-medium"/></center>
			</form>               
		</div>
		<aside class="col-sm-3 right" id="right">
		</aside>
	</div>

	<!-- footer -->
	<footer class="row footer" id="footer">
			<div class="col-sm-12"></div>
	</footer>

</body>
</html>