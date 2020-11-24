<%@page import="model.MemberDTO"%>
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
<h2>인클루드 된 페이지</h2>
	
	<h3>page영역에 저장된 객체</h3>
	<%
	MemberDTO pageMember =
		(MemberDTO)pageContext.getAttribute("pageMember");
	String pMemberStr = 
		String.format("아이디:%s,이름:%s,비번:%s,등록일:%s",
			pageMember!=null ? pageMember.getId():"",
			pageMember!=null ? pageMember.getPass():"",
			pageMember!=null ? pageMember.getName():"",
			pageMember!=null ? pageMember.getRegidate():"");
	out.println(pMemberStr);
	%>
	
	<h3>request영역에 저장된 객체</h3>
	<%
	MemberDTO requestMember =
		(MemberDTO)request.getAttribute("requestMember");
	String rMemberStr = 
		String.format("아이디:%s,이름:%s,비번:%s,등록일:%s",
			requestMember!=null ? requestMember.getId():"",
			requestMember!=null ? requestMember.getPass():"",
			requestMember!=null ? requestMember.getName():"",
			requestMember!=null ? requestMember.getRegidate():"");
	out.println(rMemberStr);
	%>

</body>
</html>