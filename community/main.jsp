<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 
<%@ page import="java.io.PrintWriter" %>
 
<!DOCTYPE html>
 
<html>
 
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
 
    <link rel="stylesheet" href="css/bootstrap.min.css">
 
    <title>Kanari 웹 사이트</title>
    <style>
        .jumbotron {
              padding: 30px 15px;
              margin-bottom: 30px;
              background-color: #eee;
        }
        div{
            display: flex;
            justify-content: center;
            alig-item: center;
        }
    </style>
</head>
<body>
 
<%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
%>
 
<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> 
    <ul class="navbar-nav navbar-white">
        <li class="nav-item active"><a class="nav-link" href="#">메인</a></li>
        <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
        <%
            if(userID == null){
        %>
        
        <li class="nav-item dropdown"> 
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> Sign in </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="login.jsp">로그인</a>
                <a class="dropdown-item" href="join.jsp">회원가입</a> 
            </div>
        </li>
        
        <%
            }    else{
                
        %>
           <li class="nav-item dropdown"> 
               <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> 회원관리 </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
            </div>
        </li>
        <%
            }
        %>
    </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
 
