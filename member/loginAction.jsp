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
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    UserDAO user = new UserDAO();
    int result = user.login(userID, userPassword);
    
    PrintWriter script = response.getWriter();
    
    // 로그인 성공
    if(result == 1) {
    	session.setAttribute("userID", userID);
    	session.setAttribute("userName", user.getName());
    	script.println("<script>");
    	script.println("location.href = '../main/main.jsp'");
    	script.println("</script>");
    }
    else if(result == 0){
    	script.println("<script>");
    	script.println("alert('아이디 또는 비밀번호를 확인해 주세요')");
    	script.println("history.back()");
    	script.println("</script>");
    }
    else if(result == -1){
    	script.println("<script>");
    	script.println("alert('서버 오류입니다')");
    	script.println("location.href = '../main/main.jsp'");
    	script.println("</script>");
    } 
%>
</body>
</html>