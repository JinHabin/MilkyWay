<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>my info</title>
    <link rel="stylesheet" type="text/css" href="../stylesheet.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<%
	String session_id = (String)session.getAttribute("userID"); 

	Connection myConn = null;     
	Statement stmt = null;	
	ResultSet myResultSet = null; 
	String mySQL = "";

	String dburl  = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
	String user="root"; 
	String passwd="0000";

	try {
	    myConn =  DriverManager.getConnection (dburl, user, passwd);
	    stmt = myConn.createStatement();	
    } catch(SQLException ex) {
	    System.err.println("SQLException: " + ex.getMessage());
	}
    mySQL = "select userID, userName, userPassword from student where userID='" + session_id + "'" ;
	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
		String userID = myResultSet.getString("userID");
		String userPassword = myResultSet.getString("userPassword");			
		String userName = myResultSet.getString("userName");			
%>
<div class="sub">
  <nav>
      <ul class="ul1">
          <li class="n"><button id="bb1" class="btn a1" type="button">정보 수정</button></li>
          <li class="n"><button id="bb2" class="btn" type="button" onclick="location.href='mywriting.jsp'">내가 쓴 글</button></li>
      </ul>
  </nav>
</div>
    <div id="update">
        <div class="updateBox">
            <h1 style="text-align: center; color: #3E8996;">정보 수정</h1>
            <br>
            <br>
            <br>

			<form method="post" action="update_verify.jsp">
			  <input type="hidden" name="userID" size="30" value="<%= session_id %>">
			  <table width="75%" align="center" border>
			     <tr><th>이름</th>
			         <td><input type="text" name="userName" size="20" value="<%= userName %>"> </td>
			     </tr>
			     <tr><th>아이디</th>
			         <td><input type="text" name="userID" size="20"  value="<%= userID %>"></td>
			     </tr>
			     <tr><th>비밀번호</th>
			         <td><input type="password" name="userPassword" size="20"  value="<%= userPassword %>"></td>
			     </tr>
			   
				<%
					}	
					stmt.close();  
					myConn.close();
				%>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="수정">
					</td> 
				</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>