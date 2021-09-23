package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.dto.Items_ReviewDto;
import com.dto.ReviewDto;
import com.dto.Review_ListDto;

public class ReviewDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	CommonDao commonDao = null;

	public ReviewDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Vector<Review_ListDto> getReviewInfo(int idx) {
		Vector<Review_ListDto> items_review = new Vector<>();
		try {
			String sql = "SELECT review_idx, "
					+ "items_idx, "
					+ "review.member_idx, "
					+ "review_date, "
					+ "review_content, "
					+ "review_img, "
					+ "review_star, "
					+ "(SELECT id FROM member WHERE review.member_idx = member.member_idx) AS review_write_id "
					+ "FROM review "
					+ "WHERE items_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review_ListDto reviewDto = new Review_ListDto();
				reviewDto.setReview_idx(rs.getInt(1));
				reviewDto.setItems_idx(rs.getInt(2));
				reviewDto.setMember_idx(rs.getInt(3));
				reviewDto.setReview_date(rs.getString(4));
				reviewDto.setReview_content(rs.getString(5));
				reviewDto.setReview_img(rs.getString(6));
				reviewDto.setReview_star(rs.getInt(7));
				reviewDto.setReview_write_id(rs.getString(8));
				items_review.add(reviewDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return items_review;
	}
	
	public int insertReview(ReviewDto rvDto){
		try{
			String sql = "insert into review values (null, ?, ?, now(), ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvDto.getItems_idx());
			pstmt.setInt(2, rvDto.getMember_idx());
			pstmt.setString(3, rvDto.getReview_content());
			pstmt.setString(4, rvDto.getReview_img());
			pstmt.setInt(5, rvDto.getReview_star());
			result = pstmt.executeUpdate();
			
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
}
