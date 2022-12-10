package dao;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
	private int id;
	private String title;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "0000";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet getNewPost(int number) {
		try {
			pstmt = conn.prepareStatement("select * from noticedata order by id desc limit ?, 3");
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			
			if(rs.next()) return rs;
			else return null;
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
	