<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    PrintWriter script = response.getWriter();

    session.invalidate();
    script.println("<script>");
    script.println("location.href = '../main/main.jsp'");
    script.println("</script>");
%>
</body>
</html>