<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 
	if태그
	-JSTL의 if문은 시작태그와 종료태그를 통해서 조건을 판단한다.
	-else문이 없기때문에 다중조건일때는 표현이 어렵다. 이때는
	주로 choose문을 사용한다.
	형식]
		test : 조건
		var : test의 조건을 반환받을 변수 지정
		scope : 영역설정(거의 사용되지 않음)
	 -->
	<h2>if태그</h2>
	<!-- 변수선언 -->
	<c:set var="numVar" value="100"/>
	<c:set var="strVar" value="JAVA" />
	
	<!-- 
		if(numVar%2==0) 와 동일한 조건으로, 해당 조건문은
		true를 반환하므로 태그 사이의 문장이 출력된다. 그리고
		var속성에 지정돈 result에 true가 저장된다.
	 -->
	<h3>JSTL의 if태그로 짝수/홀수 판단하기</h3>
	<c:if test="${numVar mod 2 eq 0 }" var="result">
		${numVar}는 짝수입니다. <br />
	</c:if>
	\${result } : ${result } <br />
	
	<h3>위 if문을 EL식의 삼항식으로 표현</h3>
	${numVar } : ${numVar mod 2 == 0 ? "는 짝수" : "는 홀수" }
	
	<!-- 
		JSTL의 if문은 else가 없기때문에 참 or 거짓의 형태로
		구문을 만들때는 아래와 같이 참의 조건, 거짓의 조건으로
		각각 블럭을 만들어준다.
	 -->
	<h3>문자열 비교</h3>
	<c:if test="${JAVA eq '자바' }">
		${strVar }는 자바다 <br /> <!-- 조건이 false이므로 출력되지 않음 -->
	</c:if>
	<c:if test="${JAVA ne '자바' }">
		${strVar }는 자바가 아니다 <br /> <!-- 결과출력됨 -->
	</c:if>
	
	<!-- 
	-test속성에 EL식이 아닌 일반값이 들어가면 무조건 false를 반환한다.
	-EL식이더라도 {} 양쪽에 공백이 들어가면 무조건 false를 반환한다.
	-단, 일반식이라도 TRUE(true)인 경우에는 true를 반환한다.
	 -->
	<h2>if문 사용시 주의사항</h2>
	<h3>항상 출력되거나 출력되지 않는 조건식</h3>
	<c:if test="${true }">
		난 항상 출력되~ye~!
	</c:if>
	<c:if test="${false }">
		난 절대 출력되지 않아~yo~!
	</c:if>
	
	<h3>test속성에 일반값으로 조건지정</h3>
	<c:if test="100" var="result">
		100은 일반값이므로 무조건 false 반환
	</c:if>
	\${result } : ${result } <br />
	<c:if test="tRuE" var="result">
		true(TRUE)는 대소문자 구분없음. 항상 참임.
	</c:if>
	\${result } : ${result } <br />
	
	<h3>EL식으로 조건판단시 {}양쪽에 공백이 있으면
	무조건 false로 판단됨</h3>
	<c:if test="${true }" var="result">
		빈 공백이 있어서 무조건 false 처리됨
	</c:if>
	\${result } : ${result } <br />
	<!-- 
	아이디, 패스워드를 입력후 submit 한후 EL식을 통해 파라미터로 받은후
	"kosmo", "1234" 인 경우에는 "kosmo님 하이룽~" 이라고 출력한다. 
	만약 틀렸다면 "아이디와 비번을 확인하세요" 를 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->

	<h3>연습문제 : if태그</h3>
	<form method="get">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>	
	
	<c:if test="${not empty param.user }">
		전송된 아이디 : ${param.user }
		<br />
		전송된 패스워드 : ${param.pass }
		<br />
		<!-- 
		첫번째 if문에서 결과에 따라 두번째 if문은 반대의 결과를
		가지게 되는 구조로 작성되었다. 즉 loginResult가 true가
		된다면 두번째 if문은 false값으로 바뀌게 된다.
		 -->
		<c:if test="${param.user eq 'kosmo' and param.pass eq '1234' }"
			var='loginResult'>
			${param.user}님 하이룽~~
		</c:if>
		<c:if test="${not loginResult }">
			아이디와 비번을 확인하세요
		</c:if>
	</c:if>
	
</body>
</html>