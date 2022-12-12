<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>MAIN</title>
    <link rel="stylesheet" type="text/css" href="../stylesheet.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            var len = $('.slide ul').children().length;
            var count = 1;

            function move() {
                if (count < len) {
                    $('.slide ul').animate({
                        left: '-=1000px'
                    });
                    count += 1;
                } else {
                    $('.slide ul').animate({
                        left: 0
                    });
                    count = 1;
                }
            }

            setInterval(move, 3000);

            $('.menuBox').mouseover(function() {
                $('hr', this).css("visibility", "visible");
            });
            $('.menuBox').mouseout(function() {
                $('.menuBox hr').css("visibility", "hidden");
            });
        });
    </script>
</head>

<body>
    <%request.setCharacterEncoding("utf-8"); %>

    <!-- 헤더 -->
    <div id="headerSection">
        <a href="main.jsp"><img class="logo" src="../image/logo.png" /></a><br><br>
    </div>

    <!-- 슬라이드 -->
    <%@include file="slide.jsp" %>

    <!-- 메뉴 / 로그인 / 새 글 -->
    <%@include file="content.jsp" %>

    <!-- 하단 -->
    <footer id="footerSection">
        ● 노인 복지 포털<br>
        온라인 노인 복지관<br>
        진하빈 | 전은규 | 김수민<br>
        Copyright 2022. 은하수. All rights reserved.
    </footer>

</body>

</html>