<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.sql.*" %>
 
 
<!DOCTYPE html>
 
<html>
 
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="community.css">
 
    <link rel="stylesheet" href="css/bootstrap.min.css">
 
    <title>community</title>
 
 
</head>
<body>
 
<%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
    
    int bbsID = 0;
    
    if(request.getParameter("bbsID") != null){    
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    
    if(bbsID == 0){    
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href = 'community.jsp'");
        script.println("</script>");
    }
    
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    
    if(!userID.equals(bbs.getUserID())){    //유저 아이디를 확인 다를경우 알림문 출력
        
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'community.jsp'");
        script.println("</script>");
        
    }
%>
 
<br>
<div class="goOtherMenu">
	<ul class="ul2">
	        <li class="n"><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
			<li class="n"><button class="btn41" type="button">회원가입</button></li>
	        <li class="n"><button class="btn42" type="button">로그인</button></li>
	    </ul>
	</div>
<div class="main">
    <header onclick="location.href='main.jsp'">
        <img class="titleimage" src="logo.png"/>
    </header>
</div>
<div class="goOtherMenu1">
    <div id="subborder">
        <h2><center><b>커뮤니티</b></center></h2></div><br>
</div>
 
<div class="container">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정하기</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
                </tr>
                <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2020" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>    
                </tr>
            </tbody>
        </table>
        <input type="submit" class="btn btn-outline-primary" value="수정">
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
