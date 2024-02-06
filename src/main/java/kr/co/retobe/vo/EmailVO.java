package kr.co.retobe.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EmailVO {

	private int email_no;
	private int member_no;
	private String e_title;
	private String e_content;
	private Timestamp e_senddate;
	
	private int startIdx;
	private int page;
	private String member_name;
	
	public EmailVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 20;
	}
}
