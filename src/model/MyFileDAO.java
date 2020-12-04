package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class MyFileDAO {
	
	Connection con; 
	PreparedStatement psmt;
	ResultSet rs;
	
	public MyFileDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(ctx.getInitParameter("ConnectionURL"), id, pw);
			System.out.println("DB 연결성공^^*");
		}
		catch(Exception e) {
			System.out.println("DB 연결실패 ㅜㅜ;");
			e.printStackTrace();
		}
	}
	
	//입력처리
	public int myfileInsert(MyFileDTO dto) {
		int affected = 0;
		try {
			String query = "INSERT INTO myfile ( "
				+ " idx, name, title, inter, ofile, sfile) "
				+ " VALUES ( "
				+ " SEQ_BBS_NUM.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
}
