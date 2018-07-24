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

$(function(){
	$('#checkin').timepicki();
	$('#checkout').timepicki();
	
	$("#dataform").submit(function(){
		checkBlankForm();
		return false;
		
	});
});

function checkBlankForm(){
	var type =$("#typeSelector option:selected").val();
	var aname = $("#aname").val();
	var aname = $("#addr").val();
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
	if(type=="")
}
