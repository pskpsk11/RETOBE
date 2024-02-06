package kr.co.retobe.vo;

import lombok.Data;

@Data
public class PayDetailVO {
	
	private int detail_no;
	private int order_no;
	private int course_no;
	private int product_no;
	private int pay_single;
	private int pay_charge;
	private int i_education;
	private int i_area;
	private int i_branch;
	private int i_subject;
	private int i_level;
	private int i_mon;
	private int i_tue;
	private int i_wed;
	private int i_thu;
	private int i_fri;
	private int i_sat;
	private int i_sun;
	private String i_startday;
	private String i_endday;
	private String i_cname;
	private String i_time;
	private int i_price;
	
	private int startIdx;
	private int page;
}
