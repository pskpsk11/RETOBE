package kr.co.retobe.board.boardVO;

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
}
