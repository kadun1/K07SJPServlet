<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseJDBC.jsp</title>
</head>
<body>
<body>
<%
/*
	web.xml에 입력된 컨텍스트 초기화 파라미터를 가져온다. 
	이때 application 내장객체를 사용한다. 
*/
String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");
System.out.println(driver +" "+ url);//로그확인

//model패키지에 정의된 MemberDAO클래스를 통해 오라클 연결을 시도한다.
MemberDAO dao = new MemberDAO(driver, url);

//로그인 페이지에서 전송한 아이디, 패스워드 폼값을 받아 저장한다.
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pwd");

//저장된 변수를 isMember()의 파라미터로 전달하면서 호출한다. 
boolean memberFlag = dao.isMember(id, pw);
if(memberFlag==true){
	System.out.println("회원입니다.");	
	response.sendRedirect("../common/Welcome.jsp");
}
else{
	System.out.println("회원이 아닙니다.");
	
	String jsAlert = "<script>";
	jsAlert += "alert('회원이 아닙니다');";
	jsAlert += "history.go(-1);";
	jsAlert += "</script>";
	
	out.println(jsAlert);
}
%>
</body>
</html>