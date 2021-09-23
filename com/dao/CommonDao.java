package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommonDao {
	DataSource pool = null;
	
	public CommonDao() {
		try {
			InitialContext initContext = new InitialContext();
			pool = (DataSource) initContext.lookup("java:comp/env/dsdbcp");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	
	public void freeConnection(ResultSet rs, PreparedStatement pstmt, Connection conn){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	public void freeConnection(PreparedStatement pstmt, Connection conn){
		try{			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
}
