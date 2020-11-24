<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter.jsp</title>
</head>
<body>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

/*
전송방식에 상관없이 getParameter()로 폼값을 받을수 있다. 
만약 값이 입력되지 않았다면 길이가 0인 String객체를 반환하고
파라미터명이 틀린경우에는 null을 반환한다. 
*/ 
String id = request.getParameter("id");

String name = request.getParameter("name");
if( !(name==null || name.equals("")) ){
	out.println("이름:"+ name);
}
else{
	/*
	스크립트릿 안에서 JS를 선언할때에는 out.println()을 통해
	아래와같이 사용할수 있다. 
	*/
	out.println("<script>");
	out.println("	alert('이름을 입력하세요');");
	out.println("	history.back();");
	out.println("</script>");	 
}

/*
radio는 항목은 여러개이나, 선택가능한 항목이 1개이기 때문에
getParameter()를 통해 폼값을 받을수있다.
*/
String sexStr = request.getParameter("sex");
 
/*
checkbox는 여러항목에 대해 선택이 가능하므로 getParameterValues()
를 사용한다. 항목중 체크된것만 서버로 전송되고, 파라미터명이 틀리거나
값이 전송되지 않으면 null을 반환한다. 
*/
String[] favo = request.getParameterValues("favorite");
String favStr = "";
if(favo != null){
	for(int i=0 ; i<favo.length ; i++){
		/*
		전송된 항목을 하나의 문자열로 연결하여 저장한다. 
		문자열의 마지막 부분에 ,를 제거하기 위해 if문을 
		통해 처리한다. 
		*/
		if(i==favo.length-1){
			favStr += favo[i];
		}
		else{
			favStr += favo[i] +",";
		}
	}
}

/*
textarea를 통해 입력받은 값은 엔터키(줄바꿈기호 \r\n)가 포함되어있다.
웹브라우저에 출력할때에는 특수기호를 <br>로 변환후 출력해야한다. 
*/
String self_intro = request.getParameter("self_intro")
						.replace("\r\n","<br/>");
%>
<ul>
	<li>이름 : <%=name %></li>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sexStr %></li>
	<li>관심사항 : <%=favStr %></li>
	<li>자기소개 : <%=self_intro %></li>
</ul>



<% 
/*
getParameterNames() : 폼값의 이름을 한꺼번에 받을때 사용하는 
	메소드로 반환타입은 Enumeration 형이다. 
hasMoreElements() : 객체에 남은 폼값이 있는지 검사한다.
nextElement() : 받은 폼값 중 다음 폼의 이름을 반환하다. 
*/
Enumeration names = request.getParameterNames();
while(names.hasMoreElements()){
	
	//폼의 name속성을 하나씩 읽어서 String형으로 반환한다. 
	String paramName = (String)names.nextElement();
	System.out.println("파라미터명:"+ paramName);
		
	if(paramName.equals("sex") ||
			paramName.equals("favorite")){
		//checkbox와 radio는 getParameterValues()를 통해 읽어온다.
		System.out.println("getParameterValues()로읽기");
		out.println("파라미터명을 getParameterValues()로" 
						+" 얻어서 값 출력함<br/>");
	}
	else{
		//나머지 text와 textarea는 getParameter()로 읽어온다.
		System.out.println("getParameter()로 읽기");
		out.println("파라미터명을 메소드로 얻어서" 
				+ "값 출력 : ");
		out.println(request.getParameter(paramName)
				+"<br/>");
	}
}
%>
</body>
</html>