<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
#themaModal .thema-btn{
	background-color: white;
	border: none;
	margin: 5px;
	text-align: center;
	font-size: 0.8em;
}
#themaModal .thema-select{
	width:80%;
}
#thema .cur-selected-thema .thema-btn{
	background-color: white;
	border: none;
	font-size: 0.5em;
	color:#ddd;
}

</style>

<body>
	<!-- Button to Open the Modal -->
	<div id= "thema">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#themaModal">테마</button>
		<div class = "thema-select cur-selected-thema">
			<!-- 클릭된 버튼 같이 추가 -->
		
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="themaModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
				<h3 class="font1-medium">테마 선택</h3>
				<!-- 테마선택하면 들어가는곳 -->
							<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				<!-- 테마선택하는곳 -->
				<p>원하는테마를선택하세요</p>			
					<button class="thema-btn unselected-btn">
						<i class="material-icons">movie</i>movie
					</button>					
					<button class="thema-btn unselected-btn">
						<i class="material-icons"> pause_circle_outline</i>vod
					</button>					
					<button class="thema-btn unselected-btn">
						<i class="material-icons"> speaker_phone</i>와이파이
					</button>					
					<button class="thema-btn unselected-btn">	
					<i class="material-icons">hotel</i>돌침대
					</button>					
					<button class="thema-btn unselected-btn">
					<i class="material-icons">drive_eta</i>주차가능	
					</button>					
					<button class="thema-btn unselected-btn">
					<i class="material-icons">pool</i>수영장	
					</button>					
					<button class="thema-btn unselected-btn">	
					<i class="material-icons">spa</i>스파
					</button>	
					<button class="thema-btn unselected-btn">	
					<i class="material-icons">cake</i>기념일
					</button>
					<button class="thema-btn unselected-btn">	
					<i class="material-icons">mic</i>노래방
					</button>						
					<button class="thema-btn unselected-btn">
					<i class="material-icons">volume_off</i>방음시설	
					</button>
					<button class="thema-btn unselected-btn">
					<i class="material-icons">local_dining</i>식사가능	
					</button>	
					<button class="thema-btn unselected-btn">
					<i class="material-icons">directions_bus</i>픽업가능	
					</button>
					<button class="thema-btn unselected-btn">
					<i class="material-icons">hot_tub</i>사우나	
					</button>	
					<button class="thema-btn unselected-btn">
					<i class="material-icons">fitness_center</i>헬스장	
					</button>
					<button class="thema-btn unselected-btn">
					<i class="material-icons">smoking_rooms</i>흡연가능	
					</button>
					<button class="thema-btn unselected-btn">
					<i class="material-icons">smoke_free</i>금연	
					</button>	
					<button class="thema-btn unselected-btn">
					<i class="material-icons">child_care</i>베이비존	
					</button>	
					<button class="thema-btn unselected-btn">
					<i class="material-icons">games</i>게임						
					</button>
					<button class="thema-btn unselected-btn">
					<i class="material-icons">computer</i>커플pc	
					</button>	
					<button class="thema-btn unselected-btn">
					<i class="material-icons">desktop_windows</i>3DTV	
					</button>
					</div>					
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">select</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		<div id="hiddenOption" style="display:block"/></div>
	<script>
	$(function(){

		/////////////////////////thema btn
		
		$('.thema-btn').click(function(){
			var html = $(this).html();
			var index = html.indexOf('</i>');
			html = html.substring(index).trim();
			index = html.indexOf('>');
			html = html.substring(index+1).trim();
			if($(this).hasClass('clicked-btn')==false){
				
					hiddenOption= $("#hiddenOption").text();
					hiddenOption = hiddenOption.concat(html);
					
					$("#hiddenOption").text(hiddenOption);
					$(this).css("color","#ddd");
					
					$(this).addClass('clicked-btn');
					
				}else{
					$(this).css("color","#000");
					$(this).removeClass('clicked-btn');
					var str = $("#hiddenOption").text();
					var str1 = html;
					str = str.replace(html,"");
					$("#hiddenOption").text(str);
			
				}
			
		});
		
		$('.thema-select').click(function(){
			var index = $('.thema-select> option:checked');
			
			alert(index);
			
			
		});
		
		function whenSaveThema(){
			
			var str = "숙박:네비게이션:호텔:스파";
			var str1 = "숙박";
			alert(str.indexOf(str1));
			alert(str.replace(str.substring(str.indexOf(str1),str1.length),""));
			alert(str);
			
		}
		
		/*
		$('#themaModal .unselected-btn').click(function(){
			var html = "<button class='thema-btn selected-btn' onmouseover='whenHover(this)' onmouseout='whenOut(this)'>";
			
			html += $(this).html();
			html +="<span style='font-size:4px; visibility:hidden'>x</span>";
			html += "</button>";
			
			$(this).removeClass('unselected-btn').addClass('selected-btn');
			$(".thema-select").append($(this));
			
			alert(html);
			
		});
		*/
	});
</script>
</body>
</html>