package com.dto;

public class Qna_boardDto {
	private int qna_idx;
	private int member_idx;
	private String qna_title;
	private String qna_content;
	private String qna_date;
	private String qna_category;
	
	   public Qna_boardDto() {}
	   public Qna_boardDto(int qna_idx, int member_idx, String qna_title, String qna_content, String qna_date, String qna_category) {
	      this.qna_idx = qna_idx;
	      this.member_idx = member_idx;
	      this.qna_title = qna_title;
	      this.qna_content = qna_content;
	      this.qna_date = qna_date;
	      this.qna_category = qna_category;
	   }
	   
	   public Qna_boardDto(int member_idx, String qna_title, String qna_content, String qna_date, String qna_category) {
		      this.member_idx = member_idx;
		      this.qna_title = qna_title;
		      this.qna_content = qna_content;
		      this.qna_date = qna_date;
		      this.qna_category = qna_category;
		   }
	
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	
	
}
