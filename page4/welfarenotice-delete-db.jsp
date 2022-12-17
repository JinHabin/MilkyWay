<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dao.bean.ndao" %>
    <%@ page import="dao.bean.notDAO" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<body>
<% 
int id=0;
if (request.getParameter("id")!=null) {
	id=Integer.parseInt(request.getParameter("id"));
}

notDAO bbsDAO=new notDAO();
int res=bbsDAO.delete(id,"b");

if (res==-1) {
	%>
	<center>
	<h2>삭제에 실패했습니다</h2>
	<a href="page4_welfare_notice.jsp">게시글 목록 보기</a>
	</center>
	<%
}
	else {
		%>
		<center>
		<h2>삭제 성공</h2>
		<a href="page4_welfare_notice.jsp">게시글 목록 보기</a>
		</center>
		
		<%
	}
%>

</body>
</html>