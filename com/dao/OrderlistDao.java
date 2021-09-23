package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.dto.OrderlistDto;
import com.dto.Orderlist_joinDto;

public class OrderlistDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String poolurl = "jdbc:apache:commons:dbcp:pool";
	int result = 0;
	CommonDao commonDao = null;
	
	
	public OrderlistDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public int insertOrderList(OrderlistDto dto) {
		try{
			String sql = "insert into orderlist values(?,?,?,?,?,?,now(),?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrder_num());
			pstmt.setInt(2, dto.getMember_idx());
			pstmt.setString(3, dto.getOrder_name());
			pstmt.setString(4, dto.getOrder_phone());
			pstmt.setString(5, dto.getOrder_email());
			pstmt.setString(6, dto.getOrder_address());
			pstmt.setString(7, dto.getOrder_memo());
			pstmt.setInt(8, dto.getTotal_price());
			pstmt.setInt(9, dto.getUse_point());
			pstmt.setInt(10, dto.getPayment());
			pstmt.setString(11, dto.getOrder_state());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public Vector<Orderlist_joinDto> selectOrderList(){
		Vector<Orderlist_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "orderlist.order_num, "
				+ "orderlist.member_idx, "
				+ "orderlist.order_name, "
				+ "orderlist.order_phone, "
				+ "orderlist.order_email, "
				+ "orderlist.order_address, "
				+ "orderlist.order_date, "
				+ "orderlist.order_memo, "
				+ "orderlist.total_price, "
				+ "orderlist.use_point, "
				+ "orderlist.payment, "
				+ "orderlist.order_state, "
				+ "orderlist_item.items_idx, "
				+ "orderlist_item.quantity, "
				+ "items.items_name, "
				+ "items.items_img, "
				+ "items.price, "
				+ "member.id, "
				+ "(SELECT COUNT(items_idx) FROM orderlist_item WHERE orderlist_item.order_num = orderlist.order_num) "
				+ "AS order_items_cnt "
				+ "FROM orderlist "
				+ "LEFT JOIN orderlist_item "
				+ "ON orderlist.order_num = orderlist_item.order_num "
				+ "LEFT JOIN items "
				+ "ON orderlist_item.items_idx = items.items_idx "
				+ "LEFT JOIN member "
				+ "ON orderlist.member_idx = member.member_idx "
				+ "GROUP BY orderlist.order_num "
				+ "ORDER BY order_date DESC";
		
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Orderlist_joinDto orderDto = new Orderlist_joinDto();
			orderDto.setOrder_num(rs.getInt(1));
			orderDto.setMember_idx(rs.getInt(2));
			orderDto.setOrder_name(rs.getString(3));
			orderDto.setOrder_phone(rs.getString(4));
			orderDto.setOrder_email(rs.getString(5));
			orderDto.setOrder_address(rs.getString(6));
			orderDto.setOrder_date(rs.getString(7));
			orderDto.setOrder_memo(rs.getString(8));
			orderDto.setTotal_price(rs.getInt(9));
			orderDto.setUse_point(rs.getInt(10));
			orderDto.setPayment(rs.getInt(11));
			orderDto.setOrder_state(rs.getString(12));
			orderDto.setItems_idx(rs.getInt(13));
			orderDto.setQuantity(rs.getInt(14));
			orderDto.setItems_name(rs.getString(15));
			orderDto.setItems_img(rs.getString(16));
			orderDto.setPrice(rs.getInt(17));
			orderDto.setId(rs.getString(18));
			orderDto.setOrder_items_cnt(rs.getInt(19));
			v.add(orderDto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return v;
	}
	
	public Vector<Orderlist_joinDto> selectOrderInfo(int order_num){
		Vector<Orderlist_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "orderlist.order_num, "
				+ "orderlist.member_idx, "
				+ "orderlist.order_name, "
				+ "orderlist.order_phone, "
				+ "orderlist.order_email, "
				+ "orderlist.order_address, "
				+ "orderlist.order_date, "
				+ "orderlist.order_memo, "
				+ "orderlist.total_price, "
				+ "orderlist.use_point, "
				+ "orderlist.payment, "
				+ "orderlist.order_state, "
				+ "orderlist_item.items_idx, "
				+ "orderlist_item.quantity, "
				+ "items.items_name, "
				+ "items.items_img, "
				+ "items.price, "
				+ "member.id, "
				+ "(SELECT COUNT(items_idx) FROM orderlist_item WHERE orderlist_item.order_num = orderlist.order_num) "
				+ "AS order_items_cnt "
				+ "FROM orderlist "
				+ "LEFT JOIN orderlist_item "
				+ "ON orderlist.order_num = orderlist_item.order_num "
				+ "LEFT JOIN items "
				+ "ON orderlist_item.items_idx = items.items_idx "
				+ "LEFT JOIN member "
				+ "ON orderlist.member_idx = member.member_idx "
				+ "WHERE orderlist.order_num=? "
				+ "ORDER BY order_date DESC";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, order_num);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Orderlist_joinDto orderDto = new Orderlist_joinDto();
			orderDto.setOrder_num(rs.getInt(1));
			orderDto.setMember_idx(rs.getInt(2));
			orderDto.setOrder_name(rs.getString(3));
			orderDto.setOrder_phone(rs.getString(4));
			orderDto.setOrder_email(rs.getString(5));
			orderDto.setOrder_address(rs.getString(6));
			orderDto.setOrder_date(rs.getString(7));
			orderDto.setOrder_memo(rs.getString(8));
			orderDto.setTotal_price(rs.getInt(9));
			orderDto.setUse_point(rs.getInt(10));
			orderDto.setPayment(rs.getInt(11));
			orderDto.setOrder_state(rs.getString(12));
			orderDto.setItems_idx(rs.getInt(13));
			orderDto.setQuantity(rs.getInt(14));
			orderDto.setItems_name(rs.getString(15));
			orderDto.setItems_img(rs.getString(16));
			orderDto.setPrice(rs.getInt(17));
			orderDto.setId(rs.getString(18));
			orderDto.setOrder_items_cnt(rs.getInt(19));
			v.add(orderDto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return v;
	}
	
	public Vector<Orderlist_joinDto> myOrderList(int member_idx){
		Vector<Orderlist_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "orderlist.order_num, "
				+ "orderlist.member_idx, "
				+ "orderlist.order_name, "
				+ "orderlist.order_phone, "
				+ "orderlist.order_email, "
				+ "orderlist.order_address, "
				+ "orderlist.order_date, "
				+ "orderlist.order_memo, "
				+ "orderlist.total_price, "
				+ "orderlist.use_point, "
				+ "orderlist.payment, "
				+ "orderlist.order_state, "
				+ "orderlist_item.items_idx, "
				+ "orderlist_item.quantity, "
				+ "items.items_name, "
				+ "items.items_img, "
				+ "items.price, "
				+ "member.id, "
				+ "(SELECT COUNT(items_idx) FROM orderlist_item WHERE orderlist_item.order_num = orderlist.order_num) "
				+ "AS order_items_cnt "
				+ "FROM orderlist "
				+ "LEFT JOIN orderlist_item "
				+ "ON orderlist.order_num = orderlist_item.order_num "
				+ "LEFT JOIN items "
				+ "ON orderlist_item.items_idx = items.items_idx "
				+ "LEFT JOIN member "
				+ "ON orderlist.member_idx = member.member_idx "
				+ "WHERE member.member_idx=? "
				+ "GROUP BY orderlist.order_num "
				+ "ORDER BY order_date DESC";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, member_idx);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Orderlist_joinDto orderDto = new Orderlist_joinDto();
			orderDto.setOrder_num(rs.getInt(1));
			orderDto.setMember_idx(rs.getInt(2));
			orderDto.setOrder_name(rs.getString(3));
			orderDto.setOrder_phone(rs.getString(4));
			orderDto.setOrder_email(rs.getString(5));
			orderDto.setOrder_address(rs.getString(6));
			orderDto.setOrder_date(rs.getString(7));
			orderDto.setOrder_memo(rs.getString(8));
			orderDto.setTotal_price(rs.getInt(9));
			orderDto.setUse_point(rs.getInt(10));
			orderDto.setPayment(rs.getInt(11));
			orderDto.setOrder_state(rs.getString(12));
			orderDto.setItems_idx(rs.getInt(13));
			orderDto.setQuantity(rs.getInt(14));
			orderDto.setItems_name(rs.getString(15));
			orderDto.setItems_img(rs.getString(16));
			orderDto.setPrice(rs.getInt(17));
			orderDto.setId(rs.getString(18));
			orderDto.setOrder_items_cnt(rs.getInt(19));
			v.add(orderDto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return v;
	}
	
	public Vector<Orderlist_joinDto> myOrderInfo(int order_num){
		Vector<Orderlist_joinDto> v = new Vector<>();
		try{
		String sql = "SELECT "
				+ "orderlist.order_num, "
				+ "orderlist.member_idx, "
				+ "orderlist.order_name, "
				+ "orderlist.order_phone, "
				+ "orderlist.order_email, "
				+ "orderlist.order_address, "
				+ "orderlist.order_date, "
				+ "orderlist.order_memo, "
				+ "orderlist.total_price, "
				+ "orderlist.use_point, "
				+ "orderlist.payment, "
				+ "orderlist.order_state, "
				+ "orderlist_item.items_idx, "
				+ "orderlist_item.quantity, "
				+ "items.items_name, "
				+ "items.items_img, "
				+ "items.price, "
				+ "member.id, "
				+ "(SELECT COUNT(items_idx) FROM orderlist_item WHERE orderlist_item.order_num = orderlist.order_num) "
				+ "AS order_items_cnt, "
				+ "(SELECT COUNT(review_idx) FROM review WHERE review.items_idx = items.items_idx AND review.member_idx = orderlist.member_idx) AS review_cnt "
				+ "FROM orderlist "
				+ "LEFT JOIN orderlist_item "
				+ "ON orderlist.order_num = orderlist_item.order_num "
				+ "LEFT JOIN items "
				+ "ON orderlist_item.items_idx = items.items_idx "
				+ "LEFT JOIN member "
				+ "ON orderlist.member_idx = member.member_idx "
				+ "WHERE orderlist.order_num=? "
				+ "ORDER BY order_date DESC";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, order_num);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Orderlist_joinDto orderDto = new Orderlist_joinDto();
			orderDto.setOrder_num(rs.getInt(1));
			orderDto.setMember_idx(rs.getInt(2));
			orderDto.setOrder_name(rs.getString(3));
			orderDto.setOrder_phone(rs.getString(4));
			orderDto.setOrder_email(rs.getString(5));
			orderDto.setOrder_address(rs.getString(6));
			orderDto.setOrder_date(rs.getString(7));
			orderDto.setOrder_memo(rs.getString(8));
			orderDto.setTotal_price(rs.getInt(9));
			orderDto.setUse_point(rs.getInt(10));
			orderDto.setPayment(rs.getInt(11));
			orderDto.setOrder_state(rs.getString(12));
			orderDto.setItems_idx(rs.getInt(13));
			orderDto.setQuantity(rs.getInt(14));
			orderDto.setItems_name(rs.getString(15));
			orderDto.setItems_img(rs.getString(16));
			orderDto.setPrice(rs.getInt(17));
			orderDto.setId(rs.getString(18));
			orderDto.setOrder_items_cnt(rs.getInt(19));
			orderDto.setReview_cnt(rs.getInt(20));
			v.add(orderDto);
		}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return v;
	}
	
	public int stateUpdate(int order_num, int type) {
		
		String order_state = "주문취소";
		if(type == 1){
			order_state = "상품준비중";
		}else if(type == 2){
			order_state = "배송중";
		}
		
		try{
			String sql = "UPDATE orderlist SET order_state=? WHERE order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_state);
			pstmt.setInt(2, order_num);

			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	
	public int myStateUpdate(int order_num, int type) {
		
		String order_state = "배송완료";
		if(type == 1){
			order_state = "주문취소";
		}
		
		try{
			String sql = "UPDATE orderlist SET order_state=? WHERE order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_state);
			pstmt.setInt(2, order_num);

			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public int getAI() {
		int ai = 0;
		try {
			String sql = "SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'orderlist' AND table_schema = DATABASE( )";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ai = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		
		return ai;
	}
	
	
}
