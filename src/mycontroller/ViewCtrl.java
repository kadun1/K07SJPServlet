package mycontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		
		dao.updateVisitCount(idx);
		
		DataroomDTO dto = dao.selectView(idx);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/MyDataroom/DataView.jsp").forward(req, resp);
	}
}
