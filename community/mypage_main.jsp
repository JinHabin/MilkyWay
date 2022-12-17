<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>mypage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="mypage_main.css">
</head>
<body>
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
        <h2><center><b>마이 페이지</b></center></h2></div><br>
</div>

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
            <br>
            <br>
            <br>

			<form method="post" action="update_verify.jsp">
			  <table width="75%" align="center" border>
				<tr><th>이름</th>
			         <td><input type="text" name="userName" size="20"> </td>
			     </tr>
			     <tr><th>아이디</th>
			         <td><input type="text" name="userID" size="20"></td>
			     </tr>
			     <tr><th>비밀번호</th>
			         <td><input type="password" name="userPassword" size="20"></td>
			     </tr>			   			   
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