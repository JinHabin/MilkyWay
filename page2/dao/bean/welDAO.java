package dao.bean;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class welDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public welDAO() {
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
		
		String sql = "select bbsID from wdata order by bbsID desc";
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
	public int getNexty() {
		String sql = "select bbsID from ydata order by bbsID desc";
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
	
	public int write(String name, String addr, String number, String location, String link, String type) {
		String sql;
		int x;
		if (type.equals("복지관")) {
			sql="insert into wdata values (?,?,?,?,?,?,?,?)";
			x=getNext();
		}
		else {
			sql="insert into ydata values (?,?,?,?,?,?,?,?)";
			x=getNexty();
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			pstmt.setString(2, name);
			pstmt.setString(3, addr);
			pstmt.setString(4,number);
			pstmt.setString(5,location);
			pstmt.setString(6,link);
			pstmt.setString(7,type);
			pstmt.setInt(8,1);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String makeSql(String locat) {
		String loc;
		String sql;
		if (locat.equals("a")) {
			loc="all";
			sql="select * from wdata where ";
		}
		else {
			if (locat.equals("j")) {
				loc="중구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("nw")) {
				loc="노원구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gn")) {
				loc="강남구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gb")) {
				loc="강북구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sc")) {
				loc="서초구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("yc")) {
				loc="양천구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("mp")) {
				loc="마포구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gs")) {
				loc="강서구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ep")) {
				loc="은평구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("jr")) {
				loc="종로구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ys")) {
				loc="용산구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sd")) {
				loc="성동구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gj")) {
				loc="광진구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("jr")) {
				loc="증랑구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sb")) {
				loc="성북구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("db")) {
				loc="도봉구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sd")) {
				loc="서대문구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gc")) {
				loc="금천구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("kr")) {
				loc="구로구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ydp")) {
				loc="영등포구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("kd")) {
				loc="강동구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sp")) {
				loc="송파구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ka")) {
				loc="관악구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			else {
				loc="동대문구";
				sql="select * from wdata where location='"+loc+ "' and ";
			}
			
		}
		return sql;
	}
	
	public String makeSqly(String locat) {
		String loc;
		String sql;
		if (locat.equals("a")) {
			loc="all";
			sql="select * from ydata where ";
		}
		else {
			if (locat.equals("j")) {
				loc="중구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("nw")) {
				loc="노원구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gn")) {
				loc="강남구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gb")) {
				loc="강북구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sc")) {
				loc="서초구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("yc")) {
				loc="양천구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("mp")) {
				loc="마포구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gs")) {
				loc="강서구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ep")) {
				loc="은평구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("jr")) {
				loc="종로구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ys")) {
				loc="용산구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sd")) {
				loc="성동구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gj")) {
				loc="광진구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("jr")) {
				loc="증랑구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sb")) {
				loc="성북구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("db")) {
				loc="도봉구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sd")) {
				loc="서대문구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("gc")) {
				loc="금천구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("kr")) {
				loc="구로구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ydp")) {
				loc="영등포구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("kd")) {
				loc="강동구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("sp")) {
				loc="송파구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else if (locat.equals("ka")) {
				loc="관악구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			else {
				loc="동대문구";
				sql="select * from ydata where location='"+loc+ "' and ";
			}
			
		}
		return sql;
	}

	
	
	
	
	public ArrayList<dao> getList(int pageNumber,String locat) {
		String s=makeSql(locat);
		int x=getNext()-(pageNumber-1)*10;
		String sql = s+"bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<dao> list = new ArrayList<dao>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dao bbs = new dao();
				bbs.setBbsID(rs.getInt(1));
				bbs.setName(rs.getString(2));
				bbs.setAddr(rs.getString(3));
				bbs.setNumber(rs.getString(4));
				bbs.setLocation(rs.getString(5));
				bbs.setLink(rs.getString(6));
				bbs.setType(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<dao> getListy(int pageNumber,String locat) {
		String s=makeSqly(locat);
		int x=getNext()-(pageNumber-1)*10;
		String sql = s+"bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<dao> list = new ArrayList<dao>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dao bbs = new dao();
				bbs.setBbsID(rs.getInt(1));
				bbs.setName(rs.getString(2));
				bbs.setAddr(rs.getString(3));
				bbs.setNumber(rs.getString(4));
				bbs.setLocation(rs.getString(5));
				bbs.setLink(rs.getString(6));
				bbs.setType(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber,String locat, String type) {
		String sql;
		String s;
		String l;
		int x,p;
		if (type.equals("복지관")) {
			l=makeLoc(locat);
			if (l=="all") {
				sql="select count(bbsID) from wdata";
			}
			else {
				sql="select count(bbsID) from wdata where location='"+l+"'";
				
			}
			x=getNext()-((pageNumber-1)*10);
		}
		else {
			l=makeLoc(locat);
			if (l=="all") {
				sql="select count(bbsID) from ydata";
			}
			else {
				sql="select count(bbsID) from ydata where location='"+l+"'";
				
			}
			x=getNexty()-((pageNumber-1)*10);
		}
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				p=Integer.parseInt(rs.getString("count(bbsID)"));
				p=p-(pageNumber-1)*10;
				if (p>0) {
					return true;
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public dao getDao(int bbsID) {
		String sql = "SELECT * FROM welfarenotice WHERE bbsID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				dao bbs = new dao();
				bbs.setBbsID(rs.getInt(1));
				bbs.setName(rs.getString(2));
				bbs.setAddr(rs.getString(3));
				bbs.setNumber(rs.getString(4));
				bbs.setLocation(rs.getString(5));
				bbs.setLink(rs.getString(6));
				bbs.setType(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				
				return bbs;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	
	public String makeLoc(String locat) {
		String loc;
		String sql;
		if (locat.equals("a")) {
			loc="all";
		}
		else {
			if (locat.equals("j")) {
				loc="중구";
			}
			else if (locat.equals("nw")) {
				loc="노원구";
			}
			else if (locat.equals("gn")) {
				loc="강남구";
			}
			else if (locat.equals("gb")) {
				loc="강북구";
			}
			else if (locat.equals("sc")) {
				loc="서초구";
			}
			else if (locat.equals("yc")) {
				loc="양천구";
			}
			else if (locat.equals("mp")) {
				loc="마포구";
			}
			else if (locat.equals("gs")) {
				loc="강서구";
			}
			else if (locat.equals("ep")) {
				loc="은평구";
			}
			else if (locat.equals("jr")) {
				loc="종로구";
			}
			else if (locat.equals("ys")) {
				loc="용산구";
			}
			else if (locat.equals("sd")) {
				loc="성동구";
			}
			else if (locat.equals("gj")) {
				loc="광진구";
			}
			else if (locat.equals("jr")) {
				loc="증랑구";
			}
			else if (locat.equals("sb")) {
				loc="성북구";
			}
			else if (locat.equals("db")) {
				loc="도봉구";
			}
			else if (locat.equals("sd")) {
				loc="서대문구";
			}
			else if (locat.equals("gc")) {
				loc="금천구";
			}
			else if (locat.equals("kr")) {
				loc="구로구";
			}
			else if (locat.equals("ydp")) {
				loc="영등포구";
			}
			else if (locat.equals("kd")) {
				loc="강동구";
			}
			else if (locat.equals("sp")) {
				loc="송파구";
			}
			else if (locat.equals("ka")) {
				loc="관악구";
			}
			else {
				loc="동대문구";
			}
		}
		return loc;
	}
	
	
	
	

}
