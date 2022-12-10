package dao;

import java.sql.*;

public class UserDAO {
	private String userID;
	private String userPassword;
	private String userName;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public void setInfo (String userID, String userPassword, String userName) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
	}
	
	// 아이디 중복 확인
	public boolean checkID(String userID) {
		try {
			pstmt = conn.prepareStatement("select * from user where userID = ?");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return false;
			}
			else {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	// 회원가입
	public int join() {
		// 이미 계정 존재: 0, 서버 오류: -1
		if(!checkID(userID)) return 0;
		try {
			pstmt = conn.prepareStatement("insert into user values (?,?,?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// 로그인
	public int login(String userID, String userPassword) {
		try {
			pstmt = conn.prepareStatement("select * from user where userID = ? and userPassword = ?");
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			rs = pstmt.executeQuery();
			
			// 로그인 성공: 1, 로그인 실패: 0, 서버 오류: -1
			if(rs.next()) {
				userName = rs.getString("userName");
				return 1;
			}
			else {
				return 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// 회원 정보 가져오기
	public String getID() {
		return userID;
	}
	public String getName() {
		return userName;
	}
}

