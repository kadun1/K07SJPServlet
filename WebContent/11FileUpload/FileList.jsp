<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//업로드 폴더의 물리적경로 가져오기
String saveDirectory = application.getRealPath("/Upload");
//경로를 기반으로 File객체생성
File file = new File(saveDirectory);
//listFiles()를 통해 파일목록을 배열형태로 얻어옴
File[] fileList = file.listFiles();
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
	<h2>업로드된 파일 리스트 보기(디렉토리 읽어오기)</h2>
	<ul>
	<%
	int fileCnt = 1;
	//위에서 얻어온 파일목록을 기반으로 반복 출력
	for(File f : fileList){
	%>
		<li>
			파일명 : <%=f.getName() %>
			&nbsp;&nbsp;
			파일크기 :
			<%=(int)Math.ceil(f.length()/1024.0) %>Kb
			&nbsp;&nbsp;
			<a href="Download1.jsp?fileName=<%=URLEncoder.encode(f.getName(),"UTF-8")%>">[다운로드1-1]</a>
		</li>
	<%
		fileCnt++;
	}
	%>
	</ul>
</body>
</html>