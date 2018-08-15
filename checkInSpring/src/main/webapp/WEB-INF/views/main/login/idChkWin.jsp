<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
<meta name="viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#setId").click(function(){
			var userid=$("#userid").val();
			opener.document.getElementById("userid").value = userid;
			opener.document.getElementById("idCheckResult").value = "Y";
			self.close();
			
		});
	});
</script>
<%
	String userid = request.getParameter("uid");
	//RegisterDAO dao = new RegisterDAO();
	//int result = 0;
	//if(userid == null || userid.equals("")){
	//	result=-1;
	//}else{
	//	result = dao.checkId(userid);
	//}
	
%>
</head>
<body>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					아이디 중복 검사
				</div>
				<div class="modal-body">
					<form action="idChkWin.jsp">
						<input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요." value="<%=userid %>" />
						<input type="submit" class="btn btn-success" value="아이디체크"/>
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
</body>
</html>