package kr.co.retobe.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {

	private int qna_no;
	private int member_no;
	
	private String q_title;
	private String q_content;
	private Timestamp q_writedate;
	private String q_reply;
	
	private int startIdx;
	private int page;
	private String searchType;
	private String searchWord;
	
	private String member_name;
	   
	public QnaVO() {
		this.page = 1;
	}
	public int getStartIdx() {
		return (page-1) * 10;
	}
	
	private int q_viewcnt;
	
	private int gno;
	private int ono;
	private int nested;
	
}
