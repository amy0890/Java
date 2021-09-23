package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.dto.AnnounceDto;
import com.dto.Announce_joinDto;

public class AnnounceDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	CommonDao commonDao = null;
	
	public AnnounceDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertNotice(AnnounceDto announceDto){
			try{
				String sql = "insert into announce values (null, ?, ?, ?, now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, announceDto.getMember_idx());
				pstmt.setString(2, announceDto.getAnno_title());
				pstmt.setString(3, announceDto.getAnno_content());
				result = pstmt.executeUpdate();
			}catch(SQLException sqle){
				sqle.printStackTrace();
			}finally {
				commonDao.freeConnection(pstmt, conn);
			}
			return result;
		}
	
	public Vector<Announce_joinDto> selectNotice(){
		Vector<Announce_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "anno_idx,announce.member_idx,"
				+ "anno_title,"
				+ "anno_content,"
				+ "anno_date,"
				+ "member.member_name "
				+ "FROM announce "
				+ "LEFT JOIN member "
				+ "ON announce.member_idx = member.member_idx " 
				+ "ORDER BY anno_date DESC";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Announce_joinDto announceDto = new Announce_joinDto();
			announceDto.setAnno_idx(rs.getInt(1));
			announceDto.setMember_idx(rs.getInt(2));
			announceDto.setAnno_title(rs.getString(3));
			announceDto.setAnno_content(rs.getString(4));
			announceDto.setAnno_date(rs.getString(5));
			announceDto.setMember_name(rs.getString(6));
			
			v.add(announceDto);
		}

		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return v;
	}
	
	public Announce_joinDto getNoticeContent(int anno_idx){
		Announce_joinDto announceDto = new Announce_joinDto();
		try{
			String sql = "SELECT "
					+ "anno_idx,announce.member_idx,"
					+ "anno_title,"
					+ "anno_content,"
					+ "anno_date,"
					+ "member.member_name "
					+ "FROM announce "
					+ "LEFT JOIN member "
					+ "ON announce.member_idx = member.member_idx "
					+ "where anno_idx=?";
			
			
			//System.out.println(sql+":"+anno_idx);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, anno_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				announceDto.setAnno_idx(rs.getInt(1));
				announceDto.setMember_idx(rs.getInt(2));
				announceDto.setAnno_title(rs.getString(3));
				announceDto.setAnno_content(rs.getString(4));
				announceDto.setAnno_date(rs.getString(5));
				announceDto.setMember_name(rs.getString(6));
			}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		
		return announceDto;
	}	
	
	
	public int deleteNotice(int anno_idx){
		try{
			String sql = "delete from announce where anno_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, anno_idx);
			result = pstmt.executeUpdate();
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}

	
	public int updateNotice(AnnounceDto announceDto, int anno_idx){
		
		try{
			String sql = "update announce set anno_title=?, anno_content=?, anno_date=now() where anno_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, announceDto.getAnno_title());
			pstmt.setString(2, announceDto.getAnno_content());
			pstmt.setInt(3, anno_idx);
			result = pstmt.executeUpdate();
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}

		return result;
	}
}
