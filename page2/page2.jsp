<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
    <%@ page import="dao.bean.dao" %>
    <%@ page import="dao.bean.welDAO" %>
    <%@ page import="java.util.ArrayList" %>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>복지관 정보</title>
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
        
        $(function(){
        	$(".option2").val("${param.loc}").attr("selected","selected");
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
	        <li><button class="btn2" type="button" onclick="location.href='page3.page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page4.notice_read.jsp'">공지사항</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='community.community.jsp'">커뮤니티</button></li>
	        <li><button class="btn41" type="button">회원가입</button></li>
	        <li><button class="btn42" type="button">로그인</button></li>
	    </ul>
	</div>
	<%
	
}
else {%>
<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page3.page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='page4.notice_read.jsp'">공지사항</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='community.community.jsp'">커뮤니티</button></li>
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
    <div id="subborder"><h2><center><b>복지관 정보</b></center></h2>
    </div>
</div>
<div id="makeLine">
</div>
<div class="mainContent">
<div class="sub">
    <nav>
      <ul class="ul1">
          <li><button class="btn" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
              <li><button class="btn" type="button" onclick="location.href='page2_welfare.jsp'">요양시설 검색</button></li>
      </ul>
  </nav>
  </div>

  <section>
      <div id = "selectLocation">
          <div class="a">
          <form action="page2.jsp" method="get">
            <ul class="ul2">
                <li>지역 선택</li>
                <li><select class="option2" name="loc">
                <option class="o3" value="a">전체</option>
                    <option class="o3" value="j">중구</option>
                    <option class="o3" value="nw">노원구</option>
                    <option class="o3" value="gn">강남구</option>
                    <option class="o3" value="gb">강북구</option>
                    <option class="o3" value="sc">서초구</option>
                    <option class="o3" value="yc">양천구</option>
                    <option class="o3" value="mp">마포구</option>
                    <option class="o3" value="gs">강서구</option>
                    <option class="o3" value="ep">은평구</option>
                    <option class="o3" value="jr">종로구</option>
                    <option class="o3" value="ys">용산구</option>
                    <option class="o3" value="sd">성동구</option>
                    <option class="o3" value="gj">광진구</option>
                    <option class="o3" value="jr">중랑구</option>
                    <option class="o3" value="sb">성북구</option>
                    <option class="o3" value="db">도봉구</option>
                    <option class="o3" value="sd">서대문구</option>
                    <option class="o3" value="ks">강서구</option>
                    <option class="o3" value="kr">구로구</option>
                    <option class="o3" value="gc">금천구</option>
                    <option class="o3" value="ydp">영등포구</option>
                    <option class="o3" value="kd">강동구</option>
                    <option class="o3" value="sp">송파구</option>
                    <option class="o3" value="ka">관악구</option>
                    <option class="o3" value="ddm">동대문구</option>
                </select>
                </li>
                <li><button type="submit">검색</button></li>
            </ul>
            
                </form>
                </div>
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

locat = request.getParameter("loc");
if (locat==null) {
	locat="a";
}

%>

<div class="tablediv">
<table id="notice" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
<thead>
    <tr>
        <th class="type" style="background-color:#3E8996; text-align:center;">유형</th>
        <th class="name" style="background-color:#3E8996; text-align:center;">기관명</th>
        <th class="addr" style="background-color:#3E8996; text-align:center;">주소</th>
        <th class="lnk" style="background-color:#3E8996; text-align:center;">링크</th>
    </tr>
</thead>
<tbody>
                <%
                int pn=0;
                
                pageNum=request.getParameter("page");
            	
            	
            	if (pageNum==null) {
            		pn=1;
            	}
            	else {
            		pn=Integer.parseInt(pageNum);
            	}
                	
                welDAO bbsDAO = new welDAO();
                	
                ArrayList<dao> list1 = new ArrayList<dao>();
                list1=bbsDAO.getList(pageNumber,locat);
                
                    
             	for(int i = 0; i < list1.size(); i++)
                {
                %>
                
                <tr height="30">
        		<td class="type"><%=list1.get(i).getType()%></td>
            	<td class="name"><%=list1.get(i).getName() %></td>
                <td class="addr"><%=list1.get(i).getAddr() %></td>
              <td class="lnk"><a href="<%=list1.get(i).getLink()%>">바로가기</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <% if (pageNumber!=1) {
            	%>
            	<center>
            	<a href="page2.jsp?pageNumber=<%=pageNumber-1%>">이전</a>
            	</center>
            	<%
            }
            	if (bbsDAO.nextPage(pageNumber+1,locat,"복지관")) {
            		%>
            	<center>
            	<a href="page2.jsp?pageNumber=<%=pageNumber+1 %>">다음</a>
            	</center>
            <% }%>
</div>
<% if (userId=="admin") {
	%>
	<button class="write" type="button" onclick="location.href='page2-1.jsp'">
	글작성</button>
	<%
} else {
}
	%>
          </section>
              </div>
              
              <footer id="footerSection">
              ● 노인 복지 포털<br>
        	  온라인 노인 복지관<br>
        	진하빈 | 전은규 | 김수민<br>
        	Copyright 2022. 은하수. All rights reserved.  
              </footer>
              
      
  
  
  </body>
</html>


