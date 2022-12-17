package dao.bean;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class notDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public notDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID="root";
			String dbPW="0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String sql = "select id from noticedata order by id desc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();			
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getNext1() {
		String sql = "select id from welfarenotice order by id desc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();			
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String title, String content, String type,String wtime) {
		String sql;
		int x;
		if (type.equals("e")) {
			type="행사";
		}
		else if (type.equals("h")) {
			type="의료";
		}
		else {
			type="복지";
		}
		
		sql="insert into noticedata values(?,?,?,?,?,?)";
		x=getNext();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			pstmt.setString(2, title);
			pstmt.setString(3, "admin");
			pstmt.setString(4,type);
			pstmt.setString(5,content);
			pstmt.setString(6,wtime);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
	
	public int write1(String title, String content, String type,String wtime) {
		String sql;
		int x;
		
		sql="insert into welfarenotice values(?,?,?,?,?,?)";
		x=getNext1();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			pstmt.setString(2, title);
			pstmt.setString(3, "admin");
			pstmt.setString(4,type);
			pstmt.setString(5,content);
			pstmt.setString(6,wtime);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
	
	public String makeSql(String type) {
		String t;
		String sql;
		if (type.equals("e")) {
			sql="select * from noticedata where type='행사' and ";
		}
		else if (type.equals("h")) {
			sql="select * from noticedata where type='의료' and ";
		}
		else if (type.equals("w")) {
			sql="select * from noticedata where type='복지' and ";
		}
		else if (type.equals("a")){
			sql="select * from noticedata where ";
		}
		else {
			sql="select * from welfarenotice where ";	
		}
		return sql;
		
		
	}
	
	public ArrayList<ndao> getList(int pageNumber,String type) {
		String s=makeSql(type);
		int x=getNext()-(pageNumber-1)*10;
		String sql = s+"id < ? ORDER BY id DESC LIMIT 10"; //AND bbsAvailable = 1 
		ArrayList<ndao> list = new ArrayList<ndao>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ndao bbs = new ndao();
				bbs.setID(rs.getInt(1));
				bbs.setTitle(rs.getString(2));
				bbs.setName(rs.getString(3));
				bbs.setType(rs.getString(4));
				bbs.setContent(rs.getString(5));
				bbs.setWtime(rs.getString(6));
				
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ndao> getList1(int pageNumber) {
		int x=getNext1()-(pageNumber-1)*10;
		String sql = "select * from welfarenotice where id < ? ORDER BY id DESC LIMIT 10"; //AND bbsAvailable = 1 
		ArrayList<ndao> list = new ArrayList<ndao>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ndao bbs = new ndao();
				bbs.setID(rs.getInt(1));
				bbs.setTitle(rs.getString(2));
				bbs.setName(rs.getString(3));
				bbs.setType(rs.getString(4));
				bbs.setContent(rs.getString(5));
				bbs.setWtime(rs.getString(6));
				
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber,String type) {
		if (type=="e") {
			type="행사";
		}
		else if (type=="h") {
			type="건강";
		} 
		else if (type=="w") {
			type="복지";
		}
		else {
			
		}
		String sql;
		int x;
		String s;
		s=makeSql(type);
		sql=s+"id < ?";
		x=getNext()-((pageNumber-1)*10);
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	public ndao showPage(int id, String type) {
		String sql;
		if (type=="n") {
			sql="select * from noticedata where id=?";
		}
		else {
			sql="select * from welfarenotice where id=?";
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				ndao bbs=new ndao();
				bbs.setID(rs.getInt(1));
				bbs.setTitle(rs.getString(2));
				bbs.setName(rs.getString(3));
				bbs.setType(rs.getString(4));
				bbs.setContent(rs.getString(5));
				bbs.setWtime(rs.getString(6));
				
				return bbs;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int modi(int id, String title, String content,String type) {
		String sql;
		if (type=="행사") {
			type="행사";
			sql="update noticedata set title=?, type='행사', content=? where id=?";
		}
		else if (type=="건강") {
			type="건강";
			sql="update noticedata set title=?, type='건강', content=? where id=?";
		}
		else if (type=="복지") {
			type="복지";
			sql="update noticedata set title=?, type='복지', content=? where id=?";
		}
		else {
			sql="update welfarenotice set title=?, content=? where id=?";
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3,id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int modi1(int id, String title, String content,String type) {
		String sql;
		if (type=="행사") {
			type="행사";
			sql="update noticedata set title=?, type='행사', content=? where id=?";
		}
		else if (type=="건강") {
			type="건강";
			sql="update noticedata set title=?, type='건강', content=? where id=?";
		}
		else if (type=="복지") {
			type="복지";
			sql="update noticedata set title=?, type='복지', content=? where id=?";
		}
		else {
			sql="update welfarenotice set title=?, content=? where id=?";
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3,id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int id,String type) {
		String sql;
		if (type=="n") {
			sql="delete from noticedata where id=?";
		}
		else {
			sql="delete from welfarenotice where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		}
		return -1;
		
	}
}
