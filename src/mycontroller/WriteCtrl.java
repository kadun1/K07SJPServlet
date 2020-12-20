package mycontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class WriteCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("../MyDataroom/DataWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sof;
		
		if(mr!=null) {
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			String attachedfile = mr.getParameter("attachedfile");
			
			DataroomDTO dto = new DataroomDTO();
			dto.setName(name);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setPass(pass);
			dto.setContent(content);
			dto.setAttachedfile(attachedfile);
			
			DataroomDAO dao = new DataroomDAO();
			
			sof = dao.insert(dto);
			
			dao.close();
			
		}
		else {
			sof = -1;
		}
		
		if(sof==1) {
			resp.sendRedirect("../Mydata/DataList");
		}
		else {
			req.getRequestDispatcher("../MyDataroom/DataWrite.jsp").forward(req, resp);
		}
	}

}
