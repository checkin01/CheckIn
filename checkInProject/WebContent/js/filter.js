/**
 * 

var locs = ['서울','경기','인천','강원','제주','대전','충북','충남','부산','울산','경남','대구','경북','광주','전남','전북'];
$(document).ready(function(){
var locHtml = "<div class='pop-main'>";
locHtml+="<input type='button' class='searchOption' id='searchMethod1' style='background:green;"+
"value='주소로 검색하기' onClick='whenClickSearchOption(1)'>";
for(var i = 0 ; i < locs.length  ; i++ ){
	locHtml += "<button class='btn pop-item' id='"+locs[i]+"' onclick='whenSelectedLoc("+i+")'>"+locs[i]+"</button>";
}
locHtml+="</div>";
               
$("#location").popover({
	titile:"지역",
	html:true,
	trigger:"focus",
	placement: "bottom",
	content:locHtml
	});               
});

function whenSelectedLoc(i){
	$("#selectedLocation").html(" "+locs[i]);              
}
 */

// modal 창 띄우기
	$(function() {
		$(".showLocModal").click(function() {
			$('#locModal').modal('show');
		});

		$(".subway").click(function() {
			var addr2 = $(this).text();
			$(".selectedGu").text('');
			$(".selectedSubway").text(addr2);
		});
		$(".gu").click(function() {
			var addr2 = $(this).text();
			$(".selectedGu").text(addr2);
			$(".selectedSubway").text('');
		});
	});
	// modal 창 옵션 선택시 보이는 Panel 변경
	function whenClickSearchOption(i) {
		var searchMethod1 = $("#searchMethod1");
		var searchMethod2 = $("#searchMethod2");
		if (i == 1) {
			$("#gu_panel1").css("display", "block");
			$("#searchMethod1").css("background", "green");
			$("#searchMethod2").css("background", "#ddd");
			$("#gu_panel2").css("display", "none");
		} else if (i == 2) {
			$("#gu_panel1").css("display", "none");
			$("#gu_panel2").css("display", "block");
			$("#searchMethod2").css("background", "green");
			$("#searchMethod1").css("background", "#ddd");
		}
	}
	function whenSelectedSido(i) {
		$("#sido").val(locs[i] + " ");
	}