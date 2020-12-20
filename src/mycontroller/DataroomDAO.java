package mycontroller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataroomDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public DataroomDAO() {
		try {
			
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			con = source.getConnection();
		}
		catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}		
	}
	
	public int getTotalCount(Map map) {
		int count = 0;
		try {
			String sql = " SELECT COUNT(*) FROM dataroom ";
			
			if(map.get("Word")!=null) {
				sql +=" WHERE "+map.get("Column")
					+ " LIKE '%"+map.get("Word")+"%' ";
			}
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		}
		catch(Exception e) {}
		return count;	
	}
	
	public List<DataroomDTO> selectListPage(Map map){
		
		List<DataroomDTO> datalist = new ArrayList<DataroomDTO>();
		
		String sql = " SELECT * FROM ("
				+ " SELECT Tb.*, rownum rNum FROM ("
				+ " SELECT * FROM dataroom ";
		
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Column")
				+ " LIKE '%"+map.get("Word")+ "%' ";
		}
		
		sql += " ORDER BY idx DESC "
			+" ) Tb ) "
			+" WHERE rNum BETWEEN ? AND ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,
				map.get("start").toString());
			psmt.setInt(2,
				Integer.parseInt(map.get("end").toString()));

			rs = psmt.executeQuery();
			while(rs.next()) {
				DataroomDTO dto= new DataroomDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				datalist.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("select중 예외발생");
			e.printStackTrace();
		}
		return datalist;
	}
	
	public DataroomDTO selectView(String idx) {
		
		DataroomDTO dto = null;
		
		String sql = "SELECT * FROM dataroom "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				dto = new DataroomDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
			}
		}
		catch(Exception e) {
			System.out.println("상세보기중 예외발생");
			e.printStackTrace();
		}
		return dto;
		
	}
	
	public void updateVisitCount(String idx) {
		
		String sql = "UPDATE dataroom SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE idx = ? ";
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch(Exception e) {}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {}
	}
	
	public int insert(DataroomDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO dataroom ( "
					+ " idx,title,name,content,attachedfile,pass) "
					+ " VALUES ("
					+ " dataroom_seq.NEXTVAL, ?, ?, ?, ?, ?)"; 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public int update(DataroomDTO dto) {
		int affected = 0;
		try {
			String sql = "UPDATE dataroom SET "
					+ " title=?, name=?, content=?, "
					+ " attachedfile=?, pass= ? "
					+ " WHERE idx=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			psmt.setString(6, dto.getIdx());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("업데이트중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public boolean isCorrectPassWord(String pass, String idx) {
		boolean isCorrect = true;
		
		try {
			String sql = " SELECT COUNT(*) FROM dataroom "
					+ " WHERE pass=? AND idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
			isCorrect = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isCorrect;
	}
}
