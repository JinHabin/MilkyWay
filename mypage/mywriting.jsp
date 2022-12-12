<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="community.bbs.BbsDAO" %>
<%@ page import="community.bbs.Bbs" %>

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
	String userID = null; 
	if (session.getAttribute("userID") != null) { 
  		userID = (String)session.getAttribute("userID"); 
	} 
	int bbsID = 0; 
	if (request.getParameter("bbsID") != null) { 
  		bbsID = Integer.parseInt(request.getParameter("bbsID")); 
	} 
	if (bbsID == 0) { 
  		PrintWriter script = response.getWriter(); 
  		script.println("<script>"); 
  		script.println("alert('유효하지 않은 글입니다.')"); 
  		script.println("location.href = 'main.jsp'"); 
  		script.println("</script>"); 
	} 
	Bbs bbs = new BbsDAO().findBbsByUserId(bbsID, userID); 
%> 
<div class="sub">
  <nav>
      <ul class="ul1">
          <li class="n"><button id="bb1" class="btn a1" type="button" onclick="location.href='myinfo.jsp'">정보 수정</button></li>
          <li class="n"><button id="bb2" class="btn" type="button">내가 쓴 글</button></li>
      </ul>
  </nav>
</div>
	<form method="post" action="logoutAction.jsp"> 
	<input type="submit" class="btn btn-primary form-control" 
		value="LOGOUT"> 
	</form> 
	<div class="container"> 
		<div class="row"> 
			<table class="table table-striped" 
				style="text-align: center; border: 1px solid #dddddd;"> 
				<thead> 
				<tr> 
				<th colspan="3" style="background text-align: center;">목록</th> 
				</tr> 
				</thead> 
			<tbody> 
			<tr> 
				<td style="width: 20%;">글 제목</td> 
				<td colspan="2"><%= bbs.getBbsTitle() %></td> 
				</tr> 
				<tr> 
				<td>작성일</td> 
				<td colspan="2"><%=bbs.getBbsDate()%></td> 
				</tr> 
				<tr> 
				<td>내용</td> 
				<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent()%></td> 
			</tr> 
			</tbody> 
		</table> 


</body>
</html>