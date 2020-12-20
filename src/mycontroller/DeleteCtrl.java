package mycontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FileUtil;

public class DeleteCtrl extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		
		DataroomDTO dto = dao.selectView(idx);
		int sof = dao.delete(idx);
		if(sof==1) {
			String fileName = dto.getAttachedfile();
			FileUtil.deleteFile(req, "/Upload", fileName);
		}
		
		req.setAttribute("CHOICE", "DELETE");
		req.setAttribute("SOF", sof);
		
		req.getRequestDispatcher("/MyDataroom/MyMessage.jsp").forward(req, resp);
	}
}
