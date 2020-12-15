<%@page import="mymodel.paging"%>
<%@page import="mymodel.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="mymodel.BbsDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

String searchColumn = request.getParameter("searchCol");
String searchWord = request.getParameter("searchWord");

String query = "";

Map<String, Object> paramMap = new HashMap<String, Object>();

BbsDAO dao = new BbsDAO();

if(!(searchColumn==null||searchColumn=="")){
	
	paramMap.put("Col", searchColumn);
	paramMap.put("Word", searchWord);
	
	query += "searchCol="+searchColumn+"&searchWord="+searchWord;
	
}

int totalCount = dao.getTotalRecordCountSearch(paramMap);

int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

int totalPage = (int)Math.ceil((double)totalCount/pageSize);

int nowPage = (request.getParameter("nowPage")==null||request.getParameter("nowPage").equals("")) ? 1 : Integer.parseInt(request.getParameter("nowPage"));

int pageStart = (nowPage-1)*pageSize +1;
int pageEnd = nowPage * pageSize;

paramMap.put("pageStart", pageStart);
paramMap.put("pageEnd", pageEnd);

List<BbsDTO> bbsList = dao.selectListPageSearch(paramMap);

dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp"/>
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp"/>
	<div class="row">		
	<jsp:include page="../common/boardLeft.jsp"/>
		<div class="col-9 pt-3">
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<select name="searchCol" class="form-control">
							<option value="title"
							<%=(searchColumn!=null&&searchColumn.equals("title")) ?"selected" : ""%>>
							제목</option>
							<option value="name"
							<%=(searchColumn!=null&&searchColumn.equals("name")) ?"selected" : ""%>>
							작성자</option>
							<option value="content"
							<%=(searchColumn!=null&&searchColumn.equals("content")) ?"selected" : ""%>>
							내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord" class="form-control"/>
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
					<col width="120px"/>
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
				<%
					if(bbsList.isEmpty()){
				%>
				<tr>
					<td colspan="6" align="center">
						등록된 게시물이 없습니다.
					</td>
				</tr>
				<%
					}
						else{
							int num =0;
							int countNum = 0;
							for(BbsDTO dto : bbsList){
								num = totalCount - (((nowPage-1)*pageSize)+countNum++);
								/*
								전체게시물수 : 108개라면...
								페이지사이즈(web.xml에 PAGE_SIZE로설정) : 10
								현제페이지1일때
						 					첫번째게시물 : 108 - (((1-1)*10)+0) = 108
						 					두번째게시물 : 108 - (((1-1)*10)+1) = 107
						 				현제페이지2일때
						 		 			첫번째게시물 : 108 - (((2-1)*10)+0) = 98
						 		 			두번째게시물 : 108 - (((2-1)*10)+1) = 97				
								*/
				%>
					<tr>
						<td class="text-center"><%=num%></td>
						<td class="text-left"><a href="BoardView.jsp?pnum=<%=dto.getNum()%>&nowPage=<%=nowPage%>&<%=query%>"><%=dto.getTitle()%></a></td>
						<td class="text-center"><%=dto.getName()%></td>
						<td class="text-center"><%=dto.getPostdate()%></td>
						<td class="text-center"><%=dto.getVisitcount()%></td>
						<td class="text-center"></td>
					</tr>
				<%
					}
						}
				%>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn btn-primary"
						onclick="location.href='BoardWrite.jsp';">글쓰기</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
					<%=paging.pagingBS4(totalCount, pageSize, blockPage, nowPage, "BoardList.jsp?"+query) %>
					</ul>
				</div>				
			</div>		
		</div>
	</div>
<jsp:include page="../common/boardBottom.jsp"/>
</div>
</body>
</html>