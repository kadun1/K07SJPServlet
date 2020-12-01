<%@page import="java.util.Collection"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h2>EL의 연산자들</h2>
	
	<h3>EL에서의 null연산</h3>
	<%
	/*
	Java에서는 null과 연산을 수행할수 없다.
	하지만 EL에서는 null을 0으로 간주하여 계산한다.
	*/
	//int a = null + 10; //<-null과의 연산이므로 에러발생됨
	%>
	
	\${null+10 } : ${null+10 }<br/> <!-- 결과 : 10 -->
	<!-- 
		최초 실행시에는 파라미터가 엇으므로 0으로 간주되어 계산된다.
		만약
			해당페이지?myNumber=20    => 결과 30출력
			해당페이지?myNumber=	   => 0으로 간주되어 10출력
			해당페이지?myNumber=Three => 문자는 숫자로 변경할수 없어 에러발생됨
	 -->
	\${param.myNumber+10 } : ${param.myNumber+10 } <br />
	<br />
	<!-- 
		null값과 비교연산에서는 false를 반환한다.
		산술연산에서는 0으로 간주하고 연산을 진행하지만
		비교연산은 null과 비교자체가 불가능하기 때문이다.
	 -->
	\${param.myNum>10 } : ${param.myNum>10 } <br />
	\${param.myNum<10 } : ${param.myNum<10 } <br />
	<br />
	
	<h3>JSTL로 EL에서 사용할 변수선언</h3>
	<%
	/*
	EL에서는 JSP에서 선언한 변수는 직접 사용할수 없다. 값이 출력되지 않고
	null로 인식하게 된다.
	JSP에서 변수를 EL에서 사용할수 없는 이유는 EL은 4가지 영역에 저장된
	속성들만 사용하기 때문이다. JSTL도 동일한 특성을 가지고 있다.
	*/
	String varScriptLet = "스크립트렛 안에서 변수선언";
	%>
	<!-- null로 인식되어 결과는 100이 출력된다. -->
	\${varScriptLet+100 } : ${varScriptLet+100 } <br />
	
	<!-- 
	JSP에서 선언한 변수를 EL에서 사용해야 할 경우에는 JSTL의
	set태그를 이용해서 변수를 선언한다. JSP에서 선언후 바로
	사용하려면 영역에 저장해야 한다.
	 -->
	<c:set var="elVar" value="<%=varScriptLet %>" />
	\${elVar } : ${elVar }
	
	<h3>EL변수에 값 할당</h3>
	<c:set var="fnum" value="9" />
	<c:set var="snum" value="5" />
	\${fnum=99 } : ${fnum=99 }
	
	<h3>EL의 산술연산자</h3>
	<ul>
		<li>\${fnum+snum } : ${fnum+snum }</li>
		<li>\${fnum/snum } : ${fnum/snum }</li>
		<li>\${fnum div snum } : ${fnum div snum }</li>
		
		<li>\${fnum % snum } : \${fnum % snum }</li>
		<li>\${fnum mod snum } : ${fnum mod snum }</li>
		
		<li>\${"100"+100 } : ${"100"+100 }</li>
		<li>\${"Hello~"+"EL~" } : \${"Hello!"+"EL~" }</li>
		<li>\${"일"+2 } : \${"일"+2 }</li>
	</ul>
	<h3>EL의 비교연산자</h3>
	<c:set var="fnum" value="100" />
	<c:set var="snum" value="90" />
	<ul>
		<li>\${fnum > snum } : ${fnum > snum }</li>
		<li>\${100 > 90 } : ${100 > 90 }</li>
		
		<li>\${"JAVA"=='JAVA' } : ${"JAVA"=='JAVA' }</li>
		<li>\${"Java"=='JAVA' } : ${"Java"=='JAVA' }</li>
	</ul>
	
	<h3>EL의 논리연산자</h3>
	<ul>
		<li>\${5>=5 && 10!=10 } :
			${5 ge 5 and 10 ne 10 }</li>
		<li>\${5>6 || 10<100 } :
			${5 gt 6 or 10 lt 100 }</li>
	</ul>
	
	<h3>EL의 삼항연산자</h3>
	\${10 gt 9 ? "참이닷" : "거짓이닷" }
		: ${10 gt 9 ? "참이닷" : "거짓이닷" }
		
	<h3>EL의 empty 연산자 : null일때  true를 반환하는 연산자</h3>
	<%
		String nullStr = null;
		String emptyStr = "";
		Integer[] lengthZero = new Integer[0];
		Collection sizeZero = new Vector();
	%>
	
	<c:set var="elnullStr" value="<%=nullStr %>" />
	<c:set var="elemptyStr" value="<%=emptyStr %>" />
	<c:set var="ellengthZero" value="<%=lengthZero %>" />
	<c:set var="elsizeZero" value="<%=sizeZero %>" />
	<ul>
		<li>\${empty elnullStr } : ${empty elnullStr }</li>
		<li>\${not empty elemptyStr } : ${not empty elemptyStr }</li>
		<li>{empty ellengthZero ? "배열크기가0임" : "배열크기가0이아님" }</li>
		<li>${not empty elsizeZero ? "컬렉션에 저장된 객체있음" : "컬렉션에 저장된 객체없음" }</li>
	</ul>
	
</body>
</html>