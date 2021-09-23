package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.OrderlistItemDto;

public class OrderlistItemDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String poolurl = "jdbc:apache:commons:dbcp:pool";
	int result = 0;
	CommonDao commonDao = null;
	
	
	public OrderlistItemDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertOL_item(OrderlistItemDto oliDto) {
		try {
			String sql = "insert into orderlist_item values(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oliDto.getOrder_num());
			pstmt.setInt(2, oliDto.getItems_idx());
			pstmt.setInt(3, oliDto.getQuantity());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}

}
