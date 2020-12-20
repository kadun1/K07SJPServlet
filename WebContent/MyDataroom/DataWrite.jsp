<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<jsp:include page="../common/boardHead.jsp" />
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
<div class="row mt-3 mr-1">
	<table class="table table-bordered table-striped">
	
	<!-- 
		파일 업로드를 위해서는 반드시 enctype을 선언해야 한다. 해당 
		선언문장이 없으면 파일은 서버로 전송되지 않는다.
	 -->
	<form name="writeFrm" method="post" action="../Mydata/DataWrite" 
		onsubmit=""
		enctype="multipart/form-data">
		
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="text-center align-middle">작성자</th>
			<td>
				<input type="text" class="form-control" name="name"	
					style="width:100px;"/>
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">패스워드</th>
			<td>
				<input type="password" class="form-control" name="pass"
					style="width:200px;"/>
			</td>
		</tr>
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
		<tr>
			<th class="text-center"
				style="vertical-align:middle;">첨부파일</th>
			<td>
				<input type="file" class="form-control" 
					name="attachedfile" />
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
			onclick="location.href='../Mydata/DataList?nowPage=${param.nowPage }&searchColumn=${param.searchColumn }&searchWord=${param.searchWord }';">
			리스트보기</button>
	</div>
	</form>
</div> 	
		<!-- ### 게시판의 body 부분 end ### -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp" />
</div>
</body>
</html>