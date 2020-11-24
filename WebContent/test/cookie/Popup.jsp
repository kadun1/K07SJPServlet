<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function(){
	$('#popClose').click(function(){
		var url = 'PopupCookie.jsp';
		var chkVal = $("input:checkbox[name='popClose']:checked").val();
		var param = {'chkVal':chkVal};		
		$.post(url,param,function(resData){
			console.log('resData='+ resData);
		});
		//self.close();
	});
});
</script>
</head>
<body>
<div class="container">
	<h2 class="text-center">팝업창</h2>
	
	<div class="text-center">
	<label>
		<input type="checkbox" name="popClose" id="popClose" value="1" />
		오늘하루 팝업창 열지않기
		<input type="button" value="팝업창닫기" onclick="self.close();" />
	</label>
	</div>
</div>	
</body>
</html>