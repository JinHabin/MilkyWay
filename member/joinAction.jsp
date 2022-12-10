<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
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
    String userName = request.getParameter("userName");
    String checkPassword = request.getParameter("checkPassword");
    
	PrintWriter script = response.getWriter();
    
    // 빈칸이 있는 경우
    if(userID == "" || userPassword == "" || userName == "" || checkPassword == ""){
    	script.println("<script>");
    	script.println("alert('모든 항목을 입력해 주세요')");
    	script.println("history.back()");
    	script.println("</script>");
    }
    else if(userPassword.equals(checkPassword) == false){
    	script.println("<script>");
    	script.println("alert('비밀번호가 다릅니다')");
    	script.println("history.back()");
    	script.println("</script>");
    }
    else {
    	UserDAO user = new UserDAO();
    	user.setInfo(userID, userPassword, userName);
    	
    	int result = user.join();
    	
    	if(result == -1){
        	script.println("<script>");
        	script.println("alert('서버 오류입니다')");
        	script.println("history.back()");
        	script.println("</script>");
    	}
    	else if(result == 0){
        	script.println("<script>");
        	script.println("alert('이미 존재하는 아이디입니다')");
        	script.println("history.back()");
        	script.println("</script>");
    	}
    	else {
        	script.println("<script>");
        	script.println("alert('회원가입이 완료되었습니다')");
        	script.println("location.href = '../main/main.jsp'");
        	script.println("</script>");
    	}
    }
%>
</body>

</html>