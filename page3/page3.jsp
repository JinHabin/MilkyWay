<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>page3</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="page3.css">
<script type="text/javascript">
    function changeContent1() {
        homewelfare.style.visibility="visible";
        lifeWelfare.style.visibility="hidden";

        let b1=document.getElementById("b1");
        b1.classList.add("a1");
        let b2=document.getElementById("b2");
        b2.classList.remove("a1");

    }
    function changeContent2() {
        homewelfare.style.visibility="hidden";
        lifeWelfare.style.visibility="visible";

        let b1=document.getElementById("b1");
        b1.classList.remove("a1");
        let b2=document.getElementById("b2");
        b2.classList.add("a1");

    }

    function changeMenu1() {
        let bb1=document.getElementById("bb1");
        bb1.classList.add("a1");
        let bb2=document.getElementById("bb2");
        bb2.classList.remove("a1");
    }
    function changeMenu2() {
        let bb1=document.getElementById("bb1");
        bb1.classList.remove("a1");
        let bb2=document.getElementById("bb2");
        bb2.classList.add("a1");
    }
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
	        <li><button class="btn2" type="button">커뮤니티</button></li>
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
    <div id="subborder">
        <h2><center><b>건강/혜택</b></center></h2></div><br>
</div>
<div class="sub">
  <nav>
      <ul class="ul1">
          <li class="n"><button id="bb1" class="btn a1" type="button">서비스</button></li>
          <li class="n"><button id="bb2" class="btn" type="button" onclick="location.href='page3-health.jsp'">건강관리</button></li>
      </ul>
  </nav>
</div>

  <section>
      <div id = "subMenu">
          <div class="a">
          <center>
              <ul class="ul2">
                  <li class="n"><button id="b1" class="btn3 a1" type="button" onclick="changeContent1()">복지</button></li>
                  <li class="n"><button id="b2" class="btn3" type="button" onclick="changeContent2()">혜택</button></li>
              </ul>
          </center>
          </div>
      </div>
<div class="a" id="homewelfare">

      <h3>노인 장기 요양 보험 제도</h3><br>
      고령이나 노인성 질병 등으로 일상생활을 혼자서 수행하기 어려운 이들에게 신체활동 및 일상생활 지원 등의 서비스를 제공하여<br>
      노후 생활의 안정과 그 가족의 부담을 덜어주기 위한 사회보험제도<br>
      <h4>신청대상</h4><br>
      소득수준과 상관없이 노인장기요양보험가입자(국민건강보험 가입자와 동일)와 그 피부양자<br>
      의료급여수급권자로서 65세 이상 노인과 65세 미만의 노인성 질병이 있는 자<br>
      <h4>급여대상</h4>
      65세 이상 노인 또는 치매, 중풍, 파킨스병 등 노인성 질병을 앓고 있는 65세 미만인 자 중<br>
      6개월 이상의 기간 동안 일상생활을 수행하기 어려워 장기요양서비스가 필요하다고 인정되는 자<br>
      <br>
      <a href="https://www.mohw.go.kr/react/policy/index.jsp?PAR_MENU_ID=06&MENU_ID=06390301&PAGE=1&topTitle=" style="color:blue">더 알아보기</a>
      <hr>

      <h3>노인 주거 복지 시설</h3><br>
      노인주거복지시설”은 생계급여 또는 의료급여 수급자이거나 부양을 받지 못하는 등의 65세 또는 입소비용을 전액 부담하고<br>
      단독취사 등 독립생활이 가능한 60세 이상의 노인이<br>
      가정과 같은 주거공간에서 일상생활에 필요한 편의를 제공받을 수 있는 시설<br>
      <h4>노인 주거 복지시설 종류</h4>
      양로시설 :  노인을 입소시켜 급식과 그 밖에 일상생활에 필요한 편의를 제공함을 목적으로 하는 시설<br>
      노인공동생활가전 : 노인들에게 가정과 같은 주거여건과 급식, 그 밖에 일상생활에 필요한 편의를 제공함을 목적으로 하는 시설<br>
      노인복지주택 : 노인에게 주거시설을 임대하여 주거의 편의·생활지도·상담 및 안전관리 등 일상생활에 필요한 편의를 제공함을 목적으로 하는 시설<br><br>
      <a href="https://www.mohw.go.kr/react/policy/index.jsp?PAR_MENU_ID=06&MENU_ID=06390106&PAGE=6&topTitle=노인주거복지시설" style="color:blue">더 알아보기</a><br>
      <hr>

      <h3>재가노인 복지시설</h3><br>
      정신적, 신체적인 이유로 독립적인 일상생활을 수행하기 곤란한 노인과 노인부양가정에 필요한 각종 서비스를 제공함으로써,<br>
      노인이 가족 및 친지와 더불어 건강하고 안정된 노후 생활을 영위할 수 있도록 함과 동시에<br>
            노인부양으로 인한 가족의 부담을 덜어주기 위한 시설<br>
      <h4>이용 대상</h4>
      <b>장기요양 급여 수급자</b><br>
      <p>장기요양급여수급자 이외의 자중 기초수급권자 및 부양의무자로부터 적절한 부양을 받지 못하는 자로서
      혼자서 일상생활을 수행하기 어려워 재가서비스의 제공이 필요한 자</p>

      - ʼ08.7.1일 이전에 국가 및 지방자치단체로부터 운영비를 지원받는 시설을 이용 하고 있는 장기요양급여수급자 이외의 자 중 “기초수급권자” 및 “실비이용자”<br>
      <br>
      <a href="https://www.mohw.go.kr/react/policy/index.jsp?PAR_MENU_ID=06&MENU_ID=06390402&PAGE=2&topTitle=" style="color:blue">더 알아보기</a><br>
      <hr>

      <h3>노인 맞춤 돌봄 서비스 사업</h3><br>
      서비스 목적<br>
      일상생활 영위가 어려운 취약노인에게 적절한 돌봄서비스를 제공하여 안정적인 노후생활 보장, 노인의 기능・건강 유지 및 악화 예방 <br>
      <h4>서비스 대상</h4>
      만 65세 이상 1국민기초생활수급자, 2차상위계층 또는 3기초연금수급자로서 유사 중복사업 자격에 해당되지 않는 자<br>
      (다만, 시장・군수・구청장이 서비스가 필요하다고 인정하는 경우 예외적으로 제공 가능)<br>
      독거・조손・고령부부 가구 노인 등 돌봄이 필요한 노인<br>
      신체적 기능 저하, 정신적 어려움(인지저하, 우울감 등) 등으로 돌봄이 필요한 노인 - 고독사 및 자살 위험이 높은 노인(특화서비스)<br><br>
      <a href="https://www.mohw.go.kr/react/policy/index.jsp?PAR_MENU_ID=06&MENU_ID=06390104&PAGE=4&topTitle=" style="color:blue">더 알아보기</a><br>
      <hr>

      <h3>노인 보호 전문기관 설치 운영</h3><br>
      급속한 인구 노령화와 핵가족화 등에 따라 가족간 갈등 및 노인부양부담 증대 등으로 노인학대사례가 계속 증가하여<br>
      이를 전문적이고 체계적으로 대처하여 노인인권을 보호하는 한편, 노인학대 예방 및 노인인식개선 등을 통한 노인의 삶의 질 향상 도모 <br>
      <h4>서비스 내용</h4>
      노인학대 예방 강화, 노인학대 개입 강화를 통한 노인인권 보호와 노인학대 재발 방지를 위한 행위자 상담, 교육 및 사후관리 강화를 지역노인보호전문기관을 통해 제공한다.<br><br>
      <a href="http://www.noinboho.or.kr" style="color:blue">더 알아보기</a><br>
      <hr>

