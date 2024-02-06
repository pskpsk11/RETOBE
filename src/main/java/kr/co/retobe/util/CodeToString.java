package kr.co.retobe.util;

public class CodeToString {
	public static String educationToString (int i) {
		if(i ==1) {
			return "해커스";
		}else if(i== 2) {
			return "파고다";
		}else if(i== 3) {
			return "YBM";
		}
		return null;
	}
	
	public static String areaToString (int i) {
		if(i ==2) {
			return "서울";
		}else if(i== 32) {
			return "인천";
		}else if(i== 51) {
			return "부산";
		}else if(i== 53) {
			return "대구";
		}
		return null;
	}
	
	public static String branchToString (int i) {
		if(i ==1) {
			return "강남";
		}else if(i== 2) {
			return "종로";
		}else if(i== 3) {
			return "종로e4u";
		}else if(i== 4) {
			return "신촌";
		}else if(i== 5) {
			return "건대";
		}else if(i== 6) {
			return "대구동성로";
		}else if(i== 7) {
			return "서면";
		}else if(i== 8) {
			return "부산대";
		}else if(i== 9) {
			return "대연";
		}else if(i== 10) {
			return "부산광복";
		}else if(i== 11) {
			return "인천센터";
		}
		return null;
	}
	
	public static String subjectToString (int i) {
		if(i ==1) {
			return "토익";
		}else if(i== 2) {
			return "토스";
		}else if(i== 3) {
			return "토플";
		}else if(i== 4) {
			return "아이엘츠";
		}else if(i== 5) {
			return "텝스";
		}else if(i== 6) {
			return "오픽";
		}else if(i== 7) {
			return "gre";
		}else if(i== 8) {
			return "g-telp";
		}
		return null;
	}

	public static String levelToString (int i) {
		return Integer.toString(i).substring(1);
	}
	
	public static String genderToStirng (int i) {
		if(i ==1) {
			return "남자";
		}else if(i== 2) {
			return "여자";
		}
		return null;
	}

	public static String dateToStirng (int mon, int tue, int wed, int thu, int fri, int sat, int sun ) {
		String date ="";
		if(mon > 0) {
			date += "월 ";
		}
		if(tue > 0) {
			date += "화 ";
		}
		if(wed > 0) {
			date += "수 ";
		}
		if(thu > 0) {
			date += "목 ";
		}
		if(fri > 0) {
			date += "금 ";
		}
		if(sat > 0) {
			date += "토 ";
		}
		if(sun > 0) {
			date += "일 ";
		}
		return date;
	}
	
	public static String paybyToString (int i) {
		if(i == 1) {
			return "가상계좌";
		} else if(i==2) {
			return "신용카드";
		}
		return null;
	}
	
	public static String payCompleteToString (int i) {
		if(i==1) {
			return "결제 완료";
		} else if(i==0) {
			return "결제 진행중";
		}
		return null;
	}
	
	public static String payRefundToString(int i) {
		if(i==1) {
			return "환불 완료";
		} else if(i==0) {
			return "환불 진행중";
		}
		return null;
	}

}
