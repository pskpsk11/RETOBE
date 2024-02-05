package kr.co.retobe.order.orderVO;

import lombok.Data;

@Data
public class PayVO {
	
	private int order_no;
	private int member_no;
	private int pay_complete;
	private int pay_cancel;
	private int pay_refund;
	private String pay_date;
	private String pay_cancel_date;
	private String pay_refund_date;
	private int pay_by;
	private String pay_by_account;
	private int pay_total;
	private int point_usage;
	private int charge_total;
	private String pay_detail;
	private int pay_cancel_reason;
	private String pay_cancel_reason_detail;
	
	private int startIdx;
	private int page;
		
}
