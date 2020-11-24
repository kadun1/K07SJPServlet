<%@page import="util.FirstFunction"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<h3>구구단출력1 - 표현식으로 구현</h3>
	table>tr>td
	<table border="1">
	<%
	//단만큼 반복한다.
	for(int dan=2 ; dan<=9 ; dan++){
	%>
		<tr>
		<%
		//수만큼 반복한다. 
		for(int su=1 ; su<=9 ; su++){
		%>
			<td><%=dan %>*<%=su %>=<%=(dan*su) %></td>
		<%
		}
		%>
		</tr>
	<%
	}
	%>
	</table>
	
	
	<%!
	//연습문제] 위와 동일한 결과가 출력되도록 아래 메소드를 구현하시오.
	public void showGugudan(JspWriter out){
		try{
			out.println("<table border='1'>");
			for(int dan=2 ; dan<=9 ; dan++){
				out.println("<tr>");
				for(int su=1 ; su<=9 ; su++){
					out.println("<td>"+dan+"*"+su+"="+(dan*su)+"</td>");				
				}
				out.println("</tr>");		
			}
			out.println("</table>");
		}
		catch(IOException e){
			//내용없음	
		}		
	}
	%>
	<h3>구구단출력2 - 선언부에서 함수 선언후 호출</h3>
	<%
		showGugudan(out);
	%>
	
	<h3>구구단출력3 - src부분에 클래스 선언후 함수 호출</h3>
	<%
		FirstFunction.srcGuGudan(out);
	%>
	
	
	
	
	
	
	
	
	
</body>
</html>