package eltag;

import model.MemberDAO;

/*
	EL에서 Java클래스의 메소드 호출 절차 및 방법
	1.클래스와 메소드를 정의한다. 단 메소드 정의시 반드시
	public static 으로 선언해야한다.
 */
public class MyTagLib {

	/*
	메소드설명 : 매개변수로 전달된 문자열에 숫자가 아닌
		문자가 포함되어 있는지 확인한다. 전체가 숫자일때는
		true를 반환하고, 그렇지 않으면 false를 반환한다.
		Ex) 1234 -> true, 백20 -> false
	 */
	public static boolean isNumber(String value) {
		
		char[] chArr = value.toCharArray();
		for(int i=0; i<chArr.length; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
//	public static String getGender(String value){
//		String genderStr = "";
//		String[] splStr = value.split("-");
//		if(splStr[1].charAt(0)=='1'||splStr[1].charAt(0)=='3') {
//			genderStr = "남자";
//		}
//		else if(splStr[1].charAt(0)=='2'||splStr[1].charAt(0)=='4') {
//			genderStr = "여자";
//		}
//		else {
//			genderStr = "잘못입력했습니다";
//		}
//		return genderStr;
//	}
	/*
	메소드설명 : 매개변수로 주민번호를 전달받아 성별을 판단한다.
		주민번호는 하이픈(-)을 포함한 형태로 전달된다고 가정한다.
	 */
	public static String getGender(String jumin){
		
		String returnStr = "";
		//indexOf()를 통해 -의 위치를 찾아 1을 더한다.
		int beginIdx = jumin.indexOf("-") + 1;
		//위에서 구한 인덱스를 통해 성별에 해당하는 문자를 잘라서 가져온다.
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		//쉬운 비교를 위해 정수로 전환한다.
		int genderInt = Integer.parseInt(genderStr);
		
		if(genderInt==1||genderInt==3)
			returnStr = "남자";
		else if(genderInt==2||genderInt==4)
			returnStr = "여자";
		else
			returnStr = "주민번호 오류..너 누구니?";
		return returnStr;
	}
	
	/*
	아이디/패스워드, DB연결을 위한 드라이버명, URL을 인자로 전달받아
	회원여부를 판단하여 boolean을 반환해주는 메소드
	 */
	public static boolean memberLogin(String id, String pw,
			String drv, String url) {
		//DB연결을 위한 객체생성
		MemberDAO dao = new MemberDAO(drv, url);
		//아이디, 패스워드를 통한 회원인증 및 결과반환
		boolean isBool =dao.isMember(id, pw);
		//위 결과를 호출한 지점으로 반환
		return isBool;	
	}
	
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("백20");
		System.out.println("결과1:"+result1);
		System.out.println("결과2:"+result2);

	}
}
