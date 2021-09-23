package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.dto.AnnounceDto;
import com.dto.Qna_boardDto;
import com.dto.Qna_board_joinDto;

public class Qna_boardDao {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   int result = 0;
	   CommonDao commonDao = null;
	   
	   public Qna_boardDao() {
	      commonDao = new CommonDao();
	      try {
	         conn = commonDao.pool.getConnection();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
	
	public Vector<Qna_board_joinDto> getQboard(){
		Vector<Qna_board_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "qna_board.qna_idx, "
				+ "qna_board.member_idx, "
				+ "qna_title, "
				+ "qna_content, "
				+ "qna_date, "
				+ "qna_category, "
				+ "member.id, "
				+ "member.member_name, "
				+ "(SELECT COUNT(*) FROM qna_repl WHERE qna_idx = qna_board.qna_idx) AS qna_repl_state "
				+ "FROM qna_board "
				+ "LEFT JOIN member "
				+ "ON qna_board.member_idx = member.member_idx "
				+ "ORDER BY qna_date DESC";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Qna_board_joinDto jdto = new Qna_board_joinDto();
			jdto.setQna_idx(rs.getInt(1));
			jdto.setMember_idx(rs.getInt(2));
			jdto.setQna_title(rs.getString(3));
			jdto.setQna_content(rs.getString(4));
			jdto.setQna_date(rs.getString(5));
			jdto.setQna_category(rs.getString(6));
			jdto.setId(rs.getString(7));
			jdto.setMember_name(rs.getString(8));
			jdto.setQna_repl_state(rs.getInt(9));
			v.add(jdto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs,pstmt, conn);
		}
		
		return v;
	}
	
	public Vector<Qna_board_joinDto> idxQboard(int qna_idx){
		Vector<Qna_board_joinDto> qbjV = new Vector<>();
		try{
		String sql = "SELECT "
				+ "qna_board.qna_idx, "
				+ "qna_board.member_idx, "
				+ "qna_title, "
				+ "qna_content, "
				+ "qna_date, "
				+ "qna_category, "
				+ "member.id, "
				+ "member.member_name, "
				+ "qna_repl.qna_repl_idx, "
				+ "(SELECT member_name FROM member WHERE member.member_idx = qna_repl.member_idx) AS qna_repl_member_name, "
				+ "qna_repl.repl_date, "
				+ "qna_repl.repl_content "
				+ "FROM qna_board "
				+ "LEFT JOIN member "
				+ "ON qna_board.member_idx = member.member_idx "
				+ "LEFT JOIN qna_repl "
				+ "ON qna_board.qna_idx = qna_repl.qna_idx "
				+ "WHERE qna_board.qna_idx=? "
				+ "ORDER BY qna_date DESC;";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, qna_idx);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Qna_board_joinDto jDto = new Qna_board_joinDto();
			jDto.setQna_idx(rs.getInt(1));
			jDto.setMember_idx(rs.getInt(2));
			jDto.setQna_title(rs.getString(3));
			jDto.setQna_content(rs.getString(4));
			jDto.setQna_date(rs.getString(5));
			jDto.setQna_category(rs.getString(6));
			jDto.setId(rs.getString(7));
			jDto.setMember_name(rs.getString(8));
			jDto.setQna_repl_idx(rs.getInt(9));
			jDto.setQna_repl_member_name(rs.getString(10));
			jDto.setRepl_date(rs.getString(11));
			jDto.setRepl_content(rs.getString(12));
			qbjV.add(jDto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs,pstmt, conn);
		}
		
		return qbjV;
	}
	
	public Vector<Qna_board_joinDto> myQboard(int member_idx){
		Vector<Qna_board_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "qna_board.qna_idx, "
				+ "qna_board.member_idx, "
				+ "qna_title, "
				+ "qna_content, "
				+ "qna_date, "
				+ "qna_category, "
				+ "member.id, "
				+ "member.member_name, "
				+ "(SELECT COUNT(*) FROM qna_repl WHERE qna_idx = qna_board.qna_idx) AS qna_repl_state "
				+ "FROM qna_board "
				+ "LEFT JOIN member "
				+ "ON qna_board.member_idx = member.member_idx "
				+ "where qna_board.member_idx=? "
				+ "ORDER BY qna_date DESC";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, member_idx);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Qna_board_joinDto jdto = new Qna_board_joinDto();
			jdto.setQna_idx(rs.getInt(1));
			jdto.setMember_idx(rs.getInt(2));
			jdto.setQna_title(rs.getString(3));
			jdto.setQna_content(rs.getString(4));
			jdto.setQna_date(rs.getString(5));
			jdto.setQna_category(rs.getString(6));
			jdto.setId(rs.getString(7));
			jdto.setMember_name(rs.getString(8));
			jdto.setQna_repl_state(rs.getInt(9));
			v.add(jdto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs,pstmt, conn);
		}
		
		return v;
	}
	
	public int insertQBoard(Qna_boardDto qdto){
		try{
			String sql = "insert into qna_board values (null, ?, ?, ?, now(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qdto.getMember_idx());
			pstmt.setString(2, qdto.getQna_title());
			pstmt.setString(3, qdto.getQna_content());
			pstmt.setString(4, qdto.getQna_category());
			result = pstmt.executeUpdate();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public int deleteQBoard(int qna_idx){
		try{
			String sql = "delete from qna_board where qna_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qna_idx);
			result = pstmt.executeUpdate();
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public int updateQBoard(Qna_boardDto qDto, int qna_idx){
		try{
			String sql = "update qna_board set qna_category=?, qna_title=?, qna_content=?, qna_date=now() where qna_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, qDto.getQna_category());
			pstmt.setString(2, qDto.getQna_title());
			pstmt.setString(3, qDto.getQna_content());
			pstmt.setInt(4, qna_idx);
			result = pstmt.executeUpdate();
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}

		return result;
	}

}


