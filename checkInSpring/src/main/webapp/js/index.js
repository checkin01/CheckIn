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



// ajax로 추천 받은 파일을 가져와서 img 뿌려주기
function ajax_recommendation() {
	var asubway = $("#selectedSubway").text();
	var agu = $("#selectedGu").text();
	var params = "";
	if (asubway != "")
		params = "asubway=" + asubway;
	else if (agu != "")
		params = "agu=" + agu;
	
	$.ajax({
		type : "get",
		url : "/webapp/main/recommend",
		data : params,
		dataType : 'json',
		contentType : 'applicaiton/json;charset=UTF-8',
		success : function(result) {
			if(result != "" && result != null){
			var $result = $(result);
			alert($result);
				$result.each(function(i, val) {
					var tag;
					var aurl = "#";
					var aimg = val.aimg1;
					if (i == 0)
						tag = $('#form1');
					else if (i == 1)
						tag = $('#form2');
					else if (i == 2)
						tag = $('#form3');
					// tag 값 변경하기
					$(tag).find('.agrade').text(val.agrade);
					$(tag).find('.aaddr').text(val.aaddr);
					$(tag).find('.aname').text(val.aname);
					$(tag).find('.aurl').attr('href', aurl);
					$(tag).find('.aimg').attr('src', aimg);
					$(tag).find('.a').text(val.a);
					$(tag).find('.atel').text(val.atel);
	
				});
			}else{
				alert("결과 없음");
			}
		},
		error : function(e) {
			console.log(e.responseText);
		}
	})
}
