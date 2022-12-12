<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="community.bbs.BbsDAO" %>
<%@ page import="community.bbs.Bbs" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>community</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="maindesign.css">
    <link rel="stylesheet" href="community.css">
</head>
<body>
<%	
//로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    String userID = null;
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<div class="goOtherMenu">
    <ul class="ul2">
        <li class="n"><button class="btn2" type="button" onclick="location.href='page2.page2.jsp'">복지관 정보</button></li>
        <li class="n"><button class="btn2" type="button" onclick="location.href='page2.notice_read.jsp'">공지사항</button></li>
        <li class="n"><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
        <li class="n"><button class="btn41" type="button" onclick="location.href='member.join.jsp'">회원가입</button></li>
        <li class="n"><button class="btn42" type="button" onclick="location.href='member.join.jsp'">로그인</button></li>
    </ul>
</div>
<div class="main">
    <header onclick="location.href='http://naver.com'">
        <img class="titleimage" src="title_image.png"/>
    </header>
</div>
<div class="goOtherMenu1">
    <div id="subborder">
        <h2><center><b>커뮤니티</b></center></h2></div><br>
</div>
<div class="a" id="list">
	<div class="container">
        <!-- 테이블이 들어갈 수 있는 공간 구현 -->
        <div class="row">
         	<!-- striped는 커뮤니티 글목록을 홀수와 짝수로 번갈아가며 색이 변하게 해주는 하나의 요소  -->
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <!-- thead는 테이블의 제목부분에 해당함 -->
                <thead>
                	<!-- 테이블의 하나의 행을 말함(한 줄)-->
                    <tr>
                    	<!-- 커뮤니티의 속성을 하나씩 명시 해준다. -->
                        <th style="background-color:#3E8996; text-align:center;">번호</th>
                        <th style="background-color:#3E8996; text-align:center;">제목</th>
                        <th style="background-color:#3E8996; text-align:center;">작성자</th>
                        <th style="background-color:#3E8996; text-align:center;">작성일</th>
                    </tr>
                </thead>
                <!-- tbody 같은 경우는 위에 지정해준 속성 아래에 하나씩 출력해주는 역할 -->
                <tbody>
                <%
                	//게시글을 담을 인스턴스
                    BbsDAO bbsDAO = new BbsDAO();
                	//list 생성 그 값은 현재의 페이지에서 가져온 리스트 게시글목록
                    ArrayList<Bbs> list = bbsDAO.getList();
                    //가져온 목록을 하나씩 출력하도록 선언한다..
                	for(int i = 0; i < list.size(); i++)
                    {
                %>
                <!-- 실제 데이터를 사용자에게 보여주는 부분 -->
                    <tr>
                    	<!-- 현재의 게시글에 대한 정보를 하나씩 데이터를 데이터베이스에서 불러와서 보여준다. -->
                        <td><%=list.get(i).getBbsID() %></td>
                        <!-- 제목을 눌렀을때는 해당 게시글의 내용을 보여주는 페이지로 이동해야하기때문에
                         view.jsp페이지로 해당 게시글번호를 매개변수로 보내서 처리한다. href="주소?변수명 = 값! 이런식으로 처리를 해준다.-->
                        <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
                        <td><%=list.get(i).getID() %></td>
                        <!--날짜 데이터를 가져오는것은 substring(index,index) 함수는 DB내부에서 필요한 정보만 잘라서 들고오게 해 주는 함수-->
                        <td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13) + "시" 
                        + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
    
	
</body>
</html>
