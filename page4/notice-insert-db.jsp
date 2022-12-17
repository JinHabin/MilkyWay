<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <%@ page import="java.time.LocalDate" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="dao.bean.ndao" %>
    <%@ page import="dao.bean.notDAO" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head><title>게시판</title></head>
<body>
<%
int temp=0, cnt;
int new_id=0;
String name, title, content,type,t,cnt1,wtime;

String sql_update;

name=request.getParameter("name");
title=request.getParameter("title");
type=request.getParameter("type");
content=request.getParameter("content");
content=content.replace("\n","<br>");

LocalDate now = LocalDate.now();

wtime=now.toString();

notDAO bbsDAO = new notDAO();
int res=bbsDAO.write(title,content,type,wtime);
if (res==-1) {
	%>
	<center>
	<h2>글쓰기에 실패했습니다</h2>
	<a href="notice_read.jsp">게시글 목록 보기</a>
	</center>
	<%
}
	else {
		%>
		<center>
		<h2>글쓰기 성공</h2>
		<a href="notice_read.jsp">게시글 목록 보기</a>
		</center>
		<%
	}
%>

</body>
</html>
