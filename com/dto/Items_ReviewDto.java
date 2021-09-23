package com.dto;

public class Items_ReviewDto {
	private int items_idx;
	private String items_name;
	private int price;
	private String items_img;
	private String items_info1;
	private String items_info2;
	private String items_info3;
	private String items_info4;
	private String items_category;
	private double items_star_avg;
	private int sales_cnt;
	private int stock;
	private int items_review_cnt;
	
	public Items_ReviewDto() {
		
	}

	public int getItems_idx() {
		return items_idx;
	}

	public void setItems_idx(int items_idx) {
		this.items_idx = items_idx;
	}

	public String getItems_name() {
		return items_name;
	}

	public void setItems_name(String items_name) {
		this.items_name = items_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getItems_img() {
		return items_img;
	}

	public void setItems_img(String items_img) {
		this.items_img = items_img;
	}

	public String getItems_category() {
		return items_category;
	}

	public void setItems_category(String items_category) {
		this.items_category = items_category;
	}

	public double getItems_star_avg() {
		return items_star_avg;
	}

	public void setItems_star_avg(double items_star_avg) {
		this.items_star_avg = items_star_avg;
	}

	public int getSales_cnt() {
		return sales_cnt;
	}

	public void setSales_cnt(int sales_cnt) {
		this.sales_cnt = sales_cnt;
	}

	public String getItems_info1() {
		return items_info1;
	}

	public void setItems_info1(String items_info1) {
		this.items_info1 = items_info1;
	}

	public String getItems_info2() {
		return items_info2;
	}

	public void setItems_info2(String items_info2) {
		this.items_info2 = items_info2;
	}

	public String getItems_info3() {
		return items_info3;
	}

	public void setItems_info3(String items_info3) {
		this.items_info3 = items_info3;
	}

	public String getItems_info4() {
		return items_info4;
	}

	public void setItems_info4(String items_info4) {
		this.items_info4 = items_info4;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getItems_review_cnt() {
		return items_review_cnt;
	}

	public void setItems_review_cnt(int items_review_cnt) {
		this.items_review_cnt = items_review_cnt;
	}
	
	

	

}
