<%-- 
	JSP의 스크립트 요소들
	
	지시자(Directive) : 페이지 속성을 지정하거나 외부문서를 
		포함(include)할때 사용한다. 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	선언부(Declaration) : 스크립트렛이나 표현식에서 사용할
		메소드를 선언할때 사용한다. 함수는 주로 중복해서 사용하는
		경우가 많으므로  src(자바영역)을 많이 사용한다. 
--%>
<%! 
public int add(int a , int b){
	int result = a + b;
	return result;
}

public int subtract(int a, int b){
	int result = a - b;
	return result;
}

public void showPrint(String str, JspWriter out){
	try{
		out.println("받은문자열:"+ str);
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%> 
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
	<h2>JSP의 스크립트 요소들(Scripting Elements)</h2>
	
	<%@ include file="../01Directive/IncludePage.jsp" %>
	
	<%-- 
	스트립트릿(Scriptlet) : 주로 JSP코드를 작성하고 실행할때 사용하는
		영역이다. 스트립트릿은 head영역, body영역 어디서든 사용할수
		있다. 또한 <script>, <style>태그 내부에서도 사용할 수 있다.
	--%>
	<% 
	int value1 = 3;
	int value2 = 9;
	
	int addResult = add(value1, value2);
	int subResult = subtract(value1, value2);	
	%>	
	
	<%-- 
	표현식(Expression) : 변수를 웹브라우저상에 출력할때 사용한다. 
		JS의 document.write()와 동일한 역할을 한다. 표현식 사용시
		주의할점은 문장끝에 ;(세미콜론)을 생략해야 하는것이다. 
	--%>
	<h3>표현식으로 변수를 화면에 출력하기</h3>
	<%=value1 %> + <%=value2 %> = <%=addResult %>
	<br />
	<%=value1 %> - <%=value2 %> = <%=subResult %>
	<br />
	<%
		showPrint("우리는KOSMO", out);
	%>
	<br />
	오늘 날짜는 : <%=todayStr %> [인클루드 된 파일에서 가져옴]
</body>
</html>