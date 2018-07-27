	$(function(){
		$("#rname").focusout(function(){
			checkRname();
		});
		
		$("#price").focusout(function(){
			checkPrice();
		});
		
		$("#min").focusout(function(){
			var result = checkMin();			
			if(result == true){				
				compareMaxMin();
			}
		});

		$("#max").focusout(function(){
			var result = checkMax();
			if(result == true) {
				compareMaxMin();
			}
		});		
	
		$("#bedroom").focusout(function(){
			checkBedroom();
		});
		
		$("#diningroom").focusout(function(){
			checkDiningroom();
		});
		
		$("#kitchen").focusout(function(){
			checkkitchen();
		});
		
		$("#restroom").focusout(function(){
			checkRestroom();
		});
	});
	
	function compareMaxMin(){
		var min = $("#min").val();
		var max = $("#max").val();
		var result = true;
		if(min=="" || min==null || max==""|| max==null) return false;
		if(min>max){
			msg = "최소 수용 인원이 최대 수용 인원을 초과할 수 없습니다."
			result = false;
			$("#minMaxMsg").html(msg);
		}else{
			$("#minMaxMsg").html("");
		}
	}
	
	function checkRname(){	
		//객실 명 검사		
		var rname = $("#rname").val();
		var reg = /^[a-zA-Z가-힣0-9]{1,20}$/;	
		var msg = "";
		var result = true;
		
		if(!reg.test(rname)){
			msg = "한글과 영문 대 소문자,숫자를 사용하세요(특수기호, 공백 사용 불가).";
			result = false;
		}
		
		if(rname=="" || rname == null){
			msg="필수정보입니다.";			
			result = false;
		}
		$("#rnameMsg").html(msg);
		return result;
	}
	
	function checkPrice(){
		//객실 요금 검사
		var price = $("#price").val();
		var reg = /^[0-9]{1,8}$/;	
		var msg = "";
		var result = true;
		
		if(!reg.test(price)){
			msg = "숫자를 사용하세요.";
			result = false;
		}
		if(price=="" || price == null){
			msg="필수정보입니다.";
			result = false;
		}		
		$("#priceMsg").html(msg);
		return result;
	}
	
	function checkMin(){
		//최소 수용인원 검사
		var min = $("#min").val();
		var msg = "";
		var result = true;
		
		if(min<=0){
			msg = "최소 수용 인원은 1명 이상이어야 합니다.";
			result = false;
		}
	
		if(min == "" || min == null){
			msg = "필수정보입니다.";
			result = false;
		}		
		$("#minMsg").html(msg);
		return result;
	}
	
	function checkMax(){
		//최대 수용인원 검사
		var msg = "";
		var max = $("#max").val();
		var result = true;
	
		if(max == "" || max == null){
			msg = "필수정보입니다.";
			result = false;
		}
		
		if(max<=0){
			msg = "최대 수용 인원은 1명 이상이어야 합니다.";
			result = false;
		}
		
		$("#maxMsg").html(msg);
		return result;
	}
	
	function checkBedroom(){
		//침실
		var bedroom = $("#bedroom").val();
		var msg = "";
		var result = true;
		
		if(bedroom<0){
			msg = "0보다 작을 수 없습니다.";
			result = false;
		}
		if(bedroom=="" || bedroom == null){
			msg = "필수정보입니다.";
			result = false;
		}		
		$("#bedroomMsg").html(msg);
		return result;
	}
	
	function checkDiningroom(){
		//거실
		var diningroom = $("#diningroom").val();
		var msg = "";
		var result = true;
		
		if(diningroom<0){
			msg = "0보다 작을 수 없습니다.";
			result = false;
		}
		if(diningroom=="" || diningroom == null){
			msg = "필수정보입니다.";
			result = false;
		}		
		$("#diningroomMsg").html(msg);
		return result;
	}
	
	function checkKitchen(){
		//주방
		var kitchen = $("#kitchen").val();
		var msg = "";
		var result = true;
		
		if(kitchen<0){
			msg = "0보다 작을 수 없습니다.";
			result = false;
		}
		if(kitchen=="" || kitchen == null){
			msg = "필수정보입니다.";
			result = false;
		}		
		$("#kitchenMsg").html(msg);
		return result;		
	}
		
	function checkRestroom(){
		//화장실
		var restroom = $("#restroom").val();
		var msg = "";
		var result = true;
		
		if(restroom<0){
			msg = "0보다 작을 수 없습니다.";
			result = false;
		}

		if(restroom=="" || restroom == null){
			msg = "필수정보입니다.";
			result = false;
		}
		$("#restroomMsg").html(msg);
		return result;	
	}

	$(function(){
		$("#dataform").submit(function(){
			var result = true;
			result &= checkRname();
			result &= checkPrice();
			result &= checkMin();
			result &= checkMax();
			result &= checkBedroom();
			result &= checkDiningroom();
			result &= checkKitchen();
			result &= checkRestroom();
			if(result == 1) return true;
			else return false;
		});
	});
