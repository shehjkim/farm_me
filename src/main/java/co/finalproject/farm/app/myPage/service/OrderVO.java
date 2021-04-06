package co.finalproject.farm.app.myPage.service;

import lombok.Data;

@Data
public class OrderVO {
	
	private String order_no;
	private String order_date;
	private String order_condition;
	private String order_invoice;
	private String order_totalprice;
	private String order_zip;
	private String order_adr;
	private String order_detailadr;
	private String order_name;
	private String order_phone;
	private String order_payment;
	private String user_id;
}
