<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head><title>게시판</title></head>
<body>
<%
int temp=0, cnt;
int new_id=0;
String name, addr, num, wgu,link,t,type,cnt1;

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
String sql_update;

try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	String sql="select max(id) from welfaredata";
	rs=stmt.executeQuery(sql);
	
} catch(Exception e) {
	out.println("DB연동 오류입니다. : "+ e.getMessage());
}

while (rs.next()) {
	
	cnt1=rs.getString("max(id)");
	if (cnt1==null) {
		cnt=0;
	}
	else {
		cnt=Integer.parseInt(cnt1);
	}
	
	if (cnt!=0) 
		new_id=Integer.parseInt(rs.getString("max(id)"));
}
new_id++;
name=request.getParameter("wName");
addr=request.getParameter("wAddress");
num=request.getParameter("wNumber");
wgu=request.getParameter("wGu");
link=request.getParameter("wlink");
t=request.getParameter("type");

if (t.equals("w")) {
	type="복지관";
}
else if (t.equals("y")) {
	type="요양시설";
}
else {
	type="";
}


sql_update ="insert into welfaredata values ('"+new_id+"','"+name+"','"+addr+"','"+num+"','"+wgu+"','"+link+"','"+type+"')";


try {
	stmt.executeUpdate(sql_update);
	
} catch(Exception e) {
	out.println("DB연동 오류입니다. : "+e.getMessage());
}
%>
<center>
<h2>작성한 글이 등록 되었습니다.</h2>

<a href="page2.jsp">게시글 목록 보기</a>
</center>
</body>
</html>
