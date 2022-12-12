<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="basicdesign.css">
<style type="text/css">
        .main {
            text-align : center;
            margin : 0 auto;
        }
		header {
        	height : 150px;
        	border : 3px solid #3e8996;
        	margin : 10px;
        	border-radius : 30px;
        }
        .board {
            width:800px;
            margin-left : 100px;
            margin-right : 100px;
        }
        .t1 {
            width : 100%;
            border : 1px solid #909090;
            font-size : 17px;
            height : 30px;
        }
        .t2 {
            width : 100%;
            border : 1px solid #909090;
            font-size : 13px;
        }
        .t3 {
            width : 100%;
        }
        .t4 {
            float : right;
        }
        .t11 {
        width : 100%;
        border : 1px solid #909090;
        font-size : 13px;
        height : 30px;
        }
</style>
</head>
<body>
<div class="main">
    <header onclick="location.href='main.jsp'">
    <img class="titleimage" src="logo.png"/>
    </header>
</div>
<div class="board">
<form action="welfare-insert-db.jsp" method="post">
<table>
<tr><td>글 제 목</td></tr>
<tr><td><input class="t1" type="text" name="title"/></td></tr>
<tr>
<td>기관명</td></tr>
<tr>
<td>
<input class="t11" type="text" name="type"/>
</td>
</tr>
<tr><td>글 내 용</td></tr>
<tr><td><textarea class="t2" cols="100" rows="20" name="content"></textarea></td></tr>
</table>
    <div class="t3">
        <input class="t4" type="submit" value="등록하기"/>
    </div>
</form>
</div>
</body>
</html>
