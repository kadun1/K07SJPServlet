<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//리퀘스트 내장객체를 이용해서 생성된 쿠키를 가져온다.
Cookie[] cookies = request.getCookies();
//쿠키값을 저장할 변수
String id = "", save="";
//생성된 쿠키가 존재한다면...
if(cookies!=null){
	for(Cookie ck : cookies){
		if(ck.getName().equals("LoginId")){
			//로그인 아이디가 있는지 확인
			id = ck.getValue();
			System.out.println("id="+id);
		}			
		else if(ck.getName().equals("SaveId")){
			//아이디저장에 관련된 값이 있는지 확인
			save = ck.getValue();
			System.out.println("save="+save);
		}			
	}
}
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamMain.jsp</title>
</head>
<body>
	<h2>쿠키를 이용한 로그인 & 아이디저장하기</h2>
<%
/*
	id에 저장된 값이 없다면 로그아웃 상태이므로
	로그인폼을 화면에 출력한다. 
*/
if(id.length()==0){
%>	
	<!-- 로그인 실패시 리퀘스트영역에 저장된 속성값을 출력함 -->
	<span style="color:red; font-size:1.5em;">
		로그인 메시지 :
		<%=request.getAttribute("ERROR_MSG")==null ?
				"" : request.getAttribute("ERROR_MSG") %>
	</span>
	<!--  
		input태그의 하위속성 tabindex
			: 아이디, 패스워드를 입력하기 위해 주로 Tab키를 통해
			포커스를 이동하는데, 작성된 순서가 아닌 임의의 순서를
			부여하고 싶을때 사용한다. 
	-->
	<form action="CookieLoginProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<!-- 
					쿠키에 저장된 로그인 아이디가 있다면 value속성에
					삽입한다. 
				-->
				<input type="text" name="user_id" tabindex="1" 
					value="<%=(save.length()==0) ? "" : save %>" />
				<!-- 
					아이디 저장하기에 관련된 쿠키값이 존재한다면 체크박스의
					checked속성을 활성화 한다. 
				-->
				<input type="checkbox" name="id_save" value="Y" 
					tabindex="4" 
					<% if(save.length()!=0){ %>
						checked="checked"
					<% } %> /> 아이디저장하기
			</td>			
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="user_pw" tabindex="2" />				
			</td>			
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인하기" tabindex="3" />				
			</td>			
		</tr>
	</table>		
	</form>
<%
} else {
	//로그인 상태라면 회원정보와 로그아웃 버튼을 출력한다.  
%>
	<table border=1 width=400>
		<tr>
			<td align="center">				
				<%=id %>님, 로그인하셨습니다.
				<br />
				즐거운 시간 보내세요^^*
				<br />
				<input type="button" value="로그아웃" 
					onclick="location.href='CookieLogoutProc.jsp';" />
			</td>
		</tr>
	</table>
<%
}
%>
</body>
</html>


