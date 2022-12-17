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
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin: 30px">
        <thead>
            <tr>
                <th colspan="3" style="background-color: #3e8996; text-align: center;">글 보기</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="width: 20%">제목</td>
                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td colspan="2"><%= bbs.getUserID() %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
        </tbody>
        </table>
        <a href="community.jsp" class="btn btn-outline-primary" style="margin:3px; background-color:#b1cfd5">목록</a>
        <%
            if(userID != null && userID.equals(bbs.getUserID())){
        %>
            <div class="col float-right">                
                 <div class="dropdown actionButtons float-right">
                     <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-secondary" style="margin:3px; background-color:#b1cfd5">수정</a>
 	                 <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-danger" style="margin: 5px">삭제</a>
                   </div>
            </div>
        <%
            }
        %>
        
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
