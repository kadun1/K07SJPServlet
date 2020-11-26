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
	String actionString = "액션태그 페이지에서 생성한 변수";
	%>
	<h2 style="color:red">액션태그 페이지 입니다.</h2>
	<ul>
		<li>페이지영역 :
			<%=pageContext.getAttribute("pageVar") %></li>
		<li>리퀘스트영역 :
			<%=request.getAttribute("requestVar") %></li>
	</ul>
</body>
</html>