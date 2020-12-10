<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
//메일 발송을 위한 객체생성
SMTPAuth smtp = new SMTPAuth();

String mailContents = ""
	+"<table border=1>"
	+"<tr>"
	+"	<td>제목	</td>"
	+"	<td>"+request.getParameter("subject")+"</td>"
	+"</tr>"
	+"<tr>"
	+"	<td>내용</td>"
	+"	<td>"+request.getParameter("content")+"</td>"
	+"</tr>"
	+"<tr>"
	+"	<td>이미지</td>"
	+"	<td><img src=\"http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg\" alt=\"\" /></td>"
	+"</tr>"
	+"</table>";

//메일을 보내기위한 여러가지 폼값을 Map컬렉션에 저장
Map<String, String> emailContent = new HashMap<String, String>();
emailContent.put("from", request.getParameter("from"));
emailContent.put("to", request.getParameter("to"));
emailContent.put("subject", request.getParameter("subject"));
//emailContent.put("content", request.getParameter("content"));
emailContent.put("content", mailContents);

//내용이 null값이 아니라면 이메일 발송
if(request.getParameter("content")!=null){
	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		out.print("메일발송성공");
	}
	else{
		out.print("메일발송실패");
	}
	
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmailTextSending.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h2>이메일 발송하기</h2>
<form method="post" name="mailForm">
<table border=1>
	<tr>	
		<td> 
			보내는사람 : 
			<input type="text" name="from" value="kadun@naver.com" />
		</td>
	</tr>
	<tr>	
		<td>
			받는사람 : 
			<input type="text" name="to" value="kadunjj@gmail.com" />
		</td>
	</tr>
	<tr>	
		<td>
			제목 : 
			<input type="text" name="subject" value="" />
		</td>
	</tr>
	<tr>
		<td>
			<textarea name="content" cols="30" rows="10"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<button type="submit">이메일발송</button>
		</td>
	</tr>
</table>
</form>
</body>

</html>