/**
 * 
 */
//검색 버튼 클릭시
function whenClickSearchBtn(){
	
	var checkinout = $('#checkinout').val().split('-');
	var acheckin = checkinout[0].trim()+'-'+checkinout[1].trim()+'-'+checkinout[2].trim();
	var acheckout =  checkinout[3].trim()+'-'+checkinout[4].trim()+'-'+checkinout[5].trim();
	
	var atype = $('#selectedItem').text().split(' ')[1].trim();
	var agu =  $("#selectedGu").text();
	var asubway =$("#selectedSubway").text();
	var url = '/webapp/main/showAccoList?atype='+atype+'&checkinout='+$('#checkinout').val()+'&agu='+agu+'&asubway'+asubway;
	
	location.href = url;
	
}


