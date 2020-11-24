<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
String isPopup = "on";//on상태일때 팝업이 열린다.
Cookie[] cookies = request.getCookies();
if(cookies!=null){		
	//모든 쿠키를 가져온다.
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		//팝업닫기 쿠키가 있다면 저장된 값을 가져온다. 
		if(cookieName!=null && cookieName.equals("PopupClose")){
			isPopup = cookieValue;
		}
	}		
}

out.print(isPopup);
if(isPopup.equals("on")){
%>
	<script>
	window.onload = function(){
		window.open('Popup.jsp','Notice1','width=400,height=300');
	}
	</script>
<%
}
%>
</body>
</html>