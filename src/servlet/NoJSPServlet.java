package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1.해당 클래스를 서블릿으로 정의하기 위해 HttpServlet클래스를 상속받는다.
public class NoJSPServlet extends HttpServlet{
	
	/*
	2. 사용자의 요청을 받기위해 doGet()혹은 doPost()를
	오버라이딩 한다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		3.View(jsp파일)없이 서블릿에서 내용을 출력하고자 할떄는 아래와
		같이 처리한다. 컨텐츠타입을 지정한 후 출력할 내용을 print()
		메소드를 통해 출력한다.
		 */
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<head><title>헬로~Servlet~^^</title></head>");
		out.println("<body>");
		out.println("<h2>JSP파일없이 화면에 출력되네욤..</h2>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//내용없음
	}
}
