package kr.co.retobe.util;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {

	private int member_no;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private int gender;
	private String birthday;
	private String hp;
	private Timestamp registdate;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int point;
	private boolean email_agree;
	private boolean user_validity;
	
	private int startIdx;
	private int page;
	
	private String searchWord;
	
	private String startday;
	private String endday;
	private String birthDayStartday;
	private String birthDayEndday;
	
	public MemberVO() {
		this.page = 1;
	}

	public int getStartIdx() {
		return (page-1) * 10;
	}
	
}
