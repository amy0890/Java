package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewReplDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String poolurl = "jdbc:apache:commons:dbcp:pool";
	int result = 0;
}
