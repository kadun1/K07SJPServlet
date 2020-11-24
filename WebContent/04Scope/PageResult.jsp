<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<h2>이전페이지에서 저장한 페이지영역의 속성 읽기</h2>
	<%
	Object obj = pageContext.getAttribute("pageDate");
	String dateString = "";
	if(obj instanceof Date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dateString = sdf.format((Date)obj);
	}
	
	MemberDTO m1 = (MemberDTO)pageContext.getAttribute("pageMember1");
	String m1Str = String.format("아이디:%s,비번:%s,이름:%s,가입일:%s",
						m1!=null ? m1.getId():"",
						m1!=null ? m1.getPass():"",
						m1!=null ? m1.getName():"",
						m1!=null ? m1.getRegidate():"");
	%>	
	<ul>
		<li>Date객체 : <%=dateString %></li>
		<li>MemberDTO객체 : <%=m1Str %></li>
	</ul>


</body>
</html>