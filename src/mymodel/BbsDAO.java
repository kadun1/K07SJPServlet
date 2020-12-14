package mymodel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BbsDAO {
	
	ResultSet rs;
	PreparedStatement psmt;
	Connection conn;
	
	public BbsDAO() {
		try {
			Context initctx = new InitialContext();
			Context ctx = (Context)initctx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			conn = source.getConnection();
			System.out.println("DBCP 연결성공 ^^*");
		}
		catch(Exception e) {
			System.out.println("DBCP 연결 실패ㅠㅠ");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(conn!=null) conn.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생 ㅠㅠ");
			e.printStackTrace();
		}
	}
	
	public int getTotalRecordCountSearch(Map<String, Object> map) {
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM board B "
				+ " INNER JOIN member M "
				+ "		ON B.id = M.id ";
		
		if(map.get("Word")!=null) {
			sql += " WHERE "+ map.get("Col") + " "
				+ " LIKE '%" + map.get("Word") + "%'";
		}
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		}
		catch(Exception e) {}
		
		return count;
	}
	
	
	public List<BbsDTO> selectListPageSearch(Map<String, Object> map) {
		
		List<BbsDTO> bbs = new ArrayList<BbsDTO>();
		
		String sql = " SELECT * FROM ( "
				+" SELECT Tb.*, ROWNUM rNum FROM ( "
				+" SELECT B.*, M.name FROM board B "
				+" INNER JOIN member M "
				+" ON B.id=M.id ";
		
		if(map.get("Word")!=null) {
			sql += " WHERE "+ map.get("Col") + " "
				+ " LIKE '%" + map.get("Word") + "%'";
		}
		
		sql += " ORDER BY num DESC "
			+" )Tb "
			+" ) "
			+" WHERE rNum BETWEEN ? AND ? ";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, map.get("pageStart").toString());
			psmt.setString(2, map.get("pageEnd").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				BbsDTO dto = new BbsDTO();
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
				
				bbs.add(dto);
			}	
		}
		catch(Exception e) {
			System.out.println("selectList 중 예외발생");
			e.printStackTrace();
		}
		return bbs;	
	}
	
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE num=? ";
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("조회수 증가시 예외발생 ㅠㅠ");
			e.printStackTrace();
		}
	}
	
	public BbsDTO selectView(String num) {
		BbsDTO dto = new BbsDTO();
		String sql = ""
				+" SELECT num, title, content, B.id, postdate, visitcount, name"
				+" FROM member M INNER JOIN board B "
				+" ON M.id=B.id "
				+" WHERE num=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
				
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		
		System.out.println(dto.getNum());
		return dto;
	}
	
	public int insertWrite(BbsDTO dto) {
		int affected = 0;
		
		try {
			
			String sql = ""
					+" INSERT INTO board ("
					+" num,title,content,id,visitcount) "
					+" VALUES ( "
					+" seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("Insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public int updateEdit(BbsDTO dto) {
		int affected = 0;
		
		try {
			String sql = ""
					+ "UPDATE board SET "
					+ " title=?, content=? "
					+ " WHERE num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("업데이트중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public int delete(BbsDTO dto) {
		int affected = 0;
		
		try {
			String sql = " DELETE board WHERE num=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("삭제중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
}

