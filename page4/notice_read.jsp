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
         	<%
         	String t;
         	String str=request.getParameter("type");
         	if (str==null) {
         		str="말머리 선택";
         		t="a";
         	}
         	else if (str.equals("e")) {
         		str="행사";
         		t="e";
         	}
         	else if (str.equals("h")) {
         		str="건강";
         		t="h";
         	}
         	else if (str.equals("w")) {
         		str="복지";
         		t="w";
         	}
         	else {
         		str="전체";
         		t="a";
         		
         	}
         	
         	%>
            <li><div><button id="sel11" class="selOther" type="button"><%=str %></button></div></li>
            <li><div><button id="btna" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=a'" >전체</button></div></li>
    		<li><div><button id="btne" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=e'" >행사</button></div></li>
            <li><div><button id="btnw" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=w'">복지</button></div></li>
            <li><div><button id="btnh" class="selButton" type="button" onclick="location.href='notice_read.jsp?type=h'">의료</button></div></li>
			</ul>
			</div>
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
          <th class="type1" style="background-color:#3E8996; text-align:center;">말머리</th>
          <th class="title" style="background-color:#3E8996; text-align:center;">제목</th>
          <th class="author" style="background-color:#3E8996; text-align:center;">작성자</th>
          <th class="time" style="background-color:#3E8996; text-align:center;">작성시간</th>
          </tr>
          </thead>
<tbody>
                <%
               
                
                	//게시글을 담을 인스턴스
                	
                notDAO bbsDAO = new notDAO();
                	//list 생성 그 값은 현재의 페이지에서 가져온 리스트 게시글목록
                ArrayList<ndao> list1 = new ArrayList<ndao>();
                list1=bbsDAO.getList(pageNumber,t);
                
                    //가져온 목록을 하나씩 출력하도록 선언한다..
             	for(int i = 0; i < list1.size(); i++)
                {
                %>
                <!-- 실제 데이터를 사용자에게 보여주는 부분 -->
                <tr height="30">
		<td class="number" align="center"><%=list1.get(i).getID() %></td>
		<td class="type1" align="center"><%=list1.get(i).getType() %></td>
		<td class="title" align="center"><a href="4-read.jsp?id=<%=list1.get(i).getID()%>">[<%=list1.get(i).getType()%>]<%=list1.get(i).getTitle() %></a></td>
		<td class="author" align="center"><%=list1.get(i).getName() %></td>		
		<td class="time" align="center"><%=list1.get(i).getWtime() %></td>
		</tr>
                
                <%
                    }
                %>
                </tbody>
            </table>
            
         <% if (pageNumber!=1) {
            	%>
            	<center>
            	<a href="notice_read.jsp?pageNumber=<%=pageNumber-1%>&type=<%=t%>">이전</a>
            	</center>
            	<%
            }
            	if (bbsDAO.nextPage(pageNumber+1,t)) {
            		%>
            	<center>
            	<a href="notice_read.jsp?pageNumber=<%=pageNumber+1 %>&type=<%=t%>">다음</a>
            	</center>
            <% }%>

      
      </div>
        <% if (userId=="admin") {
    	  %>
    	  <button class="write" type="button" onclick="location.href='notice_write.jsp'">
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


		}