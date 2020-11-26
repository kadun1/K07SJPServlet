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
	<h2>포워드 & 리다이렉트된 결과 페이지</h2>
	<ul>
		<li>
			페이지영역 확인하기 :
			<%=pageContext.getAttribute("pageVar") %>
		</li>
		<li>
			리퀘스트영역 확인하기 :
			<%=request.getAttribute("requestVar") %>
		</li>
	</ul>
</body>
</html>