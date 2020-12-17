package mycontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		DataroomDAO dao = new DataroomDAO();
		
		Map paramMap = new HashMap();
		String query ="";
		
		String column = req.getParameter("searchColumn");
		String word = req.getParameter("searchWord");
		if(!(column==null || column.equals(""))) {
			query = "searchColumn="+column+"&searchWord="+word+"&";
			
			paramMap.put("Column", column);
			paramMap.put("Word", word);
		}
		
		int totalCount = dao.getTotalCount(paramMap);
		
		ServletContext application = this.getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
		
		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage")==null||req.getParameter("nowPage").equals(""))?
				1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int pageStart = (nowPage-1)*pageSize +1;
		int pageEnd = nowPage * pageSize;
		
		String pageSet = Paging.pagingBS4(totalCount, pageSize, blockPage, nowPage,
						"../Mydata/DataList?"+query);
		
		paramMap.put("start", pageStart);
		paramMap.put("end", pageEnd);
		paramMap.put("totalPage", totalPage);
		paramMap.put("nowPage", nowPage);
		paramMap.put("totalCount", totalCount);
		paramMap.put("pageSize", pageSize);
		paramMap.put("pageSet", pageSet);
		
		List<DataroomDTO> datalist = dao.selectListPage(paramMap);
		
		dao.close();
		
		req.setAttribute("datalist", datalist);
		req.setAttribute("paramMap", paramMap);
		
		req.getRequestDispatcher("../MyDataroom/DataList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
