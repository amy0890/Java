<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/mypage.css" type="text/css">
    <link rel="stylesheet" href="css/accountinfo.css" type="text/css">
    <link rel="stylesheet" href="css/update_accountinfo.css" type="text/css">
    <link rel="stylesheet" href="css/orderlist.css" type="text/css">
    <link rel="stylesheet" href="css/table.css" type="text/css">
    <link rel="stylesheet" href="css/mypage_withdrawal.css" type="text/css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="script/update_accountinfo.js" defer></script>
    <script type="text/javascript" src="script/mypage_withdrawal.js" defer></script>
    <script type="text/javascript" src="script/mypage.js" defer></script>    
    <title>SOFAS KOREA</title>
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="mypage_wrap">
        <div class="mypage_fixed">
            <div class="fixed_top">
				<div class="mypage_hi">Hi, ${sessionScope.memberInfo.member_name}</div>
                <div class="mypage_point">
                    <div>나의 SOFAS Point는&nbsp;</div>
                    <div>${sessionScope.memberInfo.point} 점</div>
                    <div>&nbsp;입니다.</div>
                </div>
            </div>
            <div class="fixed_bottom">
                <ul>
                    <li><a href="MyPage.do?pg=account">계정관리</a></li>
                    <li><a href="MyPage.do?pg=orderlist">주문조회</a></li>
                    <li><a href="MyPage.do?pg=qnalist">문의내역</a></li>
                </ul>
            </div>
        </div>

        <div>
            <div class="mypage_welcome">
                Hi, 만나서 반가워요<br>
				나의 <span>SOFAS Family</span>
                <p>SOFAS를 방문해주셔서 감사합니다. 이곳에서 SOFAS Family 장점을 모두 확인해보세요!</p>
            </div>
            <div class="mypage_changed">
                <div class="page_div">
                <!--여기서 부터 페이지에 맞게 갈아끼우기-->
                <c:set var="pg" value="${param.pg}"/>
                <c:choose>
                	<c:when test="${empty pg or pg eq 'account'}">
                		<jsp:include page="mypage_accountinfo.jsp" />	
                	</c:when>
                	<c:when test="${pg eq 'updateAccount'}">
                		<jsp:include page="mypage_update_accountinfo.jsp" />    
                	</c:when>
                	<c:when test="${pg eq 'orderlist'}">
                		<jsp:include page="mypage_orderlist.jsp" />   
                	</c:when>
					<c:when test="${pg eq 'orderDetails'}">
                		<jsp:include page="mypage_details.jsp" />
                	</c:when>
                	<c:when test="${pg eq 'qnalist'}">
                		<jsp:include page="mypage_qna.jsp" />    
                	</c:when>
                	<c:when test="${pg eq 'withdrawal'}">
                		<jsp:include page="mypage_withdrawal.jsp" /> 
                	</c:when>
                	<c:when test="${pg eq 'review'}">
                		<jsp:include page="mypage_review.jsp" /> 
                	</c:when>
                </c:choose>
                <!--여기까지 페이지에 맞게 갈아끼우기-->
            </div>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />
</body>
</html>