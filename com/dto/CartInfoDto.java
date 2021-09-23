package com.dto;

public class CartInfoDto {
	private int items_idx;
	private String items_name;
	private int price;
	private int stock;
	private String items_img;
	private String items_category;
	private int quantity;
	
	
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
