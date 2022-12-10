<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>page4</title>
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
<div class="goOtherMenu">
<ul class="ul2">
        <li><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
        <li><button class="btn2" type="button">커뮤니티</button></li>
        <li><button class="btn41" type="button">회원가입</button></li>
        <li><button class="btn42" type="button">로그인</button></li>
    </ul>
</div>
<div class="main">
    <header onclick="location.href='http://naver.com'">
    <img class="titleimage" src="title_image.png"/>
    </header>
</div>
<div class="goOtherMenu1">
    <div id="subborder"><h2><center><b>복지관 정보</b></center></h2>
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
      
<div class="tablediv">
      <table id = "notice" height="25">
          <thead>
          <tr height="30">
          <th class="number">번호</th>
          <th class="title">제목</th>
          <th class="author">작성자</th>
          <th class="time">작성시간</th>
          </tr>
          </thead>
<tbody>
<%
int id, ref,pageNumber,pn;
int rownum=0;
Connection conn=null;
Statement stmt=null;
String sql=null;
String pageNum;
ResultSet rs=null;

pageNum=request.getParameter("pageNum");
if (pageNum==null) {
	pageNum="1";
	pageNumber=Integer.parseInt(pageNum);
}
else {
	pageNumber=Integer.parseInt(pageNum);
	
}

int startNum=0;
startNum=5*(pageNumber-1);


try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl,"root","00000001");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql="select * from welfarenotice order by id desc limit "+startNum+",5"; // order by ref desc, id asc
	rs=stmt.executeQuery(sql);
} catch(Exception e) {
	out.println("DB연동 오류입니다." + e.getMessage());
}
rs.last();
rownum=rs.getRow();
rs.beforeFirst();

pageNumber=rownum;
pn=pageNumber/5;

while (rs.next()) {
	id=Integer.parseInt(rs.getString("id"));
	
	%>
	
	<tr height="30">
	<td class="number" align="center"><%=id %></td>
	<td class="title" align="center"><a href="4-read-welfare.jsp?id=<%=id%>">[<%=rs.getString("type")%>]<%=rs.getString("title") %></a></td>
	<td class="author" align="center"><%=rs.getString("name") %></td>
	<td class="time" align="center"><%=rs.getString("wtime") %></td>
	</tr>
	<%
	rownum--;
}
	
	%>
</tbody>
      </table>
      </div>
           <div class="paging">
          <ul class="ul2">
          <%
          for (int i=1; i<=pn+1; i++) {
        	  %>
        	  <li class="p1"><button class="btn22" type="button" onclick="location.href='page4_welfare_notice.jsp?pageNum=<%=i%>'"><%=i %></button></li>
        	  <%
          }
          %>
          <li><button class="write" type="button" onclick="location.href='welfare_notice_write.jsp'">
              글작성</button></li>

          </ul>
          </div>
  </section>

          </div>
          </div>
  
  


</body>
</html>