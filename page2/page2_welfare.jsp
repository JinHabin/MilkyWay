<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %> 
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>요양시설 정보</title>
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
String usrId=null;
String usrName=null;
usrId=(String)session.getAttribute("userID");
usrName=(String)session.getAttribute("userName");
if (usrId==null) {%>
	<div class="goOtherMenu">
	<ul class="ul2">
	        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
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
	        <li><button class="btn2" type="button" onclick="location.href='page3.jsp'">건강/혜택</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
	        <li><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
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
          <form action="page2_welfare.jsp" method="get">
            <ul class="ul2">
                <li>지역 선택</li>
                <li><select class="option2" name="loc">
                    <option class="o3" value="all">전체</option>
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
int id, ref,pageNumber,pn,np,flag;
int rownum=0,rn=0;
Connection conn=null;
Statement stmt=null;
String sql=null;
String pageNum,f="";
String locat,loc="",lnk;

ResultSet rs=null;

locat = request.getParameter("loc");
if (locat==null) {
	locat="all";
	sql="select * from welfaredata where type='요양시설' order by id desc";
}
else {
	if (locat.equals("j")) {
		loc="중구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("all")) {
		sql="select * from welfaredata where type='요양시설' order by id desc";
	}
	else if (locat.equals("nw")) {
		loc="노원구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("gn")) {
		loc="강남구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("gb")) {
		loc="강북구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("sc")) {
		loc="서초구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	
	else if (locat.equals("yc")) {
		loc="양천구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("mp")) {
		loc="마포구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("gs")) {
		loc="강서구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("ep")) {
		loc="은평구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("jr")) {
		loc="종로구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("ys")) {
		loc="용산구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("sd")) {
		loc="성동구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("gj")) {
		loc="광진구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("jr")) {
		loc="증랑구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("sb")) {
		loc="성북구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("db")) {
		loc="도봉구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("sd")) {
		loc="서대문구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("gc")) {
		loc="금천구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("kr")) {
		loc="구로구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("ydp")) {
		loc="영등포구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("kd")) {
		loc="강동구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("sp")) {
		loc="송파구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else if (locat.equals("ka")) {
		loc="관악구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
	else {
		loc="동대문구";
		sql="select * from welfaredata where type='요양시설' and location='"+loc+ "' order by id desc";
	}
}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/wpproject?serverTimezone=UTC";
		conn=DriverManager.getConnection(jdbcurl,"root","00000001");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		
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
				lnk=rs.getString("link");
				%>
			
			<tr height="30">
			<td class="type" align="center"><%=rs.getString("type")%></td>
			
			<td class="name" align="center"><%=rs.getString("name") %></td>
			<td class="addr" align="center"><%=rs.getString("addr") %></td>
			<td class="lnk">
			<a href="<%=lnk %>">바로가기</a></td>
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
		    	  <td><a href="?page=<%=i %>&flag=<%=flag %>&loc=<%=locat%>"><%=i %></a></td>
		    	  <%
		    	  if (np%10==0) {
		    		  flag=flag+1;
		    		  np=np+1;
		    		  %>
		    		  <td><a href="?page=<%=np %>&flag=<%=flag %>&loc=<%=locat%>">다음</a></td>
		    		  <%
		    	  }
		      
		      }
		      %>
		      </tr>
		      </table>
		      <button class="write" type="button" onclick="location.href='page2-1.jsp'">
		              기관등록</button>

	          </div>
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



