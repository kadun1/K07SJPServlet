package mycontroller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class EditCtrl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		
		ServletContext application = this.getServletContext();
		DataroomDAO dao = new DataroomDAO();
		
		DataroomDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/MyDataroom/DataEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sof;
		
		if(mr!=null) {
			String idx = mr.getParameter("idx");
			String nowPage = mr.getParameter("nowPage");
			String originalfile = mr.getParameter("originalfile");
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String pass = mr.getParameter("pass");
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			req.setAttribute("idx", idx);
			req.setAttribute("nowPage", nowPage);
			
			if(attachedfile==null) {
				attachedfile = originalfile;
			}
			
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			dto.setIdx(idx);
			
			DataroomDAO dao = new DataroomDAO();
			sof = dao.update(dto);
			
			if(sof==1&&mr.getFilesystemName("attachedfile")!=null) {
				FileUtil.deleteFile(req, "/Upload", originalfile);
			}
			dao.close();
		}
		else {
			sof = -1;
		}
		
		req.setAttribute("SOF", sof);
		req.setAttribute("CHOICE", "UPDATE");
		
		req.getRequestDispatcher("/MyDataroom/MyMessage.jsp").forward(req, resp);
	}
}
