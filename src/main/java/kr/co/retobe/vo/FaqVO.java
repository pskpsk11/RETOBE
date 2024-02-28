package kr.co.retobe.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FaqVO {

	private int faq_no;
	private String f_title;
	private String f_content;
	
	private int startIdx;
	private int page;
	
	public FaqVO() {
		this.page = 1;
	}
	public int getStartIdx() {
		return (page-1) * 10;
		
	}
	private String searchType;
	private String searchWord;
}
