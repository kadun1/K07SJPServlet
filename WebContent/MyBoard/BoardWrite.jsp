<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<!DOCTYPE html>
<html>
<jsp:include page="boardHead.jsp" />
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="boardTop.jsp" />
	</div>
	<div class="row">		
		<jsp:include page="boardLeft.jsp" />
		<div class="col-9 pt-3">
		<!-- ### 게시판의 body 부분 start ### -->
			<h3>게시판 - <small>Write(글쓰기)</small></h3>
<script>

function validate(frm){
	if(frm.title.value==""){
		alert("제목을 입력하세요");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용을 입력하세요");
		frm.content.focus();
		return false;
	}
}

</script>
<div class="row mt-3 mr-1">
	<table class="table table-bordered table-striped">
	<form name="writeFrm" method="post" action="WriteProc.jsp" 
		onsubmit="return validate(this);">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="text-center"
				style="vertical-align:middle;">제목</th>
			<td>
				<input type="text" class="form-control" 
					name="title" />
			</td>
		</tr>
		<tr>
			<th class="text-center"
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" 
					class="form-control" name="content"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
</div>
<div class="row mb-3">
	<div class="col text-right">		
		<button type="submit" class="btn btn-danger">전송하기</button>
		<button type="reset" class="btn btn-dark">Reset</button>
		<button type="button" class="btn btn-warning" 
			onclick="location.href='BoardList.jsp';">리스트보기</button>
	</div>
	</form>
</div> 	
		<!-- ### 게시판의 body 부분 end ### -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="boardBottom.jsp" />
</div>
</body>
</html>