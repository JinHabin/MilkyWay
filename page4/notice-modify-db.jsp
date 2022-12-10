<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<body>
<% 
int id;
String passwd="",sql,sql1,type,t;
String title="", content="";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
id=Integer.parseInt(request.getParameter("id"));

title=request.getParameter("title");
content=request.getParameter("content");
t=request.getParameter("type");
content=content.replace("\n","<br>");

if (t.equals("e")) {
	type="행사";
}
else if (t.equals("h")) {
	type="의료";
}
else {
	type="복지";
}


try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select * from noticedata";
	rs=stmt.executeQuery(sql);
	
} catch(Exception e) {
	out.println("DB연동 오류입니다. : "+e.getMessage());
}

while (rs.next()) {
	
		sql1="update noticedata set title='"+title+"', type='"+type+
				"', content='"+content+"' where id= '"+id+"'";
	
	try {
		stmt.executeUpdate(sql1);
	} catch(Exception e) {
		out.println("DB연동 오류입니다. : "+e.getMessage());
	}
	break;
}


%>
<center><h2>게시글이 수정되었습니다.</h2>

<a href="notice_read.jsp">게시글 목록 보기</a>

</body>
</html>