package com.dto;

public class OrderlistItemDto {
	private int order_idx;
	private int order_num;
	private int items_idx;
	private int quantity;
	
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getItems_idx() {
		return items_idx;
	}
	public void setItems_idx(int items_idx) {
		this.items_idx = items_idx;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public OrderlistItemDto(int order_num, int items_idx, int quantity) {
		this.order_num = order_num;
		this.items_idx = items_idx;
		this.quantity = quantity;
	}
	public OrderlistItemDto() {

	}
}
