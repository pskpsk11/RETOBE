package kr.co.retobe.board.boardVO;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {

	private int notice_no;
	private String n_title;
	private String n_content;
	private Timestamp n_writedate;
	
	private int startIdx;
	private int page;
	private String searchType;
	private String searchWord;
	
	public NoticeVO() {
		this.page = 1;
	}
	public int getStartIdx() {
		return (page-1) * 10;
	}
}
