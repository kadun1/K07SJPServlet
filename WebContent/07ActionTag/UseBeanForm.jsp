<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>회원가입화면(속성 일치시)</h2>
	<form method="post" action="UseBeanFormResult.jsp">
	<table border="1" width="400">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" />
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="pass" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" />
			</td>
		</tr>
		<!-- <tr>
			<td>나이</td>
			<td>
				<input type="text" name="age" />
			</td>
		</tr> -->
		<tr>
			<td colspan="2">
				<input type="submit" value="가입완료" />
			</td>
		</tr>
	</table>	
	</form>

</body>
</html>