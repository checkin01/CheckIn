	$(function(){
		$("#rname").focusout(function(){
			rcheckRname();
		});
		
		$("#rprice").focusout(function(){
			rcheckPrice();
		});
		
		$("#rmin").focusout(function(){
			var result = checkMin();			
			if(result == true){				
				rcompareMaxMin();
			}
		});

		$("#rmax").focusout(function(){
			var result = checkMax();
			if(result == true) {
				rcompareMaxMin();
			}
		});		
	
		$("#rbedroom").focusout(function(){
			rcheckBedroom();
		});
		
		$("#rdiningroom").focusout(function(){
			rcheckDiningroom();
		});
		
		$("#rkitchen").focusout(function(){
			rcheckkitchen();
		});
		
		$("#rrestroom").focusout(function(){
			rcheckRestroom();
		});
	});
	
	function rcompareMaxMin(){
		var min = $("#rmin").val();
		var max = $("#rmax").val();
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
	
	function rcheckRname(){	
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
	
	function rcheckPrice(){
		//객실 요금 검사
		var price = $("#rprice").val();
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
	
	function rcheckMin(){
		//최소 수용인원 검사
		var min = $("#rmin").val();
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
	
	function rcheckMax(){
		//최대 수용인원 검사
		var msg = "";
		var max = $("#rmax").val();
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
	
	function rcheckBedroom(){
		//침실
		var bedroom = $("#rbedroom").val();
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
	
	function rcheckDiningroom(){
		//거실
		var diningroom = $("#rdiningroom").val();
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
	
	function rcheckKitchen(){
		//주방
		var kitchen = $("#rkitchen").val();
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
		
	function rcheckRestroom(){
		//화장실
		var restroom = $("#rrestroom").val();
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
			result &= rcheckRname();
			result &= rcheckPrice();
			result &= rcheckMin();
			result &= rcheckMax();
			result &= rcheckBedroom();
			result &= rcheckDiningroom();
			result &= rcheckKitchen();
			result &= rcheckRestroom();
			if(result == 1){
				getAtheme();
				return true;
			}
			else return false;
		});
	});
