<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/header.css?ver" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/home.css?ver=1" />
    <link rel="stylesheet" href="css/bestitem.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <script src="script/home.js" defer></script>
    <script src="script/sofalist.js" defer></script>
    <title>SOFAS KOREA</title>
</head>

<body>
<c:if test="${param.err != null}">
	<script>
		alert("에러가 발생하였습니다(${param.err})");
	</script>		
</c:if>

<jsp:include page="header.jsp" />
    <div class="home_wrap">

        <div class="main_first">
            <img src="img/home/home_sofas.png">
            <div class="main_first_fonts">
                <div>
                    <p style="font-weight: bolder; font-size: 25px;  margin-bottom: 5px;"> Your simple guide to buying a new sofa </p>
                    <p>Choosing a new sofa can feel a bit overwhelming. Sit back and relax with our easy tips to help make the process hassle-free.</p>
                    <P style="font-weight: bolder;  margin-top: 5px;  color: #484848;"> Read tips on how to buy a new sofa! </P> <br>
                    <button class="now_show" onclick="location.href='Sofalist.do'">now show</button>
                </div>
            </div>
        </div>

        <div class="main_second">
            <div class="main_second_fonts">
            <p style="font-weight: bolder; font-size: 28px; margin-bottom: 5px; ">마음에 쏙 드는 새로운 소파 </p> 
                <p style=" color: #484848;">올 시즌 새로운 소파 디자인의 최신 컬렉션을 만나보세요. 오래된 인기 제품에 새로운 색상을 입혀 분위기를 바꿀 수도 있어요.<br> 
                크기와 가격대가 다양하기 때문에 마음에 드는 소파를 찾으실 수 있을 거예요.</p>
            </div>
            <div class="main_second_btn">
                <button class="sofa_show" onclick="location.href='Sofalist.do'">모든 소파 보러 가기</button>
            </div>
        </div>
        <div class="main_sofas">
            <div class="photo_sofas1"><img src="img/home/home_sofa1.png"></div>
            <div class="photo_sofas2"><img src="img/home/home_sofa2.png"></div>
            <div class="photo_sofas3"><img src="img/home/home_sofa3.png"></div>
        </div>
     
        <div class="main_notice">
            <div>
                <div class="notice_boxs">
                    <div class="boxs_div">
                        <p class="icons"><i class="fas fa-wrench"></i></p>
                        <p style="font-weight: bolder; font-size: 18px;">A/S 서비스</p>
                        <p style="font-size: 14px; margin-top: 5px;">구매로부터 1년 무상 수리 서비스</p>
                    </div>
                </div>
                <div class="notice_boxs">
                    <div class="boxs_div">
                        <p class="icons"><i class="fas fa-leaf"></i></p>
                        <p style="font-weight: bolder; font-size: 18px;">친환경 소재</p>
                        <p style="font-size: 14px; margin-top: 5px;">생분해 원료부터 직접 제작하는 프리미엄 소파 </p>
                    </div>
                </div>
                <div class="notice_boxs">
                    <div class="boxs_div">
                        <p class="icons"><i class="fas fa-couch"></i></p>
                        <p style="font-weight: bolder; font-size: 18px;">인체공학 라운딩 설계</p>
                        <p style="font-size: 14px; margin-top: 5px;">설계부터 디자인까지 건강을 위한 가구</p>
                    </div>
                </div>
            </div>
        </div>

            <jsp:include page="bestitem.jsp" />


        <a id="toTop" href="#"><i class="fas fa-arrow-alt-circle-up" style="font-size: 30px;"></i></a>

    
   </div> <!--home_wrap div-->
<jsp:include page="footer.jsp" />
</body>
</html>