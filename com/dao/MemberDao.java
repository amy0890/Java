package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import org.json.simple.JSONObject;

import com.dto.MemberDto;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	CommonDao commonDao = null;

	public MemberDao() {
		commonDao = new CommonDao();
		try {
			conn = commonDao.pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ȸ������
	public int insertMemberData(MemberDto dto) {
		try {
			String sql = "insert into member values(null,?,?,?,?,?,?,default,default,default,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}

	// �α���
	public MemberDto loginMember(String id, String pw) {
		MemberDto dto = new MemberDto();
		try {
			String sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMember_idx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setMember_name(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setPhone(rs.getString(7));
				dto.setGrade(rs.getInt(8));
				dto.setLv(rs.getInt(9));
				dto.setPoint(rs.getInt(10));
				dto.setRegdate(rs.getString(11));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return dto;
	}
	
	// ȸ������
	public MemberDto selectMemberData(int idx) {
		MemberDto dto = new MemberDto();
		try {
			String sql = "select * from member where member_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMember_idx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setMember_name(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setPhone(rs.getString(7));
				dto.setGrade(rs.getInt(8));
				dto.setLv(rs.getInt(9));
				dto.setPoint(rs.getInt(10));
				dto.setRegdate(rs.getString(11));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return dto;
	}
	
	// ȸ�� ���� ����
	public int updateMemberData(MemberDto dto) {
		try {
			String sql = "update member set member_name=?,phone=?,email=?,address=?,pw="
						+ "case "
						+ "when ?!='' then ? "
						+ "else pw "
						+ "end "
						+ "where member_idx=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMember_name());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getPw());
			pstmt.setString(6, dto.getPw());
			pstmt.setInt(7, dto.getMember_idx());	
			result = pstmt.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	// ���̵� �ߺ�Ȯ�� Ajax
	public JSONObject checkIdData(String id) {
		JSONObject json = new JSONObject();
		int rtn = 0;
		try {
			String sql = "select count(member_idx) from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// count �� 1 �̸� (0���� ũ��) �ش� ���̵� �����Ѵٴ� �ǹ�
			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					rtn = 1; // ���Ұ�
				}
				json.put("rtn", rtn);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return json;
	}

	// �α��� - ���̵�,��й�ȣ, lv Ȯ�� Ajax
	public JSONObject checkMemberData(String id, String pw) {
		JSONObject json = new JSONObject();
		int rtn = 0;
		try {
			String sql = "select count(member_idx),lv from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					rtn = 1; // �α��� ���� ��ġ
				}
				json.put("rtn", rtn);
				json.put("rtn_lv", rs.getInt(2));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return json;
	}
	
	// ��й�ȣ Ȯ�� Ajax
	public JSONObject checkPwData(int idx, String pw) {
		JSONObject json = new JSONObject();
		int rtn = 0;
		try {
			String sql = "select count(member_idx) from member where member_idx=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if(rs.getInt(1) > 0) {
					rtn = 1;
				}
				json.put("rtn", rtn);					
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return json;
	}	
	
	// ȸ��Ż��
	public int withdrawalMember(int idx) {
		try {
			String sql = "update member set lv=2 where member_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		return result;
	}
	
	public Vector<MemberDto> getMemberList() {
		Vector<MemberDto> memberV = new Vector<>();
		try {
			String sql = "select * from member order by member_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto memberDto = new MemberDto();
				memberDto.setMember_idx(rs.getInt(1));
				memberDto.setId(rs.getString(2));
				memberDto.setMember_name(rs.getString(4));
//				memberDto.setEmail(rs.getString(5));
//				memberDto.setAddress(rs.getString(6));
//				memberDto.setPhone(rs.getString(7));
				memberDto.setGrade(rs.getInt(8));
				memberDto.setLv(rs.getInt(9));
//				memberDto.setPoint(rs.getInt(10));
				memberDto.setRegdate(rs.getString(11));
				memberV.add(memberDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(rs, pstmt, conn);
		}
		return memberV;
	}
	
	public int memberBlock(String idx) {
		try {
			String sql = "update member set lv=1 where member_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			commonDao.freeConnection(pstmt, conn);
		}
		
		return result;
	}
}
