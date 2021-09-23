package com.dto;

public class OrderlistDto {
	private int order_num;
	private int member_idx;
	private String order_name;
	private String order_phone;
	private String order_email;
	private String order_address;
	private String order_date;
	private String order_memo;
	private int total_price;
	private int use_point;
	private int payment;
	private String order_state;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	
	public OrderlistDto(
			// order_num,
			int member_idx,
			String order_name,
			String order_phone,
			String order_email,
			String order_address,
			String order_memo,
			int total_price,
			int use_point,
			int payment,
			String order_state
			) {
		   	this.member_idx = member_idx;
		   	this.order_name = order_name;
		   	this.order_phone = order_phone;
		   	this.order_email = order_email;
		   	this.order_address = order_address;
		   	this.order_memo = order_memo;
		   	this.total_price = total_price;
		   	this.use_point = use_point;
		   	this.payment = payment;
		   	this.order_state = order_state;
		
	}
}
