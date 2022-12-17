<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
        .main {
            text-align : center;
            margin : 0 auto;
        }
        header {
            height : 150px;
            border : 3px solid #3e8996;
            border-radius:30px;
            margin : 10px;
        }
        .board {
            width:800px;
            margin-left : 100px;
            margin-right : 100px;
          border : 1px solid #999999;
         
        }

        .t1 {
          text-align : center;
            width : 300px;
          border : 1px solid #909090;
            font-size : 17px;
            height : 25px;
        }
        .t2 {
          width : 500px;
            height : 25px;
            border : 1px solid #909090;
            font-size : 17px;
        }
        .t3 {
            width : 100%;
        }
        .t4 {
            float : right;
        }


</style>
</head>
<body>
<div class="main">
    <header onclick="location.href='main.main.jsp'">
    <img class="titleimage" src="logo.png"/>
    </header>
</div>
<div class="board">
<form action="center-insert-db.jsp" method="post">

<table>
  <tr>
  <td class="t1">종류 </td>
  <td>
    <select name="type">
      <option value="w">복지관</option>
      <option value="y">요양시설</option>
    </select>
  </td>
  </tr>
  <tr>
  <td class="t1">기관명 </td>
  <td><input class="t2" type="text" name="wName" /></td>
</tr>
  <tr></tr>

<tr>
  <td class="t1">기관 주소 </td>
  <td><input class="t2" type="text" name="wAddr"/></td>
</tr>
  <tr></tr>
    <tr>
      <td class="t1">전화 번호 </td>
      <td><input class="t2" type="text" name="wNumber"/></td>
    </tr>
  <tr></tr>
<tr>
  <td class="t1">소속구 </td>
  <td><input class="t2" type="text" name="wGu"/></td>
</tr>
  <tr></tr>
  <tr>
    <td class="t1">페이지 링크</td>
    <td><input class="t2" type="text" name="wlink"/></td>
  </tr>
  <tr></tr>
</table>
    <div class="t3">
        <input class="t4" type="submit" value="등록하기"/>
    </div>
</form>
</div>
</body>
</html>