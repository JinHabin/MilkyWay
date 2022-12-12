<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .main {
            text-align : center;
            margin : 0 auto;
        }
		header {
        	height : 150px;
        	border : 3px solid #3e8996;
        	margin : 10px;
        	border-radius : 30px;
        }
        .board {
            width:800px;
            margin-left : 100px;
            margin-right : 100px;
        }
        .t1 {
            width : 100%;
            border : 1px solid #909090;
            font-size : 17px;
            height : 30px;
        }
        .t2 {
            width : 100%;
            border : 1px solid #909090;
            font-size : 13px;
        }
        .t3 {
            width : 100%;
        }
        .t4 {
            float : right;
        }
</style>
</head>
<body>
<%
int id;
String passwd="",sql,sql1;
String name="",title="",content="",type="";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
id=Integer.parseInt(request.getParameter("id"));


try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select * from noticedata where id='"+id+"'";
	rs=stmt.executeQuery(sql);
} catch(Exception e) {
	out.println("DB연동 오류입니다. : "+e.getMessage());
}

while (rs.next()) {
		title=rs.getString("title");
	 	content=rs.getString("content");
	 	type=rs.getString("type");
	 	content=content.replace("<br>","\n");
%>

<div class="board">
<form action="notice-modify-db.jsp?id=<%=id %>" method="post">
<table>
<tr><td>글 제 목</td></tr>
<tr><td><input class="t1" type="text" name="title" value="<%=title%>"/></td></tr>
<tr>
<td>말머리</td></tr>
<tr>
<td>
<select name="type">
<option value="e" selected>행사</option>
<option value="h">의료</option>
<option value="w">복지</option>
</select></td></tr>
<tr><td>글 내 용</td></tr>
<tr><td><textarea class="t2" cols="100" rows="20" name="content"><%=content %></textarea></td></tr>
</table>
    <div class="t3">
        <input class="t4" type="submit" value="수정하기"/>
    </div>
</form>
</div>
</body>

<%		

	}
%>

</body>
</html>