<%@page import="mymodel.BbsDTO"%>
<%@page import="mymodel.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String query = "";

String searchColumn = request.getParameter("searchCol");
String searchWord = request.getParameter("searchWord");
String nowPage = request.getParameter("nowPage");
String number = request.getParameter("pnum");

if(searchWord!=null){
	query += "searchCol="+searchColumn+"&searchWord="+searchWord;	
}
query += "&nowPage="+nowPage;

BbsDAO dao = new BbsDAO();

dao.updateVisitCount(number);

BbsDTO dto = dao.selectView(number);

dao.close();
%>
<!DOCTYPE html>
<html>
<jsp:include page="boardHead.jsp"/>
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="boardTop.jsp" />
	</div>
	<div class="row">		
		<jsp:include page="boardLeft.jsp" />
		<div class="col-9 pt-3">
		<!-- ### 게시판의 body 부분 start ### -->
			<h3>게시판 - <small>View(상세보기)</small></h3>
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
						<th class="text-center table-active align-middle">아이디</th>
						<td><%=dto.getId() %></td>
						<th class="text-center table-active align-middle">작성일</th>
						<td><%=dto.getPostdate() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td><%=dto.getName() %></td>
						<th class="text-center table-active align-middle">조회수</th>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							<%=dto.getTitle() %>
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							<%=dto.getContent().replace("\r\n", "<br/>") %>
						</td>
					</tr>					 					 
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col-6">

	<button type="button" class="btn btn-secondary"
		onclick="location.href='BoardEdit.jsp?pnum=<%=dto.getNum()%>';">수정하기</button>
	<button type="button" class="btn btn-success"
		onclick="isDelete();">삭제하기</button>
<form name="deleteform">
	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
</form>
<script>
	function isDelete(){
		var c = confirm("삭제할까요?");
		if(c){
			var f = document.deleteform;
			f.method = "post";
			f.action = "DeleteProc.jsp"
			f.submit();
		}
	}
</script>
				</div>
				<div class="col-6 text-right pr-5">					
					<button type="button" class="btn btn-warning" 
						onclick="location.href='BoardList.jsp?<%=query%>';">리스트보기</button>
				</div>	
			</div>
		<!-- ### 게시판의 body 부분 end ### -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="boardBottom.jsp" />
</div>
</body>
</html>