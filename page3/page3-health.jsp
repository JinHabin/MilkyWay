<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>혜택</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="basicdesign.css">
    <link rel="stylesheet" href="page3_health.css">
    
<script type="text/javascript">
    function changeContent2() {
        lifeWelfare.style.visibility="visible";
        medic.style.visibility="hidden";
        let b2=document.getElementById("b2");
        b2.classList.add("a1");
        let b3=document.getElementById("b3");
        b3.classList.remove("a1");
    }
    function changeContent3() {
        lifeWelfare.style.visibility="hidden";
        medic.style.visibility="visible";
        let b2=document.getElementById("b2");
        b2.classList.remove("a1");
        let b3=document.getElementById("b3");
        b3.classList.add("a1");
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
	        <li class="n"><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
	        <li class="n"><button class="btn41" type="button">회원가입</button></li>
	        <li class="n"><button class="btn42" type="button">로그인</button></li>
	    </ul>
	</div>
	<%
	
}
else {%>
<div class="goOtherMenu">
	<ul class="ul2">
	        <li class="n"><button class="btn2" type="button" onclick="location.href='page2.jsp'">복지관 정보</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='notice_read.jsp'">공지사항</button></li>
	        <li class="n"><button class="btn2" type="button" onclick="location.href='community.jsp'">커뮤니티</button></li>
	        <li class="n"><div class="showname"><%=usrName %>님 반갑습니다.</div></li>
	    </ul>
	</div>
<%	
}
%>
<div class="main">
    <header onclick="location.href='main.jsp'">
    <img class="titleimage" src="logo.png"/></header>
</div>
<div class="goOtherMenu1">
    <div id="subborder">
    <!-- <i class="fa-solid fa-heart-pulse fa-4x"></i> -->
    <h2><center><b>건강/혜택</b></center></h2></div><br>
</div>

<div class="sub">
  <nav>
      <ul class="ul1">
          <li class="n"><button id="bb1" class="btn" type="button" onclick="location.href='page3.jsp'">서비스</button></li>
          <li class="n"><button id="bb2" class="btn a1" type="button">건강관리</button></li>
      </ul>
  </nav>
</div>

  <section>
      <div id = "subMenu">
          <div class="a">
              <ul class="ul2">
                  <li class="n"><button id="b2" class="btn3 a1" type="button" onclick="changeContent2()">건강에 좋은 음식</button></li>
                  <li class="n"><button id="b3" class="btn3" type="button" onclick="changeContent3()">운동 습관 갖기</button></li>
              </ul>
          </div>
      </div>

