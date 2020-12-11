<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  
	EL에서 Java클래스의 메소드 호출 절차 및 방법
	1.클래스와 메소드를 정의한다. 단 메소드 정의시 반드시
		public static으로 선언해야한다. 
	2.TLD파일을 생성한다. Tag Library Descriptor의 약자로
		WEB-INF폴더 하위에 생성한다. 웹어플리케이션 실행시 
		컨테이너가 해당 파일을 찾아 사용하게된다. 우리는 tlds폴더를
		생성한후 파일을 생성하고, fn.tld파일을 참조하여 작성하였다.
	3.생성한 TLD파일의 경로를 등록한다. 등록시 <jsp-config>
		엘리먼트를 통해 기술한다.
	4.jsp파일에서 EL을 통해 메소드를 호출한다. 
		페이지상단에 taglib지시어를 선언하고 호출시에는
		${접두어:메소드명(인자)} 형태로 호출한다.  
--%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/MyTagLib.tld" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyTagLib.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>Java코드로 메소드 호출하기</h3>
	<ul>
		<li>
			MyTagLig.isNumber("100")
				=> <%=MyTagLib.isNumber("100") %>
		</li>
	</ul>
	
	<h3>EL에서 자바클래스의 메소드 호출하기</h3>
	<ol>
		<li>
			my:isNumber("100") => ${my:isNumber("100") }
		</li>
		<li>
			my:isNumber("백20") => ${my:isNumber("백20") }
		</li>
	</ol>
	
	
	
	
	<h2>연습문제</h2>
	<h3>EL에서 getGender 함수 호출하기</h3>
	<pre>
		주민번호를 매개변수로 전달하면 성별을 판단하여 반환하는 메소드를
		EL에서 호출할수 있도록 절차대로 작성하시오.
		함수명 : getGender("123456-1000000") => 남자
			   getGender("123456-2000000") => 여자
		클래스 : eltag.MyTagLib 하위에 메소드 생성
	</pre>	
	<ul> 
		<li> 
			주민번호 123456-1000000 : ${my:getGender("123456-1000000") }
				<!-- => 남자 -->
		</li>
		<li>
			주민번호 123456-2000000 : ${my:getGender("123456-2000000") }
				<!-- => 여자 -->
		</li>
		<li>
			주민번호 123456-9000000 : ${my:getGender("123456-9000000") }
				<!-- => 잘못된 주민번호 -->
		</li>
	</ul>	
	
	
	
	
	
	
	
	
	
</body>
</html>