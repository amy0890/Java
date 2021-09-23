package com.dto;

public class MemberDto {
	private int member_idx;
   private String id;
   private String pw;
   private String member_name;
   private String email;
   private String address;
   private String phone;
   private int grade;
   private int lv;
   private int point;
   private String regdate;
	   
	   public MemberDto() {}
	   public MemberDto(String id, String pw, String member_name, String email, String address, String phone) {
	      this.id = id;
	      this.pw = pw;
	      this.member_name = member_name;
	      this.email = email;
	      this.address = address;
	      this.phone = phone;
	   }
	   
	   public int getMember_idx() {
	      return member_idx;
	   }
	   public void setMember_idx(int member_idx) {
	      this.member_idx = member_idx;
	   }
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      this.id = id;
	   }
	   public String getPw() {
	      return pw;
	   }
	   public void setPw(String pw) {
	      this.pw = pw;
	   }
	   public String getMember_name() {
	      return member_name;
	   }
	   public void setMember_name(String member_name) {
	      this.member_name = member_name;
	   }
	   public String getEmail() {
	      return email;
	   }
	   public void setEmail(String email) {
	      this.email = email;
	   }
	   public String getAddress() {
	      return address;
	   }
	   public void setAddress(String address) {
	      this.address = address;
	   }
	   public String getPhone() {
	      return phone;
	   }
	   public void setPhone(String phone) {
	      this.phone = phone;
	   }
	   public int getGrade() {
	      return grade;
	   }
	   public void setGrade(int grade) {
	      this.grade = grade;
	   }
	   public int getLv() {
	      return lv;
	   }
	   public void setLv(int lv) {
	      this.lv = lv;
	   }
	   public int getPoint() {
	      return point;
	   }
	   public void setPoint(int point) {
	      this.point = point;
	   }
	   public String getRegdate() {
	      return regdate;
	   }
	   public void setRegdate(String regdate) {
	      this.regdate = regdate;
	   }
}
