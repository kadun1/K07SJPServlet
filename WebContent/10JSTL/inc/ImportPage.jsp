<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<%request.setCharacterEncoding("UTF-8");%>
	<h4>포함된 페이지(ImportPage.jsp)</h4>
	<hr />
	<h5>리퀘스트 영역에 저장된 속성값</h5>
	저장된값(방법1) :${requestVar }
	<br />
	저장된값(방법2) : ${reqestScope.requestVar }
	<h5>파라미터로 전달된 값</h5>
	파라미터1 : ${param.user_id }
	<br />
	파라미터2 : ${param.user_pw }
	<<hr />
</body>
</html>