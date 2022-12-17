<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>메뉴</title>
</head>

<body>
    <%request.setCharacterEncoding("utf-8"); %>
    <div id="menuSection">
        <div class="menuBoxWrap">
            <div class="menuBox">
                <a href="../page2/page2.jsp"><i class="fa-solid fa-map-location-dot fa-4x"></i><br>
                    복지관·요양시설</a>
                <hr>
            </div>
            <div class="menuBox">
                <a href="../page3/page3-health.jsp"><i class="fa-solid fa-heart-pulse fa-4x"></i><br>
                    건강</a>
                <hr>
            </div>
            <div class="menuBox">
                <a href="../page3/page3.jsp"><i class="fa-solid fa-hand-holding-heart fa-4x"></i><br>
                    혜택</a>
                <hr>
            </div>
            <div class="menuBox" style="clear: both">
                <a href="../page4/notice_read.jsp"><i class="fa-solid fa-check-to-slot fa-4x"></i><br>
                    공지사항</a>
                <hr>
            </div>
            <div class="menuBox">
                <a href="../community/community.jsp"><i class="fa-solid fa-people-roof fa-4x"></i><br>
                    커뮤니티</a>
                <hr>
            </div>
        </div>

        <%
          String userID = (String)session.getAttribute("userID");
          String userName = (String)session.getAttribute("userName");
         %>

        <div class="login">
            <%if(userID == null){%>
            <form method="post" action="../member/loginAction.jsp">
                <h3 style="text-align:center; color:#3E8996; font-size: 20px">로그인</h3>
                <br>
                아이디<br>
                <input type="text" name="userID"><br>
                <br>
                비밀번호<br>
                <input type="password" name="userPassword"><br>
                <br>
                <div style="text-align:center">
                    <input type="submit" value="로그인"> | <a href="../member/join.jsp">회원가입</a>
                </div>
            </form>

            <%}else{ %>
            <form method="post" action="../member/logoutAction.jsp">
                <div style="text-align:center">
                    <br><br><br>
                    <%=userName %>님 환영합니다!
                    <br><br>
                    <input type="submit" value="로그아웃"> | <a href="마이페이지 링크">마이페이지</a>
                </div>
            </form>
            <%} %>
        </div>

        <div class="post">
        <%
            BoardDAO board = new BoardDAO();
        %>
            <h3>새 게시물</h3><br>
            <hr style="width: 50px; height: 3px; background:white; border:0"><br>
            <ul>
            <% 
            int i = 0;
            while (board.getNewPost(i) != null && i < 3) {%>
                <li>● <a href="4-read.jsp?id=<%=board.getNewPost(i).getInt("id")%>"><%=board.getNewPost(i).getString("title") %></a></li><br>
                <% 
                i++; } %>
            </ul>


        </div>
    </div>
</body>

</html>
