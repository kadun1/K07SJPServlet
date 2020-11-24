<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
String ckState = "";
String chkVal = request.getParameter("chkVal");
if(chkVal!=null && chkVal.equals("1")){	
	Cookie cookie = new Cookie("PopupClose", "off"); 	
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(60*60*24);	//유효시간으로 하루(86400초)를 설정한다. 	
	response.addCookie(cookie);
	ckState = "쿠키 생성됨";
}
else{
	Cookie cookie = new Cookie("PopupClose","");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(0);//유효시간이 0이므로 사용할수 없는 쿠키가된다.
	response.addCookie(cookie);
	ckState = "쿠키 제거됨";
}

out.print(ckState);
%>