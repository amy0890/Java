package com.dto;

public class AnnounceDto {
	private int anno_idx;
	private int member_idx;
	private String anno_title;
	private String anno_content;
	private String anno_date;
	
	public AnnounceDto() {
		
	}
	
	public AnnounceDto(int anno_idx, int member_idx, String anno_title, String anno_content, String anno_date) {
		this.anno_idx = anno_idx;
		this.member_idx = member_idx;
		this.anno_title = anno_title;
		this.anno_content = anno_content;
		this.anno_date = anno_date;
	}
	
	public AnnounceDto(int anno_idx, String anno_title, String anno_content, String anno_date) {
		this.anno_idx = anno_idx;
		this.anno_title = anno_title;
		this.anno_content = anno_content;
		this.anno_date = anno_date;
	}
	
	public AnnounceDto(int member_idx, String anno_title, String anno_content) {
		this.member_idx = member_idx;
		this.anno_title = anno_title;
		this.anno_content = anno_content;
	}
	
	public int getAnno_idx() {
		return anno_idx;
	}
	public void setAnno_idx(int anno_idx) {
		this.anno_idx = anno_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getAnno_title() {
		return anno_title;
	}
	public void setAnno_title(String anno_title) {
		this.anno_title = anno_title;
	}
	public String getAnno_content() {
		return anno_content;
	}
	public void setAnno_content(String anno_content) {
		this.anno_content = anno_content;
	}
	public String getAnno_date() {
		return anno_date;
	}
	public void setAnno_date(String anno_date) {
		this.anno_date = anno_date;
	}
	
	
}
