<%@page import="mymodel.BbsDAO"%>
<%@page import="mymodel.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String number = request.getParameter("pnum");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setNum(number);
dto.setTitle(title);
dto.setContent(content);

BbsDAO dao = new BbsDAO();

int affected = dao.updateEdit(dto);

if(affected==1){
	response.sendRedirect("BoardView.jsp?pnum="+dto.getNum());
}
else{
%>
<script>
	alert("수정에 실패했습니다.");
	history.go(-1);
</script>
<%
}
%>
