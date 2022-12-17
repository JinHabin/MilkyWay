<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="dao.bean.dao" %>
    <%@ page import="dao.bean.welDAO" %>
    <%@ page import="java.util.ArrayList" %>
   
<!DOCTYPE html>
<html>
<head><title>게시판</title></head>
<body>
<%


String name, addr, num, wgu,link,t,type,cnt1;

String sql_update;


name=request.getParameter("wName");
addr=request.getParameter("wAddr");
num=request.getParameter("wNumber");
wgu=request.getParameter("wGu");
link=request.getParameter("wlink");
t=request.getParameter("type");

if (t.equals("w")) {
	type="복지관";
	welDAO bbsDAO = new welDAO();
	int res=bbsDAO.write(name,addr,num,wgu,link,type);
	if (res==-1) {
		%>
		<h2>글쓰기에 실패했습니다</h2>
		<a href="page2.jsp">게시글 목록 보기</a>
		<%
	}
		else {
			%>
			글쓰기 성공<br>
			<a href="page2.jsp">게시글 목록 보기</a>
			
			<%
		}
}
else if (t.equals("y")) {
	type="요양시설";
	welDAO bbsDAO = new welDAO();
	int res=bbsDAO.write(name,addr,num,wgu,link,type);
	if (res==-1) {
		%>
		<h2>글쓰기에 실패했습니다</h2>
		<a href="page2_welfare.jsp">게시글 목록 보기</a>
		<%
	}
		else {
			%>
			글쓰기 성공<br>
			<a href="page2_welfare.jsp">게시글 목록 보기</a>
			<%
		}
}
else {
	type="";
}
%>

<center>
<h2>작성한 글이 등록 되었습니다.</h2>

<a href="page2.jsp">게시글 목록 보기</a>
</center>
</body>
</html>