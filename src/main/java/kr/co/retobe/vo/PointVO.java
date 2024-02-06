package kr.co.retobe.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PointVO {
	
	private int point_no;
	private int member_no;
	private int p_category;
	private int p_type;
	private Timestamp p_date;
	
	private int startIdx;
	private int page;
}
