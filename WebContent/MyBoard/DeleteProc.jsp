<%@page import="util.JavascriptUtil"%>
<%@page import="mymodel.BbsDAO"%>
<%@page import="mymodel.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
String number = request.getParameter("num");

BbsDAO dao = new BbsDAO();

BbsDTO dto = dao.selectView(number);

String id = session.getAttribute("USER_ID").toString();

int affected = 0;

if(id.equals(dto.getId())){
	dto.setNum(number);
	affected = dao.delete(dto);
}
else{
	JavascriptUtil.jsAlertBack("본인만 삭제 가능합니다.", out);
	return;
}

if(affected==1){
	JavascriptUtil.jsAlertLocation("삭제되었습니다.", "BoardList.jsp", out);
}
else{
	JavascriptUtil.jsAlertBack("삭제실패하였습니다.", out);
}

%>