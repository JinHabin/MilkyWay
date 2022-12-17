<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="dao.bean.ndao" %>
    <%@ page import="dao.bean.notDAO" %>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
	<link rel="stylesheet" href="basicdesign.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body {
width : 1200px;
}

        .main {
            text-align : center;
            margin : 0 auto;
        }
		header {
        	height : 150px;
        	border : 3px solid #3e8996;
        	margin : 10px;
        	border-radius : 30px;
        }
        .board {
            width:700px;
            margin-left : 30px;
            margin-right : 100px;
			heightr : 1000px;
			
        }
		.writeinfo {
			width : 700px;
			height : 60px;
		}
		.readinfo {
			height : 30px;
		}
		.titleInfo {
			width : 700px;
			font-size : 20px;
		}
		.tname {
			width : 100px;
			
		}
		.ttime {
			width : 600px;
			
		}
		.writebtn {
		width : 100%;
		height: 20px;
		text-align : right;
		}

</style>
</head>
<body>
<div class="main">
    <header onclick="location.href='main.main.jsp'">
    <img class="titleimage" src="logo.png"/>
    </header>
</div>

<%
String userId=null;
String userName=null;


userId=(String)session.getAttribute("userID");
userName=(String)session.getAttribute("userName");

int id=0;

if (request.getParameter("id")!=null) {
	id=Integer.parseInt(request.getParameter("id"));
}


ndao bbs=new notDAO().showPage(id,"n");
%>
<div class="board">
	<div class="writeinfo">
		<table class="readinfo">
			<tr><td colspan="2" class="titleInfo"><%=bbs.getTitle()%></td></tr>
			<tr>
				<td class="tname"><%=bbs.getName()%></td>
				<td class="ttime"><%=bbs.getWtime()%></td>
			</tr>
		</table>
		
	</div><br>
		<hr>
	
		<% if(userId=="admin") {
			%>
		<div class="writebtn">
			<button type="button" onclick="location.href='noticeModify.jsp?id=<%=id%>'">수정</button>
			<button type==button" onclick="location.href='notice-delete-db.jsp?id=<%=id%>'">삭제</button>
		</div>
		<%
		} else {
			
		}
		%>
		
		<div class="contentinfo">
		<%=bbs.getContent()%>
		</div>

</div>



</body>
</html>