package mycontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/MyDataroom/DataPassword.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		
		DataroomDAO dao = new DataroomDAO();
		boolean isCorrect = dao.isCorrectPassWord(pass, idx);
		dao.close();
		
		req.setAttribute("PASS_CHECK", isCorrect);
		
		req.getRequestDispatcher("/MyDataroom/MyPassMessage.jsp").forward(req, resp);
	}

}
