package com.dto;

public class ReviewDto {
	private int review_idx;
	private int items_idx;
	private int member_idx;
	private String review_Date;
	private String review_content;
	private String review_img;
	private int review_star;
	
	public ReviewDto() {
	
	}
	public ReviewDto(int review_idx,int items_idx,int member_idx, String review_Date, String review_content,String review_img,int review_star) {
		this.review_idx = review_idx;
		this.items_idx = items_idx;
		this.member_idx = member_idx;
		this.review_Date = review_Date;
		this.review_content = review_content;
		this.review_img = review_img;
		this.review_star = review_star;
	}
	public ReviewDto( String review_content,String review_img,int review_star) {
		this.review_content = review_content;
		this.review_img = review_img;
		this.review_star = review_star;
	}

	
	public int getItems_idx() {
		return items_idx;
	}
	public void setItems_idx(int items_idx) {
		this.items_idx = items_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_Date() {
		return review_Date;
	}
	public void setReview_Date(String review_Date) {
		this.review_Date = review_Date;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

}