<div class="a" id="lifeWelfare" visibility="none">
	          <ol><li>적당한 체중을 유지하자
              <ul><li>기초 대사량과 활동량이 감소하므로 열량 섭취를 감소시킨다. 격렬한 운동은 피하고 규칙적으로 걷기 등 가벼운 운동으로 적당한 체중을 유지한다.
              </li></ul>
          </li><br>
          <li>규칙적으로 식사를 하고 다양한 음식을 골고루 섭취하자
              <ul><li>노년기에는 식품 섭취량이 줄어들고 다양한 음식을 먹기가 어려워져 비타민, 칼슘, 철분, 아연 등의 영양소가 부족해지기 쉽다.
              <br>따라서 살코기, 콩류, 우유, 과일, 채소 등 음식을 골고루 먹어야 한다.
              </li></ul>
          </li><br>
          <li>단백질은 양질을 선택하여 알맞게 섭취하자
              <ul><li>노인들의 단백질 필요량은 성인과 다르지 않으므로 적당한 양의 동물성 식품을 섭취하여 단백질 필요량을 충족시켜 주어야 한다.<br>
                  하지만 지방이 많은 육류의 섭취는 줄이도록 한다.
              </li></ul>
          </li><br>
          <li>단순당질은 피하고 지방은 식물성 기름을 우선으로 섭취하자
              <ul><li>과다한 당질과 열량 섭취는 혈액 중의 중성지방과 혈당을 올리기 쉽다. 혈청 콜레스테롤은 나이가 듦에 따라 증가하며 폐경 이후 여자에 있어 더욱 증가한다.<br>
              육류와 버터에 많은 포화지방산보다 식물성 기름(팜유, 야자유 제외)이나 등푸른 생선에 함유된 기름의 섭취로 심혈환계 질환을 예방하자.
              </li></ul>
          </li><br>
			<li>칼슘을 충분히 섭취하자
              <ul><li>노년기에는 소변으로 칼슘이 많이 빠져나가는 반면 흡수는 잘 안된다. 칼슘은 우유,치즈,유제품,멸치 등뼈째 먹는 생선에 풍부하며 우유가 잘 받지 않는 경우는 찬우유는 피하고, 식후 바로 마시거나 요구르트, 치즈, 두유, 유당 가수분해 우유를 이용한다.
              </li></ul>
          </li><br>
          <li>짠 음식은 피하고, 싱겁게 먹자
              <ul><li>노인은 미각의 감퇴 등으로 음식의 간을 더욱 많이 하게 된다. 과다한 소금 섭취는 고혈압, 위암의 원인이 될 수 있으므로 염장 식품의 섭취를 줄이고 음식의 간도 줄이며 다른 향신료나 조미료를 이용하여 맛을 돋운다.
              </li></ul>
          </li><br>
          <li>치아가 좋지 않으면 적절한 조리법을 활용해 섭취량을 증가시킨다
              <ul><li>노인의 영양 불균형은 치아가 원인인 경우가 많다. 치아가 좋지 못하면 식사 섭취에 많은 제약을 받게 되므로 평소 치아 상태와 구강 위생을 건강하게 유지해야 한다.<br>
              치아 상태가 나빠졌을 때는 음식을 다져서 조리 하거나 잘게 잘라서 먹으면 도움이 된다. 또 물김치나 동치미 등과 같은 식욕을 북돋워주는 식품을 먹는 것도 도움이 될 수 있다.
              </li></ul>
          </li><br>
          <li>적당한 운동과 휴식을 취하자
              <ul><li>노년기에는 운동량 부족, 수분 섭취 부족, 소화기 운 동 저하, 식사량 감소로 변비가 생기기 쉬우므로 신체 상태에 적합한 가벼운 운동과 휴양을 하도록 한다.
              </li></ul>
          </li><br>
          <li>술은 절제하고, 물을 충분히 마신다 
              <ul><li>과다한 음주는 식욕을 저하시키고 결식의 원인이 될 수있다. 술을 마실 때는 그 양을 제한하도록 한다. 노년기엔 갈증을 잘 느끼지 못해 탈수가 자주 일어날 수 있으므로 하루 여섯 잔 이상 물을 마셔야 한다. 
              </li></ul>
          </li>
          </ol>
</div>

<div class="a" id="medic">
	<ol><li>유산소 운동은 매일 하는 것이 좋다.
              <ul><li>걷거나 가벼운 조깅, 실내 자전거타기 등이 대표적인 유산소운동이다.
              </li></ul>
          </li><br>
          <li>근력 강화를 위한 근력 운동을 소홀히 하지 않아야 한다. 
              <ul><li>무리하게하면 좋지않으나저항성운동은 근위축,골다공증,골절의 예방 등 많은 이점이 있다.
              </li></ul>
          </li><br>
          <li>구체적인 장소와 시간을 정해두고 하는 것이 좋다.
              <ul><li>유산소 운동은 일반적으로 하루에 30분 정도, 한번에 30분을 지속적으로 하기보다는 하루에 몇 치례로 나누어 운동하는 것을 권장한다.
              저항성 운동(근력 운동)은 주2-3회 정도가 적당하다.
              </li></ul>
          </li><br>
          <li>긴장을 풀고 편안한 자세에서 부드럽게 시작하여 점진적으로 양을 늘려가야 한다.
              <ul><li>휴식과 운동을 잘 조화시켜 과도하게 무리를 주는 일이 없도록 해야 한다.<br>
              </li></ul>
          </li><br>
			<li>질병이 있는 경우 주의해서 운동한다.
              <ul><li>질병을 갖고 있는 경우 운동이 오히려 기존 질병을 악화시킬 수 있다.<br>
              주의가 필요한 운동으로는 협심증,심한 고혈압 또는 심한관절염, 골다공증 등이 있다.<br>
              이때는 질병 상태에 맞춰 운동 방법을 처방받아 전문가의 감독에 따라 실시한다.
              </li></ul>
          </li><br></ol>
          
</div>


  </section>


</body>
</html>
