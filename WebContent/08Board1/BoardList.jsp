<%@page import="util.PagingUtil"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//web.xml에 설정된 초기화 파라미터를 가져옴.
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체생성 및 DB커넥션
BbsDAO dao = new BbsDAO(drv, url);

/*
파라미터를 저장할 용도로 생성한 Map컬렉션. 여러개의 파라미터를
한꺼번에 저장한 후 DAO의 메소드를 호출할때 전달할것임.
차후 프로그램의 업데이트에 의해 파라미터가 추가되더라도 Map을
사용하므로 메소드의 변형없이 사용할수 있다.
*/
Map<String, Object> param = new HashMap<String, Object>();

//Get방식으로 전달되는 폼값을 페이지번호로 넘겨주기 위해 문자열로 저장한다.
String queryStr = "";

//검색어가 입력된 경우 전송된 폼값을 받아 Map에 저장한다.
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	/*
	리스트 페이지에 최초 진입시에는 파라미터가 없으므로 if로
	구분하여 파라미터가 있을때만 Map에 추가한다.
	*/
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	//검색어가 있을때 쿼리스트링을 만들어준다.
	queryStr += "searchColumn="+searchColumn
			 +"&searchWord="+searchWord+"&";
	
}

//board테이블에 입력된 전체 레코드 갯수를 카운트하여 반환
//int totalRecordCount = dao.getTotalRecordCount(param); //join X
int totalRecordCount = dao.getTotalRecordCountSearch(param); //join O


/***********페이지 처리를 위한 코드 추가 start*************/
//한페이지에 출력할 레코드의 갯수 : 10
int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
//한 블럭당 출력할 페이지번호의 갯수 : 5
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

/*
전체페이지수 계산 => 게시물이 108개라 가정하면 108/10 => 10.8 => ceil(10.8) => 11
*/
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

/*
현재페이지번호 : 파라미터가 없을때는 무조건 1페이지로 지정하고,
	값이 있을때는 헤당값을 얻어와서 숫자로 변경한다.
	즉 리스트에 처음 진입했을때는 1페이지가 된다.
*/
int nowPage = (request.getParameter("nowPage")==null
				||request.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(request.getParameter("nowPage"));

//한페이지에 출력할 게시물의 범위를 결정한다. 계산식은 교안을 참조한다.(1~10, 11~20, ...)
int start = (nowPage-1)*pageSize +1;
int end = nowPage*pageSize;

//게시물의 범위를 Map컬렉션에 저장하고 DAO로 전달한다.
param.put("start", start);
param.put("end", end);

/***********페이지 처리를 위한 코드 추가 end***************/


//board테이블의 레코드를 select하여 결과셋을 List컬렉션으로 반환
//List<BbsDTO> bbs = dao.selectList(param);//페이지처리X
//List<BbsDTO> bbs = dao.selectListPage(param);//페이지처리O
List<BbsDTO> bbs = dao.selectListPageSearch(param);//페이지처리O+회원이름검색

//DB자원해제
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp"/>
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="../common/boardTop.jsp"/>
	</div>
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp"/>
		<div class="col-9 pt-3">
		<!-- ### 게시판의 body 부분 start ### -->
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title" 
								<%=(searchColumn!=null && searchColumn.equals("title")) ?
									"selected" : ""%>>제목</option>
							<option value="content" 
								<%=(searchColumn!=null && searchColumn.equals("content")) ?
									"selected" : ""%>>내용</option>
							<option value="name"
								<%=(searchColumn!=null && searchColumn.equals("name")) ?
									"selected" : ""%>>작성자</option>
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
					<!-- <col width="60px"/> -->
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<!-- <th>첨부</th> -->
				</tr>
				</thead>				
				<tbody>
				<%
				/*
				List컬렉션에 입력된 데이터가 없을때 true를 반환
				*/
				if(bbs.isEmpty()){
					//게시물이 없는 경우...
				%>
					<tr>
						<td colspan="6" align="center" height="100">
						등록된 게시물이 없습니다^^
						</td>
					</tr>
				<%
				}
				else
				{
					//게시물이 있는 경우...
					int vNum =0; //게시물의 가상번호로 사용할 변수
					int countNum =0;
					
					/*
					컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 갯수만큼
					즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
					*/
					for(BbsDTO dto : bbs){
						/*
						전체 레코드수를 이용하여 가상번호를 부여하고
						반복시 1씩 차감한다.(페이지 처리 없을때의 방식)
						*/
						//vNum = totalRecordCount --;
						
						//페이지 처리를 할때 가상번호 계산방법
						vNum = totalRecordCount -
							(((nowPage-1)*pageSize) + countNum++);
						/*
						전체게시물수 : 108개
						페이지 사이즈(web.xmlㅇ PAGE_SIZE로설정) : 10
						현재페이지1일때
							첫번째게시물 : 108 - (((1-1)*10)+0) = 108
							두번째게시물 : 108 - (((1-1)*10)+1) = 107
						현재페이지2일때
							첫번째게시물 : 108 - (((2-1)*10)+0) = 98
							두번째게시물 : 108 - (((2-1)*10)+1) = 97
						*/
				%>
					<!-- 리스트반복 -->
					<tr>
						<td><%=vNum %></td>
						<td>
							<a href="BoardView.jsp?num=<%=dto.getNum()%>
							&nowPage=<%=nowPage%>&<%=queryStr%>"><%=dto.getTitle() %>
							</a>
						</td>
						<td><%=dto.getName() %><br>(<%=dto.getId() %>)</td>
						<td><%=dto.getPostdate() %></td>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<!-- 리스트반복 -->
				<%
					}//for-each문 끝
				}//if문 끝
				%>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<button type="button" class="btn btn-primary"
						onclick="location.href='BoardWrite.jsp';">글쓰기</button>
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
					<!-- 매개변수설명
					totalRecordCount : 게시물의 전체갯수
					pageSize : 한페이지에 출력할 게시물의 갯수
					blockPage : 한 블록에 표시할 페이지번호의 갯수
					nowPage : 현재페이지 번호
					"BoardList.jsp? : 해당 게시판의 실행 파일명
					 -->
						<%=PagingUtil.paginBS4(totalRecordCount, 
								pageSize, 
								blockPage, 
								nowPage, 
								"BoardList.jsp?"+queryStr) %>
					</ul>
				</div>
			</div>
		<!-- ### 게시판의 body 부분 end ### -->	
			<div class = "text-center">
				<!-- 텍스트 기반의 페이지번호 출력하기 -->
				<%=PagingUtil.pagingTxt(totalRecordCount, 
								pageSize, 
								blockPage, 
								nowPage, 
								"BoardList.jsp?"+queryStr) %>
			</div>	
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp"/>
</div>
</body>
</html>