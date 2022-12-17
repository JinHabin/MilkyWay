<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
 
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
 
<% request.setCharacterEncoding("UTF-8"); %>    <!-- 받는 모든 문자열을 UTF-8로 인코딩한다. -->
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>community</title>
</head>
<body>
 
    <%
        
        String userID = null;
    
        if(session.getAttribute("userID") != null ){
            userID = (String) session.getAttribute("userID");
        }
        
        int bbsID = 0;
        
        if(request.getParameter("bbsID") != null){    
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        
        if(bbsID == 0){    
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = 'community.jsp'");
            script.println("</script>");
        }
        
        Bbs bbs = new BbsDAO().getBbs(bbsID);
        
        if(!userID.equals(bbs.getUserID())){    //유저 아이디를 확인 다를경우 알림문 출력
            
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href = 'community.jsp'");
            script.println("</script>");
            
        }    else    {
                
                BbsDAO bbsDAO = new BbsDAO();
     
                int result = bbsDAO.delete(bbsID);
     
                if(result == -1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('오류 발생')");
                    script.println("history.back()");
                    script.println("</script>");
                }
     
                else {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'community.jsp'");
                    script.println("</script>");
                }
     
            }
        
        
    %>
</body>
</html>
