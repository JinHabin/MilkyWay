<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>page2</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="page2.css">
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

        $(document).ready(function() {
            $('#sel12').hover(function() {
                $('.selButton1').addClass('displayOption');
            },function() {
                $('.selButton1').removeClass('displayOption');
            });

            $('.selButton1').hover(function() {
                $('.selButton1').addClass('displayOption');
            },function() {
                $('.selButton1').removeClass('displayOption');
            });
        });
    </script>
    
</head>
<body>
<div class="goOtherMenu">
<ul class="ul2">
        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
        <li><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
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
<div id="makeLine">
</div>
<div class="mainContent">
<div class="sub">
    <nav>
      <!-- <div id="makeOption">
      <div class="op">
            <ul class="ul2">
                      <li><button id="sel11" class="selOther" type="button">유형선택</button></li>
                      <li><button class="selButton" type="button" onclick="location.href='http://naver.com'" >복지관</button></li>
                      <li><button class="selButton" type="button">요양시설</button></li>
                  </ul>
                  </div>
                  <div class="op">
            <ul class="ul2">
                      <li><button id="sel12" class="selOther" type="button">지역선택</button></li>
                      <li><button class="selButton1" type="button" onclick="location.href='http://naver.com'" >복지관</button></li>
                      <li><button class="selButton1" type="button">요양시설</button></li>
            </ul>
            </div>
            </div> -->
        
  </nav>
  </div>

  <section>
      <div id = "selectLocation">
          
          <ul class="ul2">
          <li>유형 선택</li>
          <li><select class="option1">
              <option class="o1">복지관</option>
              <option class="o1">요양시설</option>
          </select></li>
          <li>지역 선택</li>
              <li><select class="option1">
              <option>노원구</option>
              <option>강북구</option>
              <option>관악구</option>
              <option>성북구</option>
              <option>중구</option>
              </select></li></ul>
              <li>
              <button class="btn5" type="button">검색</button>
              </li>
      </div>
<div class="tablediv">
      <table id = "notice" height="25">
          <thead>
          <tr height="30"><th class="type">종류</th>
              <th class="name">기관명</th>
              <th class="addr">주소</th>
          <th class="lnk">링크</th></tr>
          </thead>
<tbody>
<%
int id, ref;
String lnk;
String pageNum;
int pn=1;
int pageNumber;
int rownum=0;
Connection conn=null;
Statement stmt=null;
String sql=null;
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
	sql="select * from welfaredata order by id desc limit "+startNum+",5";
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
	lnk=rs.getString("link");
	%>
	
	<tr height="30">
	<td class="type" align="center"><%=rs.getString("type")%></td>
	
	<td class="name" align="center"><%=rs.getString("name") %></td>
	<td class="addr" align="center"><%=rs.getString("addr") %></td>
	<td class="lnk">
	<a href="<%=lnk %>">바로가기</a></td>
	
	</tr>
	<%
	rownum--;
}
	
	%>
</tbody>
      </table></div>
  
              <div class="paging">
          <ul class="ul2">
          <%
          for (int i=1; i<=pn+1; i++) {
        	  %>
        	  <li class="p1"><button class="btn22" type="button" onclick="location.href='page2.jsp?pageNum=<%=i%>'"><%=i %></button></li>
        	  <%
          }
          %>
          <li><button class="write" type="button" onclick="location.href='page2-1.jsp'">
              기관등록</button></li>

          </ul>
          </div>
          </section>
              </div>
      
  
  
  </body>
</html>

