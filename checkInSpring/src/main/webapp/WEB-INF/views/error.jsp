<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body style="margin:100px">
	<img src = "/webapp/img/error.png">
	<br/>
	<br/>
	<h2><%
		String errorStr = request.getParameter("error");
		int error = 1;
		if(errorStr != null){
			error =	Integer.parseInt(errorStr);	
		}
		String msg = "";
		switch(error){
		case 500:
		msg = "500 서버 에러가 발생했습니다! ";
		break;
		case 404:
			msg = "404 잘 못된 경로 입니다!";
			break;
		case 400:
			msg ="400 페이지에 오류가 있습니다!";
			break;
		case 405:
			msg ="405 페이지에 오류가 있습니다!";
			break;
			default :
				msg = error+" 알 수 없는 오류가 발생 했습니다.";
				break;
		}
		%></h2>
	
</body>
</html>