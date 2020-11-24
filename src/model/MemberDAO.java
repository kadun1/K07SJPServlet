package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/*
DAO(Data Access Object)
	: 데이터베이스의 Data에 접근하기 위한 객체이다. 
	DB접근을 위한 로직으로 주로 구성된다. MVC패턴에서는
	M(Model)에 해당한다. 
 */
public class MemberDAO {
	
	Connection con; //커넥션 객체를 멤버변수로 설정하여 공유
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자를 통한 DB연결
	public MemberDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공(디폴트생성자)");
		}
		catch (Exception e) {
			System.out.println("DB연결실패(디폴트생성자)");
			e.printStackTrace();
		}
	}
	//인자생성자 : 오라클드라이버와 url을 매개변수로 받아 연결한다.
	public MemberDAO(String driver, String url) {		
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			//DB에 연결된 정보를 멤버변수에 저장
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공(인자생성자)");
		}
		catch (Exception e) {
			System.out.println("DB연결실패(인자생성자)");
			e.printStackTrace();
		}
	}
	
	//그룹함수 count()를 통해 회원의 존재유무만 판단한다.
	public boolean isMember(String id, String pass) {
		
		//쿼리문 작성
		String sql = "SELECT COUNT(*) FROM member "
				+ " WHERE id=? AND pass=?";
		
		int isMember = 0;
		boolean isFlag = false;

		try {
			//prepare객체를 통해 쿼리문을 전송한다. 
			//생성자에서 연결정보를 저장한 커넥션 객체를 사용함.
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정(DB의 인덱스는 1부터 시작)
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//쿼리문 실행후 결과는 ResultSet객체를 통해 반환받음
			rs = psmt.executeQuery();
			//실행결과를 가져오기 위해 next()를 호출한다. 
			rs.next();
			//select절의 첫번째 결과값을 얻어오기위해 getInt()사용함.
			isMember = rs.getInt(1);
			System.out.println("affected:"+isMember);
			if(isMember==0) //회원이 아닌경우
				isFlag = false;
			else //회원인 경우(해당 아이디,패스워드가 일치함)
				isFlag = true; 
		}
		catch(Exception e) {
			//예외가 발생한다면 확인이 불가능하므로 무조건 false를 반환한다.
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	public static void main(String[] args) {		
		new MemberDAO();
	}

}
