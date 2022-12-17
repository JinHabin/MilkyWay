<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>Insert title here</title></head>
<body>
<%
	String userID = request.getParameter("userID");
	String userPassword = new String(request.getParameter("userPassword"));	
	String userName = new String(request.getParameter("userName")); //변경

	Connection myConn = null;  
	Statement stmt = null;  
	String mySQL = "";

	String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "0000";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		myConn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = myConn.createStatement();	
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
    mySQL = "update student ";
	mySQL = mySQL + " set userID ='" + userID + "' , " ;	
	mySQL = mySQL + " userPassword ='" + userPassword + "' where userID='" + userID + "' "; 
	mySQL = mySQL + " userName ='" + userName + "' where userID='" + userID + "' "; 
	try {		
		stmt.executeQuery(mySQL);  
%>

<script>
	alert("정보가 수정되었습니다.");       
	location.href="mypage_main.jsp";
</script>
<%    
	} catch(SQLException ex) {
		String sMessage;
		if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
		else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
		else sMessage="잠시 후 다시 시도하십시오";	
%>
<script>
	alert("<%= sMessage %>");    
	location.href = "mypage_main.jsp";
</script>
<%	
	} finally {
		if (stmt != null)   try { 	stmt.close();  myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>
