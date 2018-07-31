/**
 * 
 */
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