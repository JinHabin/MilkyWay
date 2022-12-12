<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<% 
int id;
String passwd="",sql,sql1;
Connection conn=null;
Statement stmt=null;
Statement stmt1=null;
ResultSet rs=null;
id=Integer.parseInt(request.getParameter("id"));

try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select * from noticedata where id="+id;
	rs=stmt.executeQuery(sql);
} catch(Exception e) {
	out.println("DB연동 오류입니다. : "+e.getMessage());
}

while (rs.next()) {
	
	sql1="delete from noticedata where id= '"+id+"'";
	
	try {
		stmt1.executeUpdate(sql1);
	} catch(Exception e) {
		out.println("DB연동 오류입니다. : "+e.getMessage());
	}
%>
<center><h2>게시글이 삭제되었습니다.</h2>

<a href="notice_read.jsp">게시글 목록 보기</a>
</center>
<%
}
%>
</body>
</html>