<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleMVC.jsp</title>
</head>
<body>
	<h2>간단한 MVC패턴 만들기</h2> 
	<!--  
		사용자가 요청할때 type 파라미터에 따라 서블릿은
		각기 다른 처리를 하게된다. 
	-->
	<ul>
		<li>
			<a href="./SimpleMVC">
				./SimpleMVC?type=
			</a>		
		</li>
		<li>
			<a href="SimpleMVC?type=greeting&id=nakja&pw=sangmir">
				SimpleMVC?type=greeting&id=nakja&pw=sangmir
			</a>		
		</li>
		<li>
			<a href="../13Servlet/SimpleMVC?type=date">
				SimpleMVC?type=date
			</a>		
		</li>
		<li>
			<a href="<%=request.getContextPath() %>/13Servlet/SimpleMVC?type=noparam">
				SimpleMVC?type=noparam
			</a>		
		</li>
	</ul>	
	
	<h3>요청결과</h3>
	<span style="color:red; font-size:2em;">
		${result }		
	</span>
	
	
	<!--  
		요청명을 결정할때는 View의 경로와 동일한 depth(깊이)로
		설정하는것이 좋다. 이미지의 경로, CSS, JS파일을 상대경로로
		링크했을때 경로가 깨지는 경우가 발생할수 있기 때문이다. 
		아래 이미지의 경우 요청명이
			"/13Servlet/SimpleMVC"일때는 ../부분이 표시되고
			"/SimpleMVC"일때는 ./부분의 이미지가 표시될 것이다. 
	-->
	<h3>이미지와 요청명</h3>
	<h4>../으로 이미지 표현</h4>
	<img src="../images/3.jpg" alt="구름하트" />
	
	<h4>./로 이미지 표현</h4>
	<img src="./images/3.jpg" alt="구름하트" />
	
	<h4>절대경로로 이미지 표현</h4>
	<img src="<%=request.getContextPath() %>/images/3.jpg" alt="구름하트" />
	<!-- 절대경로인 경우 요청명의 영향을 받지 않는다. -->

</body>
</html>








