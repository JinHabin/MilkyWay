<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
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
 
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
 
     int pageNumber = 1; //기본 페이지 1로 설정
         
     if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin:30px">
                <thead>
                    <tr>
                        <th style="background-color: #3e8996; text-align: center;">번호</th>
                        <th style="background-color: #3e8996; text-align: center;">제목</th>
                        <th style="background-color: #3e8996; text-align: center;">작성자</th>
                        <th style="background-color: #3e8996; text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BbsDAO bbsDAO = new BbsDAO();
                        ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    
                    <%
                        }
                    %>
                </tbody>
            </table>
                
            <%
                if (pageNumber != 1) {    //현재 페이지가 1이 아니라면
            %>
                <a href="community.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left" style="margin:3px; background-color:#b1cfd5">이전</a>
            <%
                }    if (bbsDAO.nextPage(pageNumber)) {    //다음 페이지가 존재할 경우
 
            %>
                <a href="community.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left" style="margin:3px; background-color:#b1cfd5">다음</a>
            <%
                }
            %>
            
            <div class="col float-right">                
                 <div class="dropdown actionButtons float-right">
                     <a href="write.jsp" class="btn btn-primary pull-right" style="margin:3px; background-color:#b1cfd5">글쓰기</a>
                   </div>
            </div>
        </div>
    </div>
 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
 
</body>
</html>
