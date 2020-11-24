<%@page import="java.util.Enumeration"%>
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
	<h2>요청 헤더정보 출력하기</h2>
<%
/*
getHeaderNames() : 클라이언트의 요청헤더의 name속성을 모두 
	얻어오는 함수로 반환타입은 Enumeration형이다. 
*/
	Enumeration headers = request.getHeaderNames();
	/*
	요청헤더값은 사용하는 웹브라우저의 종류에 따라 다를수 있다. 
	최근에는 웹표준(크로스 브라우징)을 위해 각 회사에서 사용하는 
	엔진을 동시에 탑재하는 추세로 흘러가고 있다. 
	*/
	while(headers.hasMoreElements()){
		
		String headerName = (String)headers.nextElement();
		/*
		getHeader(헤더명) : 요청헤더값을 얻어올때 사용하는 함수. 
		*/
		String headerValue = 
			request.getHeader(headerName);
		out.println(
			String.format("헤더명:%s, 헤더값:%s<br/>",
				headerName, headerValue));
	}
%>
	<h2>요청헤더명으로 브라우저 종류 알아내기</h2>
<%
	String webBrowser = request.getHeader("user-agent");
	if(webBrowser.toUpperCase().contains("MSIE")){
		out.println("인터넷익스플로러");
	}
	else if(webBrowser.toUpperCase().contains("FIREFOX")){
		out.println("파이어폭스");
	}
	else if(webBrowser.toUpperCase().contains("CHROME")){
		out.println("크롬");
	}
	else{
		out.println("기타브라우져");
	}
%>
</body>
</html>