</div>
      <div class="a" id="lifeWelfare" visibility="none">
            <ol><li>노인기초연금
      <ul><li>만 65세 이상이면서 소득 인정액이 일정 수준보다 낮다면, 노인 기초연금 대상자에 해당돼 월 최대 30만 원을 수급할 수 있습니다.<br>
       주소지 주민센터나 가까운 국민연금공단 지사에 방문해 신청이 가능하며, 보건복지부 콜센터 129를 통해서 상담받을 수 있습니다.</li>
      </ul></li><br>
      <li>독감 접종 무료, 대상포진 접종 할인 혜택
      <ul><li>독감, 폐렴 무료접종혜택</li>
<li> 대상포진 예방접종</li>
<li>일반건강보험자 5만원 기초생활수급자 12만8천원 차상위계층 8만원 지원가능</li></ul></li><br>
<li>교통비 지원
<ul><li>만 65세 이상 어르신 교통카드 발급 시 수도권 도시철도, 지하철 무료이용가능</li></ul></li><br>
<li>통신비 지원
    <ul><li>기초연금 수령자 대상 매월 통신비 2만2천원 이상 지불시 최대 1만 1천원까지 통신비 지원가능</li>
        <li>2만2천원 이하 이용시 통신요금 50% 지원가능</li>
    </ul></li><br>
                <li>에너지 바우처
                    <ul><li>생계급여와 의료급여 수급자일시 여름철(7~9월) 전기요금할인혜택 가능</li></ul>
                </li><br>
                <li>경로우대 공제혜택
                    <ul><li>만 65세 이상 노인과 살고 있을시 자녀는 연말정산시 연간 1인당 100만원까지 소득공제 가능</li>
                        <li>만 70세 이상 부모님 부양시 1인당 150만원까지 소득공제혜택</li>
                    </ul></li><br>
                <li>건강검진 서비스
                    <ul><li>65세 이상이라면 생애주기별 건강검진 무료혜택</li>
                        <li>기본 검진 외 골밀도, 노인 건강검진 등 추가검진에 대한 납부면제혜택</li>
                    </ul>
                </li>
            </ol>
      </div>
  </section>
</body>
</html>
