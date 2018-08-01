<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도로명주소찾기</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		//form에서 submit이벤트 발생시 호출
		$("#searchAddr").submit(function() {
			if ($("#addr").val() == ""&&$("#tel").val() == ""&&$("#gil").val() == "") {
				alert("3가지중하나라도입력하세요...");
				return false;		
			}
			return true;
		});
	});
</script>
<title>주소 찾기</title>
</head>
<body>
	<div>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">도로명 주소 검색</div>
				<div class="modal-body container">
					<form class="list-group" action="searchAddr.jsp" id="searchAddr">
						<label class="form-control col-sm-12">주소<input type="text" class="form-control col-sm-12" id="addr" name="addr" placeholder="예:서울시 구로구 구로동 10-10" value=""/></label> 
						<label class="form-control col-sm-12">도로명<input type="text" class="form-control col-sm-12" id="gil" name="gil" placeholder="도로명을 입력하세요" value="" /></label> 
						<label class="form-control col-sm-12">전화번호<input type="text" class="form-control col-sm-12" id="tel" name="tel" placeholder="전화번호를 입력해주세요" value="" /></label>
						<input type="submit" class="btn btn-success" value="검색" />
					</form>
					<div>
						<%
							//if(result==0){ 
							//	out.print("<span id = 'span'>"+userid+"</span>"+"는 사용 할 수 있습니다.</br>"
							//	+ "<input type='button' class='btn btn-success' value='아이디 사용하기' id='setId' name='setId'/>");
							//}else if(result==-1){out.print("아이디를 입력하세요.</br>");} 
							//else out.print("중복 검사 결과 사용 할 수 없습니다.</br>");
						%>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>