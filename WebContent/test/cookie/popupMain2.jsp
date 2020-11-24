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

	<style>
	div.popup{
		position: absolute; top:100px; left:200px; 
		width:300px; height:200px;
		border:0px solid #888888; background-color:#ff0000;		
	}
	div.popup>h2{text-align:center;}
	div.popup>p{text-align:center;}
	div.popup>div{
		position: relative; background-color:#ffffff; top:50px;
		border:1px solid #888888; padding:10px; 	
	}
	</style>

	<h2>팝업 메인페이지</h2>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.
	
	<div class="popup">
		<h2>공지사항</h2>
		<p>
			중얼중얼~가타부타~블라블라<br />	
			중얼중얼~가타부타~블라블라<br />	
			중얼중얼~가타부타~블라블라<br />	
		</p>
		<div>
			<input type="checkbox" name="" id="" />
			오늘 하루 열지않음
			<input type="button" value="닫기" />
		</div>
	</div>

</body>
</html>