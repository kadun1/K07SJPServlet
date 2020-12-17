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
			<h3>자료실 - <small>View(상세보기)</small></h3>
			<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td>${dto.name }</td>
						<th class="text-center table-active align-middle">작성일</th>
						<td></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">다운로드수</th>
						<td></td>
						<th class="text-center table-active align-middle">조회수</th>
						<td></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">

	<a href="">
		[다운로드]
	</a>		
						</td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col-6"> 
<button type="button" class="btn btn-secondary"
	onclick="location.href=''" />
	수정하기</button>
<button type="button" class="btn btn-success"
	onclick="">
	삭제하기</button> 
				</div>
				<div class="col-6 text-right pr-5">					
<button type="button" class="btn btn-warning" 
	onclick="location.href='./DataList?nowPage=${param.nowPage}&searchColumn=${param.searchColumn }&searchWord=${param.searchWord }'">
	리스트보기</button>
				</div>	
			</div>
		<!-- ### 게시판의 body 부분 end ### -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp" />
</div>
</body>
</html>