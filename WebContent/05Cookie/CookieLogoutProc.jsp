<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명 : CookieLogoutProc.jsp --%>
<%
/*
	쿠키를 지울때는 값은 빈값으로 유효시간은 0으로 만들어준다.
*/
CookieUtil.makeCookie(request, response, "LoginId", "", 0);

/*
	JSP코드와 JS코드가 같은 블럭내에 존재하면 JSP코드가
	우선적으로 실행된다.
*/
//reponse.sedRedirect("CookieLoginMain.jsp");
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="CookieLoginMain.jsp";
</script>
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

</body>
</html>