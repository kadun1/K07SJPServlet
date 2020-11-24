<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
%>       
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
	<h2>사용자 요청과 관련된 정보들 출력하기</h2>
	<!-- ul>li*7 -->
	<ul>
		<li>데이터전송방식 : <%=request.getMethod() %></li>
		<li>전체URL : <%=request.getRequestURL() %></li>
		<li>도메인을 제외한 URL : <%=request.getRequestURI() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버명 : <%=request.getServerName() %></li>
		<li>서버포트 : <%=request.getServerPort() %></li>
		<!--  
		로컬 웹서버의 주소는 localhost 혹은 127.0.0.1 과 같은 루프백을 사용하나
		request객체를 통해 출력하면 0:0:0:0:0:0:0:1 이와같이 출력된다. 
		-->
		<li>사용자IP주소 : <%=request.getRemoteAddr() %></li>
		<li>QueryString : <%=request.getQueryString() %></li>
		<li>전송된값확인 : <%=request.getParameter("paramHan") %></li>
	</ul>
</body>
</html>

