<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanAction.jsp</title>
</head>
<body>
	<h2>useBean 액션태그</h2>
	
	<h3>useBean 액션태그로 좁은의미의 자바빈 객체 생성하기</h3>
	
	<%--	
	//1.request영역에 저장된 member객체를 가져온다. 
	MemberDTO memberDTO = (MemberDTO)request.getAttribute("member");
	if(memberDTO==null){
		//2.만약 객체가 null값이면 객체를 생성한다. 
		memberDTO = new MemberDTO();
		//3.생성한 객체를 request영역에 저장한다. 
		request.setAttribute("member", memberDTO);
	}
	//위 Java코드를 액션태그로 표현하면 아래와 같이된다.
	--%>	
	<!--  
		액션태그를 통해 빈을 생성할때 클래스명은  패키지명을 포함한
		풀경로를 사용해야한다. 
	-->
	<jsp:useBean id="member" class="model.MemberDTO" 
		scope="request" />	
	 

	<!--  
	userBean의 id속성과 setProperty의 name속성값이 서로 연결되어
	빈을 지정하게되고, setter()를 통해 값이 설정된다. 
	즉, DTO클래스에 setter()가 없으면 액션태그는 에러를 발생시킨다.
	
	property속성 : 빈의 멤버변수를 지정한다.
	-->
	<h3>setProperty 액션태그로 자바빈 객체 속성지정하기</h3>
	<jsp:setProperty property="id" name="member"
		value="KIM" />
	<jsp:setProperty property="pass" name="member"
		value="1234" />
	<jsp:setProperty property="name" name="member"
		value="김희선" />
		
	 
	<!--  
	빈의 getter()를 통해 값을 얻어온후 출력한다.
	-->
	<h3>getProperty 액션태그로 자바빈 객체 속성읽기</h3>
	<ul>
		<li>아이디 : 
			<jsp:getProperty property="id" name="member" />
		</li>		
		<li>패스워드 : 
			<jsp:getProperty property="pass" name="member"/>		
		</li>		
		<li>이름 : 
			<jsp:getProperty property="name" name="member"/>
		</li>
	</ul>

	<jsp:forward page="UseBeanActionForward.jsp"></jsp:forward>

</body>
</html>