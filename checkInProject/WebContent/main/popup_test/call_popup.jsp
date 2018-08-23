<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	//window.open(URL, name, specs, replace)
	function openPopup(){
		window.open('popup.jsp', 'Check in !', "width=600,height=600,top=300,left=500");
		 popname.window.focus();
	}
	
	function popupCallback(str){
	    alert("This is callback:" + str);
	  
	}

</script>
</head>
<body>
<a href="javascript:openPopup();">Click to open popup</a>
</body>
</html>