package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.Qna_replDto;

public class Qna_replDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	CommonDao commonDao = null;

	public Qna_replDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Qna_replDto getSelect(String qna_repl_idx) {
		Qna_replDto qrDto = new Qna_replDto();
		try {
			String sql = "select * from qna_repl where qna_repl_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_repl_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qrDto.setRepl_content(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return qrDto;
	}
	
	public int qnaReplUpdate(String qna_repl_idx, String repl_content) {
		try {
			String sql = "update qna_repl set repl_content=?, repl_date=now() where qna_repl_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, repl_content);
			pstmt.setString(2, qna_repl_idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public int qnaReplDelete(String qna_repl_idx ) {
		try {
			String sql = "delete from qna_repl where qna_repl_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_repl_idx);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public int qnaReplWrite(String qna_idx, String member_idx, String repl_content) {
		try {
			String sql = "insert into qna_repl values(null, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_idx);
			pstmt.setString(2, member_idx);
			pstmt.setString(3, repl_content);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
}
