package kr.co.retobe.util;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {

	private int admin_no;
	private int ad_type;
	private String ad_name;
	private String ad_id;
	private String ad_pwd;
	private String ad_email;
	private String ad_hp;
	private Timestamp ad_registdate;
	private int ad_charge;
	private String ad_account;
	private String logo_filename;
		
}
