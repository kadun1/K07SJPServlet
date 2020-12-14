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
				+ " LIKE '%"+map.get("Word")+ "'% ";
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
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {}
	}
}
