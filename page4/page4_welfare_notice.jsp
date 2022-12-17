<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
    <%@ page import="dao.bean.ndao" %>
    <%@ page import="dao.bean.notDAO" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>복지관 소식</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="page4_welfare_notice.css">
    
    
    <script src="https://code.jquery.com/jQuery-3.6.0.js"></script>
    <script>
        $(document).ready(function() {
            $('#sel11').hover(function() {
                $('.selButton').addClass('displayOption');
            },function() {
                $('.selButton').removeClass('displayOption');
            });

            $('.selButton').hover(function() {
                $('.selButton').addClass('displayOption');
            },function() {
                $('.selButton').removeClass('displayOption');
            });
        });
    </script>
    
    
    
</head>
<body>
<%
String userId=null;
String userName=null;


userId=(String)session.getAttribute("userID");
userName=(String)session.getAttribute("userName");

if (userId==null) {%>
	<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page2.page2.jsp'">복지관 정보</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page3.page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='community.community.jsp'">커뮤니티</button></li>
	        <li><button class="btn41" type="button" onclick="location.href='member.join.jsp'">회원가입</button></li>
	        <li><button class="btn42" type="button" onclick="location.href='member.join.jsp'">로그인</button></li>
	    </ul>
	</div>
	<%
	
}
else {%>
<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page2.page2.jsp'">복지관 정보</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page3.page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclock="location.href='community.community.jsp'">커뮤니티</button></li>
	        <li><div class="showname"><%=userName %>님 반갑습니다.</div></li>
	    </ul>
	</div>
<%	
}
%>

<div class="main">
    <header onclick="location.href='main.main.jsp'">
    <img class="titleimage" src="logo.png"/>
    </header>
</div>
<div class="goOtherMenu1">
    <div id="subborder"><h2><center><b>복지관 소식</b></center></h2>
    </div>
</div>
<div id="makeLine"></div>
<div class="mainContent">
<div class="sub">
    <nav>
      <ul class="ul1">
          <li><button class="btn" type="button" onclick="location.href='notice_read.jsp'">행사정보</button></li>
              <li><button class="btn" type="button">복지관 소식</button></li>
      </ul>
  </nav>
  </div>
  <div class="mainSection">
  <section>
      <%
String sql;
int rownum=0,rn=0;
String pageNum,f="";
String locat,loc="",lnk;

int pageNumber;
if (request.getParameter("pageNumber")==null) {
	pageNumber=1;
} else {
	pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
}

%>			
			
<div class="tablediv">
      <table id = "notice" height="25">
          <thead>
          <tr height="30">
          <th class="number" style="background-color:#3E8996; text-align:center;">번호</th>
          <th class="title" style="background-color:#3E8996; text-align:center;">제목</th>
          <th class="author" style="background-color:#3E8996; text-align:center;">작성자</th>
          <th class="time" style="background-color:#3E8996; text-align:center;">작성시간</th>
          </tr>
          </thead>
<tbody>
<%
notDAO bbsDAO = new notDAO();
ArrayList<ndao> list = new ArrayList<ndao>();
list=bbsDAO.getList1(pageNumber);
//가져온 목록을 하나씩 출력하도록 선언한다..
	for(int i = 0; i < list.size(); i++)
{
%>
			
		<tr height="30">
		<td class="number" align="center"><%=list.get(i).getID() %></td>
		<td class="title" align="center"><a href="4-read-welfare.jsp?id=<%=list.get(i).getID()%>">[<%=list.get(i).getType()%>]<%=list.get(i).getTitle() %></a></td>
		<td class="author" align="center"><%=list.get(i).getName() %></td>		
		<td class="time" align="center"><%=list.get(i).getWtime() %></td>
		</tr>
		<%
	}
%>
</tbody>
      </table>
               <% if (pageNumber!=1) {
            	%>
            	<center>
            	<a href="notice_read.jsp?pageNumber=<%=pageNumber-1%>">이전</a>
            	</center>
            	<%
            }
            	if (bbsDAO.nextPage(pageNumber+1,"p")) {
            		%>
            	<center>
            	<a href="notice_read.jsp?pageNumber=<%=pageNumber+1 %>">다음</a>
            	</center>
            <% }%>
      
        
      </div>
        <% if (userId!="admin") {
    	  %>
    	  <button class="write" type="button" onclick="location.href='welfare_notice_write.jsp'">
          글작성</button>
          <%
      } else {
      }
    	  %>          
  </section>
</div>
</div>
          
  <footer id="footerSection">
              ● 노인 복지 포털<br>
        	  온라인 노인 복지관<br>
        	진하빈 | 전은규 | 김수민<br>
        	Copyright 2022. 은하수. All rights reserved.  
              </footer>
</body>
</html>