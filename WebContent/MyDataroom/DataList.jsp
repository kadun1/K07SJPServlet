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
			<h3>자료실 - <small>Model2방식의 Servlet게시판</small></h3>
	<div class="row">
	<form class="form-inline ml-auto">	
		<div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>		
			<option value="content">내용</option>
			<option value="name">작성자</option>
		</select>
		</div>
		<div class="input-group">
			<input type="text" name="searchWord"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-warning">
			<i class='fa fa-search' style='font-size:20px'></i>
			</button>
			</div>
		</div>
	</form>	
		</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="150px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
				</thead>
				<tbody>
 				<tr>
 					<td colspan="6" align="center" height="100">
 						등록된 게시물이 없습니다. 
 					</td>
 				</tr>
				<tr>
					<td class="text-center"><!-- 가상번호 -->
					</td>
					<td class="text-left">
					</td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center">

		<a href="">
			<i class="material-icons" style="font-size:20px">attach_file</i>
		</a>

					</td>
				</tr>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn btn-primary" 
						onclick="location.href=''">글쓰기</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class='pagination justify-content-center'>
					</ul>
				</div>								
			</div>
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp" />
</div>
</body>
</html>