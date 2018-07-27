/**
 * 				숙박업소유형 : type
				숙박업소이름 : aname
				숙박업소도로면주소 : addr
				숙박업소 전화번호 : tel
				checkin/chechout 시간 HH:MM
				img1,img2,img3
				기타 정보 - info (checkbox)
 * 
 * 
 */
var blankMsg = "필수 정보입니다.";
var wrongMsg = "잘못 입력하셨습니다.";
$(function(){
	$('#checkin').timepicki({start_time:["03", "00", "PM"]});
	$('#checkout').timepicki({start_time:["12", "00", "AM"]});
	
	$("#dataform").submit(function(){
		var result = true;
		result &= checkAname();
		result &= checkTel();
		result &= checkAddr();
		result &= checkMaxsleepdate();
		result &= checkMaxreservedate();
		result &= checkCheckIn();
		result &= checkCheckOut();
		if(result==0)return false;
		else return true;
	});
	
	$("#aname").focusout(function(){
		checkAname();
	});
	$("#tel").focusout(function(){
		checkTel();
	});
	
	$("#maxsleepdate").focusout(function(){
		checkMaxsleepdate();
	});
	$("#maxreservedate").focusout(function(){
		checkMaxreservedate();
	});
});


function checkAname(){
	var msg = "";
	var result = true;
	var data =$("#aname").val();
	var reg = /^[a-zA-Z가-힣0-9]{1,20}$/;  //표현식
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	
	if(!reg.test(data) && result == true){
		msg = wrongMsg;
		msg += " 1~20 글자 영어,한글,숫자만 입력하세요.";
		result= false;
	}
	$("#anameMsg").html(msg);
	return result;
}

function checkAddr(){
	var msg = "";
	var result = true;
	var data =$("#addr").val();
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	$("#addrMsg").html(msg);
	return result;
}


function checkTel(){
	var msg = "";
	var result = true;
	var data =$("#tel").val();
	var reg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}$/;  //표현식
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	if(!reg.test(data) && result != false){
		msg = wrongMsg;
		result= false;
	}
	$("#telMsg").html(msg);
	return result;
}

function checkCheckIn(){
	var msg = "";
	var result = true;
	var data =$("#checkin").val();
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	$("#checkinMsg").html(msg);
	return result;
}

function checkCheckOut(){
	var msg = "";
	var result = true;
	var data =$("#checkout").val();
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	$("#checkoutMsg").html(msg);
	return result;
}

function checkMaxsleepdate(){
	var msg = "";
	var result = true;
	var data =$("#maxsleepdate").val();
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	$("#maxsleepdateMsg").html(msg);
	return result;
}

function checkMaxreservedate(){
	var msg = "";
	var result = true;
	var data =$("#maxreservedate").val();
	if(data == ""){
		msg = blankMsg;
		result= false;
	}
	$("#maxreservedateMsg").html(msg);
	return result;
}



function checkBlankForm(){
	var type =$("#typeSelector option:selected").val();
	var aname = $("#aname").val();
	var addr = $("#addr").val();
	var tel = $("#tel").val();
	var checkin = $("#checkin").val();
	var checkout = $("#checkout").val();
	var maxsleepdate =  $("#maxsleepdate").val();
	var maxreservedate =  $("#maxreservedate").val();
	var img1 =  $("#img1").val();
	var img2 =  $("#img2").val();
	var img3 =  $("#img3").val();
	var info = "";
	var notice =  $("#notice").val();
	$("input[name=info]:checked").each(function() {
		  info += $(this).val() +":";
	});

}
