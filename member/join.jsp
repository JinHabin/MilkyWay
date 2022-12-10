<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>JOIN</title>
    <link rel="stylesheet" type="text/css" href="../stylesheet.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div id="join">
        <div class="joinBox">
            <h1 style="text-align: center; color: #3E8996;">회원가입</h1>
            <br>
            <br>
            <br>
            <form method="post" action="./joinAction.jsp">
                이름<br> <input type="text" name="userName" maxlength="20"><br> <br>
                <br> 아이디<br> <input type="text" name="userID" maxlength="20"> <br> <br>
                <br> 비밀번호<br> <input type="password" name="userPassword" maxlength="20"><br> <br>
                <br> 비밀번호 확인<br> <input type="password" name="checkPassword" maxlength="20"><br> <br>
                <br>
                <div style="text-align: center">
                    <input type="submit" value="가입하기"><br>
                </div>
            </form>
        </div>
    </div>
</body>

</html>