<%@page import="mymodel.BbsDAO"%>
<%@page import="mymodel.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>    
<%

request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("USER_ID").toString());

BbsDAO dao = new BbsDAO();

int affected = dao.insertWrite(dto);

if(affected==1){
	
	response.sendRedirect("BoardList.jsp");
}
else{
%>

<script>
	alert("글쓰기에 실패했습니다.");
	history.go(-1);
</script>

<%
}
%>
