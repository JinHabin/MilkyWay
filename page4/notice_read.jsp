<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="page4.css">
    
    
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
String usrId=null;
String usrName=null;


usrId=(String)session.getAttribute("userID");
usrName=(String)session.getAttribute("userName");

if (usrId==null) {%>
	<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
	        <li><button class="btn41" type="button">회원가입</button></li>
	        <li><button class="btn42" type="button">로그인</button></li>
	    </ul>
	</div>
	<%
	
}
else {%>
<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclock="location.href='community.jsp'">커뮤니티</button></li>
	        <li><div class="showname"><%=usrName %>님 반갑습니다.</div></li>
	    </ul>
	</div>
<%	
}
%>
<div class="main">
    <header onclick="location.href='http://naver.com'">
    <img class="titleimage" src="title_image.png"/>
    </header>
</div>

<div class="goOtherMenu1">
    <div id="subborder"><h2><center><b>공지사항</b></center></h2>
    </div>
    
</div>
<div id="makeLine">
</div>
<div class="mainContent">
<div class="sub">
    <nav>
      <ul class="ul1">
          <li><button class="btn" type="button">공지사항</button></li>
              <li><button class="btn" type="button" onclick="location.href='page4_welfare_notice.jsp'">복지관 소식</button></li>
      </ul>
  </nav>
  </div>
  <div class="mainSection">
  <section>
      
          <div class="op">
         	<ul class="ul2">
         	<%String str=request.getParameter("type");
         	if (str==null) {
         		str="말머리 선택";
         	}
         	else if (str.equals("e")) {
         		str="행사";
         	}
         	else if (str.equals("h")) {
         		str="건강";
         	}
         	else if (str.equals("w")) {
         		str="복지";
         	}
         	else {
         		str="전체";
         		
         	}
         	
         	%>
            <li><div><button id="sel11" class="selOther" type="button"><%=str %></button></div></li>
            <li><div><button id="btna" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=a'" >전체</button></div></li>
    		<li><div><button id="btne" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=e'" >행사</button></div></li>
            <li><div><button id="btnw" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=w'">복지</button></div></li>
            <li><div><button id="btnh" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=h'">의료</button></div></li>
			</ul>
			</div>
             
      
<div class="tablediv">
      <table id = "notice" height="25">
          <thead>
          <tr height="30">
          <th class="number">번호</th>
          <th class="type1">말머리</th>
          <th class="title">제목</th>
          <th class="author">작성자</th>
          <th class="time">작성시간</th>
          </tr>
          </thead>
<tbody>
<%
String t="";
int id, ref,pageNumber,pn,np,flag;
int rownum=0,rn=0;
Connection conn=null;
Statement stmt=null;
String sql=null;
String pageNum,f="";

ResultSet rs=null;

t=request.getParameter("type");
if (t==null) {
	t="a";
}






try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	if (t.equals("e")) {
		sql="select * from noticedata where type='행사' order by id desc";
	}
	else if (t.equals("h")) {
		sql="select * from noticedata where type='의료' order by id desc";
	}
	else if (t.equals("w")) {
		sql="select * from noticedata where type='복지' order by id desc";
	}
	else if (t.equals("a")){
		sql="select * from noticedata order by id desc";
	}
	else {
		sql="select * from noticedata order by id desc";	
	}
	rs=stmt.executeQuery(sql);
} catch(Exception e) {
	out.println("DB연동 오류입니다." + e.getMessage());
}
rs.last();
rownum=rs.getRow();
rs.beforeFirst();

pageNum=request.getParameter("page");
np =rownum/5+1;


if (pageNum==null) {
	pn=1;
}
else {
	pn=Integer.parseInt(pageNum);
}

while(rs.next()) {
	rs.previous();
for (int i=0; i<(pn-1)*5; i++) {
	if (rs.next()) {
	}
	else break;
}

for (int i=0; i<5; i++) {
	
	if (rs.next()) {
		id=Integer.parseInt(rs.getString("id"));
		%>
			
		<tr height="30">
		<td class="number" align="center"><%=rownum-5*(pn-1)-i %></td>
		<td class="type1" align="center"><%=rs.getString("type") %></td>
		<td class="title" align="center"><a href="4-read-welfare.jsp?id=<%=id%>">[<%=rs.getString("type")%>]<%=rs.getString("title") %></a></td>
		<td class="author" align="center"><%=rs.getString("name") %></td>		
		<td class="time" align="center"><%=rs.getString("wtime") %></td>
		</tr>
		<%
	}
	
}
break;
}
%>
</tbody>
      </table>
      </div>
      
      <div>
      <table class="paging">
      <tr>
      <%
      f=request.getParameter("flag");
      
      if (f==null||f.equals("0")) {
    	  flag=0;
      }
      else {
    	  flag=Integer.parseInt("f");
      }
      
      for (int i=(flag*10+1); i<=np; i++) {
    	  %>
    	  <td><a href="?page=<%=i %>&flag=<%=flag %>&type=<%=t %>"><%=i %></a></td>
    	  <%
    	  if (np%10==0) {
    		  flag=flag+1;
    		  np=np+1;
    		  %>
    		  <td><a href="?page=<%=np %>&<%=flag %>">다음</a></td>
    		  <%
    	  }
      }
      %>
      </tr>
      </table>
            <% if (usrId==null) {
    	  %>
    	  <button class="write" type="button" onclick="location.href='notice_write.jsp'">
          글작성</button>
          <%
      } else {
      }
    	  %>
      
      </div>          
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
