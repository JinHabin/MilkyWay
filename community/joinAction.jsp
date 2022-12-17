<%@ page language="java" contentType="text/html; charset=UTF-8"
 
    pageEncoding="UTF-8"%>
 
<%@ page import="user.UserDAO" %>
 
<%@ page import="java.io.PrintWriter" %>
 
<% request.setCharacterEncoding("UTF-8"); %>    <!-- 받는 모든 문자열을 UTF-8로 인코딩한다. -->
 
<jsp:useBean id="user" class="user.User" scope="page" />    <!-- 현재 페이지에서만 자바빈을 사용가능하게 설정 -->
 
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />

 
 
 
<!DOCTYPE html>
 
<html>
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Kanari 웹 사이트</title>
 
</head>
 
<body>
 
    <%
	    String userID = null;
	    if(session.getAttribute("userID") != null){
	        userID = (String) session.getAttribute("userID");
	    }
	
	    if(userID != null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('이미 로그인이 되어있습니다.')");
	        script.println("location.href = 'main.jsp'");
	        script.println("</script>");
	    }

        
        if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 정보를 기입해주세요.')");
            script.println("history.back()");
            script.println("</script>");
        }
        
        else{
            
            UserDAO userDAO = new UserDAO();
 
            int result = userDAO.join(user);
 
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
 
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }
 
        }
        
    %>
</body>
</html>
