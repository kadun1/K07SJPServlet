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
	<h2>이전페이지의 리퀘스트 영역에 저장된 속성읽기</h2>
	<%
	MemberDTO m1 = (MemberDTO)request.getAttribute("requestMember1");
	String m1Str = 
		String.format("아이디:%s,비번:%s,이름:%s,가입일:%s",
			m1!=null ? m1.getId():"" , 
			m1!=null ? m1.getPass():"",
			m1!=null ? m1.getName():"",
			m1!=null ? m1.getRegidate():"");
	%>
	<ul>
		<li>Integer타입 : 
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입 : 
			<%=request.getAttribute("requestString") %></li>		
		<li>MemberDTO타입 : <%=m1Str %></li>
	</ul>
	
	<h2>파라미터로 전달된 값 출력하기</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		out.println(request.getParameter("param"));
	%>
</body>
</html>