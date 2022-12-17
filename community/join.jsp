<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
 
<html>
 
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
 
    <link rel="stylesheet" href="css/bootstrap.min.css">
 
    <title>Kanari 웹 사이트</title>
 
</head>
<body>
 
<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> 
    <ul class="navbar-nav navbar-white">
        <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
        <li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
        <li class="nav-item dropdown"> 
         <a class="nav-link dropdown-toggle active" href="#" data-toggle="dropdown"> Sign in </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="login.jsp">로그인</a>
                <a class="dropdown-item active" href="join.jsp">회원가입</a> 
            </div>
        </li>
    </ul>
</nav>
 
 
<div class="container-fluid">
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="joinAction.jsp">
 
                <h3 style="text-align: center;"> 회원가입 화면 </h3>
 
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength=100px>
                </div>
 
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength=100px>
                </div>
                
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="이름" name="userName" maxlength=100px>
                </div>
                <input type="submit" class="btn btn-primary form-control" value="회원가입">
            </form>
        </div>
       </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
